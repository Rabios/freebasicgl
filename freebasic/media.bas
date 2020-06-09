'' Created By Rabia Alhaffar In 17/March/2020

'' OpenAL For Playing Audio And Sounds
#include "AL/al.bi"
#include "AL/alut.bi"
#include "AL/alext.bi"

'' TRUE And FALSE
#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE (-1)
#endif

sub init_openal()
    alutInit(0,0)
end sub

function init_sound_buffer(file as string) as Aluint
    return alutCreateBufferFromFile(file)
end function

sub close_openal()
    alutExit()
end sub