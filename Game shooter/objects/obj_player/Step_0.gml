/// @description Step command
// Her bestemmer jeg de taster som skal have funktion til bevægelse af spiller. 

if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
// Her sætter jeg den til at "udregne" bevægelser vores player gør. Hvis han bevæger sig på hsp så er det 
// hsp = move * walksp som er vores walkspeed. Under der, er det vores VSP som er vsp + gsp der er tyndekraften
// så Vsp = vertikal hastighed + grv tyndekraft. Vi har sat tyndekraften til 0.3 vi kan sagtens ændre den så 
//spilleren hopper højere eller lavere.
var move = key_right - key_left;

hsp = move * walksp; 

vsp = vsp + grv;
// Her gør jeg så når man trykker på ens tast "Space" så kopper man.
if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
vsp = -7;

}

//Her har jeg lavet en "place meeting" med vores horisont hastighed. Det, det her betyder er at hvis vores
// Spiller står inde for x+hsp,y,obj_wall altså hvis vores spiller står på eller kommer i kontakt med 
//obj_wall så vil der være on kolision. Hvad dette gør er så vores person ikke falder igennem jorden.
//Sign er at hvis noget er positivt, altså hvis man er i kontakt med OBJ_WALL som er jorden så bliver den positiv, og hvis man ikke er bliver den negativ.
if (place_meeting(x+hsp,y,obj_wall))
{
    while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
	    x = x + sign(hsp);
	}
	hsp = 0;
}	
x = x + hsp;

// Det vi gør her, er præcis det samme som HSP bare med VSP, så det er bare på den vertikale plan. 
if (place_meeting(x,y+vsp,obj_wall))
{
    while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
	    y = y + sign(vsp);
	}
	vsp = 0;
}	
y = y + vsp;

//Her kommer et punkt der hedder Animation.
// Hvad jeg gør her er, at jeg har lavet en masse sprites. Spr_Player,PlayerJ,PlayerR Alle 3 sprites er en forskellig bevægelse. 
//Sprite_index betyder at jeg tager en spesefik Sprite. Så det man ser med at vi laver et IF til et sign også VSP er at vi tager sprite 0 og 1, og sætter dem,
//til at den ved hvis vi falder skal de bruge falde sprite index 1 og hvis vi hopper skal den bruge den der ligner vi lige har sat af. 
// For Player of PlayerR Laver jeg et ELSE det betyder at hvis if (!place_meeting(x,y+1,obj_wall)) Ikke passer så passer det under.
if (!place_meeting(x,y+1,obj_wall)) 
{
   sprite_index = spr_playerJ;
   image_speed = 0;
   if (sign(vsp) > 0) image_index = 1; else image_index = 0;   
}
else
{
    image_speed = 1;
	if (hsp == 0)
	{
	sprite_index = spr_player;
	}
    else
	{
	    sprite_index = spr_playerR;
	}	
}
//Hvis vi nu satte vores image_speed til 1 ville han kikke den anden vej. Detter er bare hvilken vej player peger. Så det vi har gjort her
//Er at hvis vores HSP er vegativ vil det betyde vi går til vestre og hvis den er positiv bevæger vi os til højre.
if (hsp != 0) image_xscale = sign(hsp);




