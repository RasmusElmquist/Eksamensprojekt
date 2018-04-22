/* 
dette tjekker om spilleren er i live med follow funktionen som er beskrevet i create.
Follow er sat til at følge obj_player og hvis den gør det så følger den spilleren.
*/
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}


/* 
Dette gør så kameraet følger spilleren. 
Det giver spilleren af at kameraet bevæger sig pænt og ikke i en masse små bevægelser.
*/
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//dette gør at kameraet ikke bevæger sig uden for banen.
x = clamp(x ,view_w_half,room_width-view_w_half);
y = clamp(y ,view_h_half,room_height-view_h_half);

// Dette opdaterer kameraets position inden i de forskellige levels.
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
