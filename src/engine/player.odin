package main

import raylib "vendor:raylib"
import "core:math"
import "core:math/rand"

Player :: struct {
    x, y: f32, 
    width, height: i32,
    color: raylib.Color
}

new_player :: proc(x, y: f32, width, height: i32) -> Player {
    return Player {
        x = x,
        y = y,
        width = width,
        height = height,
        color = raylib.ColorFromNormalized(raylib.Vector4{rand.float32_range(0, 1), rand.float32_range(0, 1), rand.float32_range(0, 1), 1})
    }
}

accept_player_movement :: proc(player: ^Player) {
    if raylib.IsKeyDown(raylib.KeyboardKey.A) {
        player.x -= 5
    }

    if raylib.IsKeyDown(raylib.KeyboardKey.D) {
        player.x += 5
    }

    if raylib.IsKeyDown(raylib.KeyboardKey.W) {
        player.y -= 5
    }

    if raylib.IsKeyDown(raylib.KeyboardKey.S) {
        player.y += 5
    }
}

draw_player :: proc(player: ^Player) {
    raylib.DrawRectangle(
        i32(math.round_f32(player.x)), 
        i32(math.round_f32(player.y)), 
        player.width, 
        player.height, 
        player.color
    )
}