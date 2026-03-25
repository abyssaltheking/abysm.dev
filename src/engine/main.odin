package main

import "core:fmt"
import raylib "vendor:raylib"

main :: proc() {
    raylib.InitWindow(800, 600, "abysm.dev")
    raylib.SetExitKey(raylib.KeyboardKey.KEY_NULL)
    raylib.SetTargetFPS(60)

    display_menu := true
    game_active := false
    menu := create_menu()
    player := new_player(400, 300, 50, 50)

    for !raylib.WindowShouldClose() {
        raylib.ClearBackground(raylib.ColorFromHSV(93, 0, 16.1))
        raylib.BeginDrawing()
        
        // these two if statements for display_menu had to be separated because when trying to get play_button_pressed,
        // it would flip back to true somehow whenever you clicked the play button, so it'd only go away for a frame
        // a bit verbose now but it works so im not going to fix it unless i find a better way to do this
        if play_button_pressed {
            display_menu = false
        }

        if raylib.IsKeyPressed(raylib.KeyboardKey.ESCAPE) {
            display_menu = !display_menu
        }

        if display_menu { 
            draw_menu(&menu)
        } else {
            accept_player_movement(&player)
            draw_player(&player)
        }
        
        raylib.EndDrawing()
    }

    raylib.CloseWindow()
}