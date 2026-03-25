package main

import "core:fmt"
import raylib "vendor:raylib"

Menu :: struct {
    play_button: bool,
    screen_width: i32,
    screen_height: i32,
    center_of_screen: raylib.Vector2
}

play_button_pressed := false

create_menu :: proc() -> Menu {
    screen_width := raylib.GetScreenWidth()
    screen_height := raylib.GetScreenHeight()
    center_of_screen := raylib.Vector2 { f32(screen_width) / 2, f32(screen_height) / 2 }

    play_button := raylib.GuiButton(centered_rectangle(center_of_screen.x, center_of_screen.y, 100, 50), "Play!")

    return Menu {
        play_button = play_button,
        screen_width = screen_width,
        screen_height = screen_height,
        center_of_screen = center_of_screen
    }
}

draw_menu :: proc(menu: ^Menu) {
    menu.play_button = raylib.GuiButton(centered_rectangle(menu.center_of_screen.x, menu.center_of_screen.y, 100, 50), "Play!")
    play_button_pressed = menu.play_button
    fmt.println(play_button_pressed)
}

centered_rectangle :: proc(x, y, width, height : f32) -> raylib.Rectangle {
    centered_x := x - (width / 2)
    centered_y := y - (height / 2)

    return raylib.Rectangle {
        x = centered_x,
        y = centered_y, 
        width = width,
        height = height
    }
}