vsp = vsp + grv;

// Med denne funktion "place_meeting" kan man tjekke position for en kollision med et andet objekt.
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

// "spirte_index" er en funktion som indlæser det givet "sprite" altså "spr_enemyJ" i dette tilfælde
/* "Image_speed" Denne variable bestemmer sådan set bare hvilken hastighed Gamemaker skal rotere mellem de givede billeder.
 Altså dette hjælper med at skabe en animation.*/
if (!place_meeting(x,y+1,obj_wall)) 
{
   sprite_index = spr_enemyJ;
   image_speed = 0;
   if (sign(vsp) > 0) image_index = 1; else image_index = 0;   
}
else
{
    image_speed = 1;
	if (hsp == 0)
	{
	sprite_index = spr_enemy;
	}
    else
	{
	    sprite_index = spr_enemyR;
	}	
}
// "Image_xscale" Denne værdi angiver den vandrette skalring, som er blevet andvendt på dit sprite
// Som er blevet tildelt til spirtes nuværende placering.

if (hsp != 0) image_xscale = sign(hsp);




