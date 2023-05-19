package main

import "vendor:sdl2"
import "core:log"

WINDOW_TITLE  :: "WindowName"
WINDOW_WIDTH  := i32(800)
WINDOW_HEIGHT := i32(450)
WINDOW_POS_X  :: sdl2.WINDOWPOS_UNDEFINED
WINDOW_POS_Y  :: sdl2.WINDOWPOS_UNDEFINED
WINDOW_FLAGS  :: sdl2.WindowFlags{.SHOWN}

CTX :: struct {
    window:   ^sdl2.Window,
    renderer: ^sdl2.Renderer,

    quit:     bool,
    dt:       f64,
}

ctx := CTX{}

init_sdl :: proc() -> (ok: bool) {
    if sdl_res := sdl2.Init(sdl2.INIT_VIDEO); sdl_res < 0 {
        log.errorf("sdl2.init returned %v.", sdl_res)
        return false
    }

    ctx.window = sdl2.CreateWindow(WINDOW_TITLE, WINDOW_POS_X, WINDOW_POS_Y, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_FLAGS)
    if ctx.window == nil {
        log.errorf("sdl2.CreateWindow failed.")
        return false
    }

    ctx.renderer = sdl2.CreateRenderer(ctx.window, -1, {.ACCELERATED, .PRESENTVSYNC})
	if ctx.renderer == nil {
		log.errorf("sdl2.CreateRenderer failed.")
		return false
	}

    return true
}

render :: proc() {
    sdl2.RenderClear(ctx.renderer)

    sdl2.RenderPresent(ctx.renderer)
}

process_input :: proc() {
    event: sdl2.Event

    if !sdl2.PollEvent(&event) do return

    if event.type == .QUIT do ctx.quit = true
}

main :: proc() {
    context.logger = log.create_console_logger()

    ctx.quit = !init_sdl()

    now: u64  = sdl2.GetPerformanceCounter()
    last: u64 = 0

    defer sdl2.Quit()
    defer sdl2.DestroyWindow(ctx.window)
    defer sdl2.DestroyRenderer(ctx.renderer)

    for !ctx.quit {
        last = now
        now = sdl2.GetPerformanceCounter()

        ctx.dt = f64((now - last)) / f64(sdl2.GetPerformanceFrequency())

        if ctx.dt > 1 do ctx.dt = 0

        process_input()
        render()
    }
}