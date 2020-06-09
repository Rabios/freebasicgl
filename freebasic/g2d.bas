'' Created By Rabia Alhaffar In 17/March/2020
'' OpenGL For Graphics
'' With It's Utilities,For Input And Easier OpenGL Development
'' 2D Graphics API
#include "GL/gl.bi"
#include "GL/glu.bi"
#include "GL/glext.bi"
#include "GL/glut.bi"
#include "GL/glfw.bi"
#include "fbgfx.bi"

'' TRUE And FALSE
#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

dim angle as integer
dim as truetype TT

sub init_tt()
    TT.init()
    TT.set_render_mode(FT_RENDER_MODE_NORMAL)
end sub

sub opengl_string(ByRef v as integer)
    glGetString(v)
end sub

sub clear_color(ByRef r as single,ByRef g as single,ByRef b as single)
    glClearColor(r,g,b,1)
    glClear(GL_COLOR_BUFFER_BIT)
end sub

sub draw_rect(ByRef x as integer,ByRef y as integer,ByRef w as integer,ByRef h as integer,ByRef r as single,ByRef g as single,ByRef b as single,ByRef m as integer) 
    glLoadidentity()
    if m = 1 then
        glBegin(GL_QUADS)
            glColor3f(r,g,b) 
            glVertex3f(x,y,-1000)
            glVertex3f(x + w,y,-1000)
            glVertex3f(x + w,y - h,-1000)
            glVertex3f(x,y - h,-1000)
        glEnd()
    endif
    if m = 0 then
        glBegin(GL_LINE_LOOP)
            glColor3f(r,g,b) 
            glVertex3f(x,y,-1000)
            glVertex3f(x + w,y,-1000)
            glVertex3f(x + w,y - h,-1000)
            glVertex3f(x,y - h,-1000)
        glEnd()
    endif

end sub

sub draw_line(ByRef x1 as integer,ByRef y1 as integer,ByRef x2 as integer,ByRef y2 as integer,ByRef r as single,ByRef g as single,ByRef b as single,ByRef s as integer) 
    glPointSize(s)
    glLoadidentity()
    glBegin(GL_LINES)    
        glColor3f(r,g,b) 
        glVertex3f(x1,y1,-1000)
        glVertex3f(x2,y2,-1000)
    glEnd()
    glPointSize(1)

end sub

sub draw_triangle(ByRef x1 as integer,ByRef y1 as integer,ByRef x2 as integer,ByRef y2 as integer,ByRef x3 as integer,ByRef y3 as integer,ByRef r as single,ByRef g as single,ByRef b as single,ByRef m as integer) 
    glLoadidentity()
    if m = 1 then
        glBegin(GL_TRIANGLES)
            glColor3f(r,g,b) 
            glVertex3f(x1,y1,-1000)
            glVertex3f(x2,y2,-1000)
            glVertex3f(x3,y3,-1000)
        glEnd()
    endif
    if m = 0 then
        glBegin(GL_LINE_LOOP)
            glColor3f(r,g,b) 
            glVertex3f(x1,y1,-1000)
            glVertex3f(x2,y2,-1000)
            glVertex3f(x3,y3,-1000)
        glEnd()
    endif

end sub

sub draw_circle(ByRef x as integer,ByRef y as integer,ByRef s as integer,ByRef r as single,ByRef g as single,ByRef b as single,ByRef m as integer)
     glLoadidentity()
     if m = 1 then
     glBegin(GL_TRIANGLE_FAN)
         glColor3f(r,g,b)
         glVertex3f(x,y,-1000)
         for angle as integer = 0 to 360 step 5
             glVertex3f(x + sin(angle) * s, y + cos(angle) * s,-1000)
         next
         glEnd()
     endif
     if m = 1 then
     glBegin(GL_LINE_LOOP)
         glColor3f(r,g,b)
         glVertex3f(x,y,-1000)
         for angle as integer = 0 to 360 step 5
             glVertex3f(x + sin(angle) * s, y + cos(angle) * s,-1000)
         next
         glEnd()
     endif
end sub

sub set_lighting(ByRef e as integer)
    if e = 1 then
        glEnable(GL_LIGHTING)
    endif
    if e = 1 then
        glDisable(GL_LIGHTING)
    endif
end sub

sub translate(ByRef x as integer,ByRef y as integer)
    glTranslatef(x,y,-1000)
end sub

sub scale(ByRef x as integer,ByRef y as integer)
    glScalef(x,y,-1000)
end sub

sub rotate(ByRef a as integer)
    glRotatef(a,0,0,-1000)
end sub

sub clear_rect(ByRef x as integer,ByRef y as integer,ByRef w as integer,ByRef h as integer)
    glEnable(GL_SCISSOR_TEST)
    glScissor(x,y,w,h)
    glClear(GL_COLOR_BUFFER_BIT)
    glDisable(GL_SCISSOR_TEST)
end sub

sub cut(ByRef x as integer,ByRef y as integer,ByRef w as integer,ByRef h as integer)
    glEnable(GL_SCISSOR_TEST)
    glScissor(x,y,w,h)
end sub

''You Might Need SOIL If You Want To Use This Function In FreeBASIC (To Load Textures)
'' In Basic4GL,Can Work Without SOIL,Use loadTex() For That
''http://www.lonesock.net/soil.html
''https://www.freebasic.net/forum/viewtopic.php?t=10217
sub draw_texture(ByRef t as ubyte ptr,ByRef x as integer,ByRef y as integer,ByRef w as integer,ByRef h as integer)
    glLoadIdentity() 
    glEnable(GL_TEXTURE_2D)
    glGentextures(1,t)
    glBindTexture(GL_TEXTURE_2D,t)
    glTexImage2D(GL_TEXTURE_2D,0,GL_RGB,w,h,GL_UNSIGNED_BYTE,GL_RGB,0,t)
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR)
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR) 
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S,GL_CLAMP)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T,GL_CLAMP)
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
    glBegin(GL_QUADS)
        glTexCoord2d(0,0)
        glVertex3f(x,y,-1000)
        glTexCoord2d(1,0)
        glVertex3f(x + w,y,-1000)
        glTexCoord2d(1,1)
        glVertex3f(x + w,y - h,-1000)
        glTexCoord2d(0,1)
        glVertex3f(x,y - h,-1000)
    glEnd()
    glDisable(GL_TEXTURE_2D)
    glDeleteTextures(1,t) ''Automatically Free/Unload Image From Memory
end sub

sub save_content()
    glPushMatrix()
end sub

sub restore_content()
    glPopMatrix()
end sub

sub draw_text(ByRef x as integer,ByRef y as integer,ByRef t as string,ByRef f as string,ByRef s as integer,ByRef r as integer,ByRef g as integer,ByRef b as integer)
    TT.set_size(s)
    TT.set_color(RGB(r,g,b))
    TT.print_text(x,y,t)
end sub
