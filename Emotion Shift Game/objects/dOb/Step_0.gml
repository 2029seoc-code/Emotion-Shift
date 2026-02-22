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

// GRAVITY
y_speed += 0.3;


// --------------------
// BREAK WALL POWER
// --------------------
if (place_meeting(x + x_speed, y, eOb))
{
    with (instance_place(x + x_speed, y, eOb))
    {
        instance_destroy();
    }
}


// --------------------
// MOVE HORIZONTAL
// --------------------
x += x_speed;


// --------------------
// VERTICAL COLLISION (normal walls only)
// --------------------
if (place_meeting(x, y + y_speed, oSolid))
{
    while (!place_meeting(x, y + sign(y_speed), oSolid))
    {
        y += sign(y_speed);
    }

    // Jump when on ground
    if (keyboard_check_pressed(vk_up))
    {
        y_speed = -5;
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