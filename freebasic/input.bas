''Created By Rabia Alhaffar In 17/March/2020
#include "GL/glfw.bi"

'' TRUE And FALSE
#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

function key_down(ByRef key as Integer) as integer
    return glfwGetKey(key)
end function