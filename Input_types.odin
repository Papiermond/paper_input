package paper_input

import "core:c"
import "vendor:glfw"

Key :: enum c.int {
    A       = glfw.KEY_A,
    B       = glfw.KEY_B,
    C       = glfw.KEY_C,
    D       = glfw.KEY_D,
    E       = glfw.KEY_E,
    F       = glfw.KEY_F,
    G       = glfw.KEY_G,
    H       = glfw.KEY_H,
    I       = glfw.KEY_I,
    J       = glfw.KEY_J,
    K       = glfw.KEY_K,
    L       = glfw.KEY_L,
    M       = glfw.KEY_M,
    N       = glfw.KEY_N,
    O       = glfw.KEY_O,
    P       = glfw.KEY_P,
    Q       = glfw.KEY_Q,
    R       = glfw.KEY_R,
    S       = glfw.KEY_S,
    T       = glfw.KEY_T,
    U       = glfw.KEY_U,
    V       = glfw.KEY_V,
    W       = glfw.KEY_W,
    X       = glfw.KEY_X,
    Y       = glfw.KEY_Y,
    Z       = glfw.KEY_Z,
    SPACE   = glfw.KEY_SPACE,
    ESCAPE  = glfw.KEY_ESCAPE,
    ENTER   = glfw.KEY_ENTER,
    LEFT    = glfw.KEY_LEFT,
    RIGHT   = glfw.KEY_RIGHT,
    UP      = glfw.KEY_UP,
    DOWN    = glfw.KEY_DOWN,
    ONE     = glfw.KEY_1,
    TWO     = glfw.KEY_2,
    THREE   = glfw.KEY_3,
    FOUR    = glfw.KEY_4,
}

Mouse_Button :: enum c.int {
    LEFT   = glfw.MOUSE_BUTTON_LEFT,
    RIGHT  = glfw.MOUSE_BUTTON_RIGHT,
    MIDDLE = glfw.MOUSE_BUTTON_MIDDLE,
}

Modifier_Keys :: enum c.int {
    SHIFT = glfw.KEY_LEFT_SHIFT,
    CONTROL = glfw.KEY_LEFT_CONTROL,
    ALT = glfw.KEY_LEFT_ALT,
    TAB = glfw.KEY_TAB,
}

Input_State :: struct {
    window : glfw.WindowHandle,
    keys_down : [512]bool,
    keys_pressed : [512]bool,
    mouse_down : [8]bool,
    mouse_pressed : [8]bool,
    scroll_delta : f32,
}


global_input : Input_State