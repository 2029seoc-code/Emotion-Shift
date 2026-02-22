x_speed = 0;
y_speed += 0.8;

if (keyboard_check(vk_right))
{
    x_speed = walk_speed;
    image_xscale = -1;
}
else if (keyboard_check(vk_left))
{
    x_speed = -walk_speed;
    image_xscale = 1;
}


// ---- HORIZONTAL COLLISION
if (place_meeting(x + x_speed, y, oSolid) || place_meeting(x + x_speed, y, eOb))
{
    while (!(place_meeting(x + sign(x_speed), y, oSolid) || place_meeting(x + sign(x_speed), y, eOb)))
    {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;


// ---- VERTICAL COLLISION
if (place_meeting(x, y + y_speed, oSolid) || place_meeting(x, y + y_speed, eOb))
{
    while (!(place_meeting(x, y + sign(y_speed), oSolid) || place_meeting(x, y + sign(y_speed), eOb)))
    {
        y += sign(y_speed);
    }

    if (keyboard_check_pressed(vk_up))
    {
        y_speed = -10;
    }
    else
    {
        y_speed = 0;
    }
}
y += y_speed;


// Character switching
if (keyboard_check_pressed(ord("A")))
{
    instance_create_layer(x, y, layer, dOb);
    instance_destroy();
}
if (keyboard_check_pressed(ord("S")))
{
    instance_create_layer(x, y, layer, iObject);
    instance_destroy();
}
if (keyboard_check_pressed(ord("H")))
{
    instance_create_layer(x, y, layer, jOb);
    instance_destroy();
}


// Die
if (place_meeting(x, y, nOb)) room_restart();

// Check if player falls below the room
if (y > room_height) {
    // Restart the current room
    room_restart();
}