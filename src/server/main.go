package main

import (
	"log"
	"mime"

	"github.com/gofiber/contrib/v3/websocket"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/static"
)

func main() {
	mime.AddExtensionType(".js", "application/javascript")

	app := fiber.New()

	app.Use("/ws", func(fiberContext fiber.Ctx) error {
		if websocket.IsWebSocketUpgrade(fiberContext) {
			return fiberContext.Next()
		}

		return fiber.ErrUpgradeRequired
	})

	app.Get("/ws", websocket.New(func(websocketConnection *websocket.Conn) {
		var (
			messageType int
			message     []byte
			err         error
		)

		for {
			if messageType, message, err = websocketConnection.ReadMessage(); err != nil {
				log.Println("read error:", err)
				break
			}

			log.Printf("recieved: %s", message)

			if err = websocketConnection.WriteMessage(messageType, message); err != nil {
				log.Println("write error:", err)
				break
			}
		}
	}))

	app.Get("/*", static.New("./build"))

	app.Get("/*", func(context fiber.Ctx) error {
		return context.SendFile("./build/index.html")
	})

	log.Fatal(app.Listen(":8080"))
}
