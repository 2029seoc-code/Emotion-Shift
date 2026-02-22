// SWITCH CHARACTER
if (keyboard_check_pressed(ord("C")))
{
    var new_player = instance_create_layer(x, y, layer, aObject);
    instance_destroy();
}

// MOVEMENT INPUT
var move = keyboard_check(vk_right) - keyboard_check(vk_left);
x_speed = move * walk_speed;

if (move != 0)
{
    image_xscale = -sign(move);
}

// APPLY GRAVITY
y_speed += 0.8;


// --------------------
// HORIZONTAL COLLISION (oSolid + eOb)
// --------------------
if (place_meeting(x + x_speed, y, oSolid) || place_meeting(x + x_speed, y, eOb))
{
    while (!(place_meeting(x + sign(x_speed), y, oSolid) || place_meeting(x + sign(x_speed), y, eOb)))
    {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;


// --------------------
// VERTICAL COLLISION (oSolid + eOb)
// --------------------
if (place_meeting(x, y + y_speed, oSolid) || place_meeting(x, y + y_speed, eOb))
{
    while (!(place_meeting(x, y + sign(y_speed), oSolid) || place_meeting(x, y + sign(y_speed), eOb)))
    {
        y += sign(y_speed);
    }

    // HIGH JUMP
    if (keyboard_check_pressed(vk_up))
    {
        y_speed = -11;   // change this number for jump height
    }
    else
    {
        y_speed = 0;
    }
}
y += y_speed;


// DIE ON SPIKES
if (place_meeting(x, y, nOb))
{
    room_restart();
}


// DIE IF OUTSIDE ROOM
if (x < 0 || x > room_width || y > room_height)
{
    room_restart();
}