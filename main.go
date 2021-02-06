package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, World")
	})
	r.GET("/text", func(c *gin.Context) {
		c.String(200, "Hello, World")
	})
	r.GET("/simplejson", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"hello": "world",
		})
	})
	r.GET("/json", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"hello": "world",
			"array": [3]string{"a", "b", "c"},
		})
	})
	r.Run(":3000")
}
