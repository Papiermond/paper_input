package paper_input

import "core:c"
import glfw "vendor:glfw"
import "core:mem"

key_callback :: proc "c" (window: glfw.WindowHandle, key, scancode, action, mods: c.int) {
    if key < 0 || key >= 512 do return
    if action == glfw.PRESS {
        global_input.keys_down[key] = true
        global_input.keys_pressed[key] = true
    } else if action == glfw.RELEASE {
        global_input.keys_down[key] = false
    }
}

mouse_button_callback :: proc "c" (window : glfw.WindowHandle, button, action, mods: c.int) {
    if button < 0 || button >= 8 do return
    if action == glfw.PRESS {
        global_input.mouse_down[button] = true
        global_input.mouse_pressed[button] = true
    } else if action == glfw.RELEASE {
        global_input.mouse_down[button] = false
    }
}

scroll_callback :: proc "c" (window: glfw.WindowHandle, xoffset, yoffset: f64) {
    global_input.scroll_delta += f32(yoffset)
}

is_key_down :: proc(key: Key) -> bool {
    idx := int(key)
    if idx < 0 || idx >= 512 do return false
    return global_input.keys_down[idx]
}

is_key_pressed :: proc(key: Key) -> bool {
    idx := int(key)
    if idx < 0 || idx >= 512 do return false
    return global_input.keys_pressed[idx]
}

is_mouse_button_down :: proc(button: Mouse_Button) -> bool {
    idx := int(button)
    if idx < 0 || idx >= 8 do return false
    return global_input.mouse_down[idx]
}

is_mouse_button_pressed :: proc(button: Mouse_Button) -> bool {
    idx := int(button)
    if idx < 0 || idx >= 8 do return false
    return global_input.mouse_pressed[idx]
}

get_mouse_position :: proc() -> [2]f32 {
    x, y := glfw.GetCursorPos(global_input.window)
    return {f32(x), f32(y)}
}

get_mouse_wheel_move :: proc() -> f32 {
    return global_input.scroll_delta
}

init_input :: proc(window: glfw.WindowHandle) {
    global_input.window = window
    glfw.SetKeyCallback(window, key_callback)
    glfw.SetMouseButtonCallback(window, mouse_button_callback)
    glfw.SetScrollCallback(window, scroll_callback)
}

begin_frame :: proc() {
    mem.zero_slice(global_input.keys_pressed[:])
    mem.zero_slice(global_input.mouse_pressed[:])
    global_input.scroll_delta = 0
}