
package auth

import (
	"encoding/json"
	"net/http"
	"errors"

	"github.com/auth0/go-jwt-middleware"
	"github.com/dgrijalva/jwt-go"
    "github.com/codegangsta/negroni"
)

// Middleware is an interface consisting of authentication middleware functions.
type Middleware interface {
    RequireLogin(http.Handler) *negroni.Negroni
}

// auth0 is a struct with attributes and methods relating to Auth0 integration
type auth0 struct {
    jwtMiddleware *jwtmiddleware.JWTMiddleware
}

// NewUserAuth takes in Auth0 credentials in order to create middleware that
// is utilized to require a login in order to access an API endpoint
func NewUserAuth(domain string, audience string) Middleware {
    jwtMiddleware := jwtmiddleware.New(jwtmiddleware.Options {
        ValidationKeyGetter: func(token *jwt.Token) (interface{}, error) {
            // Verify 'aud' claim
            aud := audience
            checkAud := token.Claims.(jwt.MapClaims).VerifyAudience(aud, false)
            if !checkAud {
                return token, errors.New("Invalid audience.")
            }
            // Verify 'iss' claim
            iss := domain
            checkIss := token.Claims.(jwt.MapClaims).VerifyIssuer(iss, false)
            if !checkIss {
                return token, errors.New("Invalid issuer.")
            }

            cert, err := getPemCert(domain, token)
            if err != nil {
                panic(err.Error())
            }

            result, _ := jwt.ParseRSAPublicKeyFromPEM([]byte(cert))
            return result, nil
        },
        SigningMethod: jwt.SigningMethodRS256,
    })
    return &auth0{jwtMiddleware}
}

// RequireLogin is a wrapper for a http.Handler.
// It leverages the negroni pkg to protect an API endpoint
func (auth *auth0) RequireLogin(handler http.Handler) *negroni.Negroni {
    return negroni.New(
        negroni.HandlerFunc(auth.jwtMiddleware.HandlerWithNext),
        negroni.Wrap(handler))
}

// JSONWebKeys is a struct that follows the formatting of the JSON Web Key Set (JWKS)
// for public keys.
type JSONWebKeys struct {
	Kty string `json:"kty"`
	Kid string `json:"kid"`
	Use string `json:"use"`
	N string `json:"n"`
	E string `json:"e"`
	X5c []string `json:"x5c"`
}

// Jwks contains JSON Web Key Sets
type Jwks struct {
    Keys []JSONWebKeys `json:"keys"`
}

// getPermCert gets the remote JWKS for an Auth0 account.
// Returns the certificate with the public key in PEM format.
func getPemCert(auth0Domain string, token *jwt.Token) (string, error) {
	cert := ""
	resp, err := http.Get("https://" + auth0Domain + "/.well-known/jwks.json")

	if err != nil {
		return cert, err
	}
	defer resp.Body.Close()

	var jwks = Jwks{}
	err = json.NewDecoder(resp.Body).Decode(&jwks)

	if err != nil {
		return cert, err
	}

	for k, _ := range jwks.Keys {
		if token.Header["kid"] == jwks.Keys[k].Kid {
			cert = "-----BEGIN CERTIFICATE-----\n" + jwks.Keys[k].X5c[0] + "\n-----END CERTIFICATE-----"
		}
	}

	if cert == "" {
		err := errors.New("Unable to find appropriate key.")
		return cert, err
	}

	return cert, nil
}

