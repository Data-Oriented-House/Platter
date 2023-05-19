package main

import "vendor:sdl2"
import "core:log"

WINDOW_TITLE  :: "WindowName"
WINDOW_WIDTH  := i32(800)
WINDOW_HEIGHT := i32(450)
WINDOW_POS_X  :: sdl2.WINDOWPOS_UNDEFINED
WINDOW_POS_Y  :: sdl2.WINDOWPOS_UNDEFINED
WINDOW_FLAGS  :: sdl2.WindowFlags{.SHOWN}

SDL_Context :: struct {
	window:   ^sdl2.Window,
	renderer: ^sdl2.Renderer,

	quit:     bool,
	dt:       f64,
}

initialize_sdl_window :: proc() -> (window: ^sdl2.Window, ok: bool) {
	if sdl_res := sdl2.Init(sdl2.INIT_VIDEO); sdl_res < 0 {
        log.errorf("sdl2.init returned %v.", sdl_res)
		ok = false
		return
    }

    window = sdl2.CreateWindow(
		title = "WindowName",
		x = sdl2.WINDOWPOS_UNDEFINED,
		y = sdl2.WINDOWPOS_UNDEFINED,
		w = 800,
		h = 450,
		flags = sdl2.WindowFlags{
			.SHOWN,
		},
	)

    if window == nil {
        log.errorf("sdl2.CreateWindow failed.")
		ok = false
        return
    }

	ok = true
	return
}

initialize_sdl_renderer :: proc(window: ^sdl2.Window) -> (renderer: ^sdl2.Renderer, ok: bool) {
    renderer = sdl2.CreateRenderer(window, -1, {
		.ACCELERATED,
		.PRESENTVSYNC,
	})

	if renderer == nil {
		log.errorf("sdl2.CreateRenderer failed.")
		ok = false
		return
	}

	ok = true
    return
}

render :: proc(renderer: ^sdl2.Renderer) {
    sdl2.RenderClear(renderer)
    sdl2.RenderPresent(renderer)
}

process_input :: proc(ctx: ^SDL_Context) {
    event: sdl2.Event
    if !sdl2.PollEvent(&event) do return
    if event.type == .QUIT {
		ctx.quit = true
	}
}

main :: proc() {
    context.logger = log.create_console_logger()

	ctx := &SDL_Context {}
	defer sdl2.Quit()

	window_ok: bool
	ctx.window, window_ok = initialize_sdl_window()
	defer sdl2.DestroyWindow(ctx.window)
	if !window_ok do return

	renderer_ok: bool
	ctx.renderer, renderer_ok = initialize_sdl_renderer(ctx.window)
	defer sdl2.DestroyRenderer(ctx.renderer)
	if !renderer_ok do return

    ctx.quit = false

    now: u64  = sdl2.GetPerformanceCounter()
    last: u64 = 0

    for !ctx.quit {
        last = now
        now = sdl2.GetPerformanceCounter()

        ctx.dt = f64((now - last)) / f64(sdl2.GetPerformanceFrequency())
        if ctx.dt > 1 do ctx.dt = 0

        process_input(ctx)
        render(ctx.renderer)
    }
}