CLIENT_DIR=src/client
ENGINE_DIR=src/engine
SERVER_DIR=src/server

client:
	cd $(CLIENT_DIR) && npm run dev

engine:
	odin run $(ENGINE_DIR)

server:
	cd $(SERVER_DIR) && go run .

engine-clean:
	sudo rm -rf /src/engine/build