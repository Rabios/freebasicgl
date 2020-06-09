''Created By Rabia Alhaffar In 17/April/2020
#include "GL/gl.bi"
#include "GL/glu.bi"
#include "GL/glext.bi"
#include "GL/glut.bi"
#include "GL/glfw.bi"
#include "fbgfx.bi"
#include "ttbas_easyapi.bas"
#include "g2d.bas"

'' TRUE And FALSE
#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

Var mouse_x = 0
Var mouse_y = 0
dim as truetype TT


sub init_window(ByRef w as integer,ByRef h as integer,ByRef t as string,ByRef f as integer)
    glfwInit()
    TT.init()
    TT.set_render_mode(FT_RENDER_MODE_NORMAL)
    if f = 1 then
        if glfwOpenWindow(glutGet(GLUT_SCREEN_WIDTH),glutGet(GLUT_SCREEN_HEIGHT),0,0,0,32,32,32,GLFW_FULLSCREEN) = 0 then
            glfwTerminate()
        endif
    endif
    if f = 0 then
        if glfwOpenWindow(w,h,0,0,0,32,32,32,GLFW_WINDOW) = 0 then
            glfwTerminate()
        endif
    endif
    glfwSetWindowTitle(t)
    
end sub

sub set_window_title(ByVal t as string)
    glfwSetWindowTitle(t)
end sub

sub debug_log(ByRef msg as string)
    print(msg)
end sub

sub key_down(ByRef k as integer)
    glfwGetKey(k)
end sub

sub render()
    glfwSwapBuffers()
end sub

sub close_window()
    glfwTerminate()
end sub

''For Game Loop,Use (glfwGetKey( GLFW_KEY_ESC ) = 1) and (glfwGetWindowParam( GLFW_OPENED ) = 1)
''Then Else Use glfwTerminate() Or close_window()