package main

import "vendor:sdl2"
import "core:log"

initialize_window :: proc() -> (window: ^sdl2.Window, ok: bool) {
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

	log.info("Initialized SDL2 window.")
	ok = true
	return
}

initialize_renderer :: proc(window: ^sdl2.Window) -> (renderer: ^sdl2.Renderer, ok: bool) {
    renderer = sdl2.CreateRenderer(window, -1, {
		.ACCELERATED,
		.PRESENTVSYNC,
	})

	if renderer == nil {
		log.errorf("sdl2.CreateRenderer failed.")
		ok = false
		return
	}

	log.info("Initialized SDL2 renderer.")
	ok = true
    return
}

CTX :: struct {
	window:   ^sdl2.Window,
	renderer: ^sdl2.Renderer,

	running:     bool,
	dt:       f64,
}

main :: proc() {
    context.logger = log.create_console_logger()

	defer sdl2.Quit()
	ctx := &CTX {
		running = true,
	}

	defer sdl2.DestroyWindow(ctx.window)
	{
		ok: bool
		ctx.window, ok = initialize_window()
		if !ok do return
	}

	defer sdl2.DestroyRenderer(ctx.renderer)
	{
		ok: bool
		ctx.renderer, ok = initialize_renderer(ctx.window)
		if !ok do return
	}

	{
		now: u64  = sdl2.GetPerformanceCounter()
		last: u64 = 0

		log.info("Entering main loop.")

		for ctx.running {
			last = now
			now = sdl2.GetPerformanceCounter()

			ctx.dt = f64((now - last)) / f64(sdl2.GetPerformanceFrequency())
			if ctx.dt > 1 {
				ctx.dt = 0
			}

			if event: sdl2.Event; sdl2.PollEvent(&event) {
				#partial switch event.type {
					case .QUIT: {
						log.info("Received QUIT event.")
						ctx.running = false
					}
				}
			}

			sdl2.RenderClear(ctx.renderer)
			sdl2.RenderPresent(ctx.renderer)
		}
	}
}