package main

import (
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	engine := gin.Default()
	engine.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "hello world",
		})
	})
	if err := engine.Run(":80"); err != nil {
		os.Exit(1)
	}
}
