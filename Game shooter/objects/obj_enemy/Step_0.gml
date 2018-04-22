vsp = vsp + grv;

/*
Med denne funktion "place_meeting" kan man tjekke position for en kollision med et andet objekt.
dette if statement tjekker om hvorvidt obj_enemy koliderer med obj_wall. på den vandrette plan.
*/
if (place_meeting(x+hsp,y,obj_wall))
{
    while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
	    x = x + sign(hsp);
	}
	hsp = -hsp;
}	
x = x + hsp;


if (place_meeting(x,y+vsp,obj_wall))
{
    while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
	    y = y + sign(vsp);
	}
	vsp = 0;
}	
y = y + vsp;

// dette if statement tjekker om hvorvidt obj_enemy koliderer med obj_wall. på den lodrette plan.
if (!place_meeting(x,y+1,obj_wall)) 
{
   sprite_index = spr_enemyJ;
   /*
   image_speed bestemmer hvor hurtigt frames skal skifte mellem den sprite obj_enemy er blevet tildelt
   i dette tilfælde er det spr_enemy som er blevet sat til 0 fordi den står stille.
   */
   image_speed = 0;
   // her bestemmer den at hvis obj_enemy bevæger sig op eller ned skal den skifte frames.
   if (sign(vsp) > 0) image_index = 1; else image_index = 0;   
}
else
{
    image_speed = 1;
	// her bestemmer vi hvilken sprite der skal bruges hvis at obj_enemy ikke bevæger sig vandret.
	if (hsp == 0)
	{
	sprite_index = spr_enemy;
	}
    else
	{
		// hvis obj_enemy bevæger sig vandret bruger den spriten spr_enemyR
	    sprite_index = spr_enemyR;
	}	
}
/*
"Image_xscale" Denne værdi angiver den vandrette skalring, som er blevet andvendt på dit sprite
Som er blevet tildelt til spirtes nuværende placering.
*/
if (hsp != 0) image_xscale = sign(hsp);




