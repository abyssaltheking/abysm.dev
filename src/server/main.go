package main

import (
	"mime"

	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/static"
)

func main() {
	mime.AddExtensionType(".js", "application/javascript")

	app := fiber.New()

	app.Get("/*", static.New("./build"))

	app.Listen(":8080")
}
