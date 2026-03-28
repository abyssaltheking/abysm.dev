package main

import "core:fmt"
import raylib "vendor:raylib"
import "core:math"
import "core:math/rand"

TRACKED_KEYS :: []raylib.KeyboardKey {
    .W, .S, .A, .D
}

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

get_player_input :: proc() -> i32 {
    player_input: i32

    for key, index in TRACKED_KEYS {
        if raylib.IsKeyDown(key) {
            player_input |= 1 << u32(index) 
        }
    }

    return player_input
}

accept_player_movement :: proc(player: ^Player) {
    if raylib.IsKeyDown(.A) do player.x -= 5
    if raylib.IsKeyDown(.D) do player.x += 5
    if raylib.IsKeyDown(.W) do player.y -= 5
    if raylib.IsKeyDown(.S) do player.y += 5
    fmt.println(get_player_input())
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