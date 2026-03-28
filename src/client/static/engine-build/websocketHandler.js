const socket = new WebSocket("ws://127.0.0.1:8080/ws")

socket.onopen = () => {
    console.log("opened websocket connection")
    socket.send("heyyyyy bitchesssssss")
}

socket.onmessage = (message) => {
    console.log("message recieved:", message.data)
}

socket.onerror = (error) => {
    console.error("websocket error:", error)
}

socket.onclose = () => {
    console.log("closed websocket connection")
}