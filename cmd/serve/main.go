package main

import (
	"log/slog"
	"net/http"
	"os"

	sloggin "github.com/samber/slog-gin"

	"github.com/gin-gonic/gin"
)

func main() {
	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))

	engine := gin.New()

	engine.Use(sloggin.New(logger))
	engine.Use(gin.Recovery())

	engine.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "hello world",
		})
	})
	if err := engine.Run(":8080"); err != nil {
		os.Exit(1)
	}
}
