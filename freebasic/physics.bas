''Created By Rabia Alhaffar In 18/April/2020
''Physics Part
#include "GL/glut.bi"
function collision_rect(r1_x as integer,r1_y as integer,r1_w as integer,r1_h as integer,r2_x as integer,r2_y as integer,r2_w as integer,r2_h as integer) as integer
    return r1_x < r2_x + r2_w and r1_x + r1_w > r2_x and r1_y < r2_y + r2_h and r1_y + r1_h > r2_y
end function

function collision_circle(c1_x as integer,c1_y as integer,c1_r as integer,c2_x as integer,c2_y as integer,c2_r as integer) as integer
    return sqr (c1_x - c2_x * c1_x - c2_x) + (c1_y + c2_y * c1_y + c2_y) < c1_r + c2_r
end function
	  
function collision_circle_rect(c1_x as integer,c1_y as integer,c1_r as integer,r1_x as integer,r1_y as integer,r1_w as integer,r1_h as integer) as integer
    if (abs(c1_x - r1_x - r1_w / 2) > (r1_w / 2 + c1_r) or abs(c1_y - r1_y - r1_h / 2) > (r1_h / 2 + c1_r)) then return false endif
    if (abs(c1_x - r1_x - r1_w / 2) <= (r1_w / 2) or abs(c1_y - r1_y - r1_h / 2) <= (r1_h / 2)) then return true endif
    return (abs(c1_x - r1_x - r1_w / 2) - r1_w / 2 * abs(c1_x - r1_x - r1_w / 2) - r1_w / 2 + abs(c1_y - r1_y - r1_h / 2) - r1_h / 2 * abs(c1_y - r1_y - r1_h / 2) - r1_h / 2 <= (c1_r * c1_r))  
end function

function collision_rect_left_screen(rx as integer,rw as integer) as integer
    return rx <= rw * 0.5
end function

function collision_rect_right_screen(rx as integer,rw as integer) as integer
    return rx + rw >= glutGet(GLUT_SCREEN_WIDTH) + rw * 0.5
end function

function collision_rect_top_screen(ry as integer,rh as integer) as integer
    return ry <= rh * 0.5
end function

function collision_rect_bottom_screen(ry as integer,rh as integer) as integer
    return ry + rh >= glutGet(GLUT_SCREEN_HEIGHT) + rh * 0.5
end function

function collision_circle_top_screen(cy as integer,cvy as integer,cr as integer) as integer
    return cy + cvy < cr
end function

function collision_circle_bottom_screen(cy as integer,cvy as integer,cr as integer) as integer
    return cy + cvy > glutGet(GLUT_SCREEN_HEIGHT) - cr
end function

function collision_circle_left_screen(cx as integer,cvx as integer,cr as integer) as integer
    return cx + cvx < cr
end function

function collision_circle_right_screen(cx as integer,cvx as integer,cr as integer) as integer
    return cx + cvx > glutGet(GLUT_SCREEN_WIDTH) - cr
end function