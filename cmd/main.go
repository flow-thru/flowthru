package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"time"

	"github.com/flow-thru/flowthru/internal/http/rest"
	"github.com/flow-thru/flowthru/internal/repository/pg"
)

func main() {
	_, err := pg.NewDB(
		fmt.Sprintf(
			"host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
			os.Getenv("FLOWTHRU_DB_HOST"),
			os.Getenv("FLOWTHRU_DB_PORT"),
			os.Getenv("FLOWTHRU_DB_USER"),
			os.Getenv("FLOWTHRU_DB_PASSWORD"),
			os.Getenv("FLOWTHRU_DB_NAME")))
	if err != nil {
		log.Fatal(err)
	}
	router := rest.Handler()

	// handlers for API
	getR := router.Methods(http.MethodGet).Subrouter()

	s := http.Server{
		ReadTimeout:  5 * time.Second,   // max time to read request from the client
		WriteTimeout: 10 * time.Second,  // max time to write response to the client
		IdleTimeout:  120 * time.Second, // max time for connections using TCP Keep-Alive
	}

	// start the server
	go func() {
		l.Info("Starting server on port 5000")

		err := s.ListenAndServe()
		if err != nil {
			l.Error("Error starting server", "error", err)
			os.Exit(1)
		}
	}()

	// Trap sigterm or interupt and gracefully shutdown the server
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	signal.Notify(c, os.Kill)

	// Block until a signal is received.
	sig := <-c
	log.Println("Got signal:", sig)

	// Gracefully shutdown the server, waiting max 30 seconds for current operations to complete
	ctx, _ := context.WithTimeout(context.Background(), 30*time.Second)
	s.Shutdown(ctx)

	///
	router.Handle("/public/test", publicTest())
	http.Handle("/", router)
	fmt.Println("flowing thru at http://localhost:5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}
