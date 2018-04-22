//dette generer kameraet i banerne. 
cam = view_camera[0];
//denne follow funktion fortæller koden at den skal følge playeren. 
follow = obj_player; 

// dette halverere det automatiske genererede kameras størrelse 
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

//dette sætter et x og y koordinat til hvor kameraet starter.  
xTo = xstart;
yTo = ystart;