if (done == 0)
{
	vsp = vsp + grv;

	
	if (place_meeting(x+hsp,y,obj_wall))
	{
	    while (!place_meeting(x+sign(hsp),y,obj_wall))
		{
		    x = x + sign(hsp);
		}
		hsp = 0;
	}	
	x = x + hsp;

	
	if (place_meeting(x,y+vsp,obj_wall))
	{
		/* dette if statement tjekker om hvorvidt liget falder ned hvis den gør det vil done være 1 
		og image_index vil også være 1 hvilket det betyder at spr_enemyD begynder at skifte frames 
		hvilket får det til at ligne at liget bevæger sig når den rammer jorden.
		*/
		if (vsp > 0)  
		{
		done = 1;
		image_index = 1;
		}
	    while (!place_meeting(x,y+sign(vsp),obj_wall))
		{
		    y = y + sign(vsp);
		}
		vsp = 0;
	}	
	y = y + vsp;
}