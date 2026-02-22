// Switch character
if (keyboard_check_pressed(ord("C")))
{
    var new_player = instance_create_layer(x, y, layer, aObject);
    instance_destroy();
}

// Horizontal movement
var moveX = keyboard_check(vk_right) - keyboard_check(vk_left);
x_speed = moveX * walk_speed;

if (moveX != 0)
{
    image_xscale = -sign(moveX);
}

// Vertical flying
var moveY = keyboard_check(vk_down) - keyboard_check(vk_up);
y_speed = moveY * 4;


// ---- HORIZONTAL COLLISION (oSolid + eOb)
if (place_meeting(x + x_speed, y, oSolid) || place_meeting(x + x_speed, y, eOb))
{
    while (!(place_meeting(x + sign(x_speed), y, oSolid) || place_meeting(x + sign(x_speed), y, eOb)))
    {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;


// ---- VERTICAL COLLISION (oSolid + eOb)
if (place_meeting(x, y + y_speed, oSolid) || place_meeting(x, y + y_speed, eOb))
{
    while (!(place_meeting(x, y + sign(y_speed), oSolid) || place_meeting(x, y + sign(y_speed), eOb)))
    {
        y += sign(y_speed);
    }
    y_speed = 0;
}
y += y_speed;


// Die
if (place_meeting(x, y, nOb)) room_restart();