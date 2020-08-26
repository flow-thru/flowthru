package main

import (
	"context"
	"flag"
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
	var wait time.Duration
	flag.DurationVar(&wait, "graceful-timeout", time.Second*15, "the duration for which the server gracefully wait for existing connections to finish - e.g. 15s or 1m")
	flag.Parse()

	db, err := pg.NewDB(
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

	userRouter := rest.UserHandler(db)

	srv := &http.Server{
		Addr: "0.0.0.0:5000",
		// Good practice to set timeouts to avoid Slowloris attacks.
		WriteTimeout: time.Second * 15,
		ReadTimeout:  time.Second * 15,
		IdleTimeout:  time.Second * 60,
		Handler:      userRouter,
	}

	// Run our server in a goroutine so that it doesn't block.
	go func() {
		log.Println("Running user service at 0.0.0.0:5000")
		if err := srv.ListenAndServe(); err != nil {
			log.Println(err)
		}
	}()

	c := make(chan os.Signal, 1)
	// We'll accept graceful shutdowns when quit via SIGINT (Ctrl+C)
	// SIGKILL, SIGQUIT or SIGTERM (Ctrl+/) will not be caught.
	signal.Notify(c, os.Interrupt)

	// Block until we receive our signal.
	<-c

	// Create a deadline to wait for.
	ctx, cancel := context.WithTimeout(context.Background(), wait)
	defer cancel()
	// Doesn't block if no connections, but will otherwise wait
	// until the timeout deadline.
	srv.Shutdown(ctx)
	// Optionally, you could run srv.Shutdown in a goroutine and block on
	// <-ctx.Done() if your application should wait for other services
	// to finalize based on context cancellation.
	log.Println("shutting down")
	os.Exit(0)
}
