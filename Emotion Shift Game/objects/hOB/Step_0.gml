// destroy if hitting wall
if (place_meeting(x, y, oSolid))
{
    instance_destroy();
}