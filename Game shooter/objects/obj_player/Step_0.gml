/* I dette if statement bestemmes der hvilke knapper 
der skal kospondere til den retning spilleren bevæger sig i.
Hvad if statementet gør,er at det stiller gamemaker et spørgsmål, og hvis hvad der står inden for paranteserne er opfyldt køres statementet ellers kører else statementet.
keyboard_check er til at benytte A & D tasterne
vk_space fortæller koden at spacebar er til at hoppe
det samme med vk_right er højre piletast
og vk_left er venstre piletast.
*/
if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);
}
else
{
// dette stykke kode bestemmer at hvis ingen knapper trykkes så skal spilleren ikke bevæge sig.
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

/* 
i denne del udregnes der hvilke bevægelser spilleren fortager sig. her bruger jeg tre nye integers som jeg har defineret i create koden.
hsp integeren er til vandrette bevægelser.
vsp integeren er til lodrette bevægelser.
grav integeren er tyngdekræften.
herefter beregner den så den lodrette bevægelse vsp og addere den til vsp integeren. 
*/

/*
I denne del bliver "var" funktionen brugt, og hvad "var" gør er at den tager en af variablerne (fx key_left)  og kun køre den i loop midlertidigt.
Grunden til at jeg har sat dem op key_right - key_left er fordi, Når man trykker key_right, vil den give 1 og key_left vil give 0.
Der ved vil move give = 1. Hvis man trykker key_left vil den give -1 og key_right vil give 0, så vil move give = -1. Hvis du vælger at trykke,
key_right og key_left så vil det give 1 - 1 = 0 så move = 0 og det vil resultere i at du ikke bevæger dig. 
*/
var move = key_right - key_left;
/*
Det der bliver gjort her er at indsætter vores  bevægelses hastighed altså (walksp = walkspeed) Vi gav variablen walksp = 4, og vi ved at når vi trykker
key_right eller key_left får vi 1 eller -1. Jeg multiplicere vores move med variablen walksp. Så 1*4 = 4 pixels til højre og -1*4= -4 pixels til venstre.
*/
hsp = move * walksp;

//Det der sker her, er at vi kan bevæge os med tyndekraften (grv) "Så vi kan falde"

vsp = vsp + grv;

/* 
Her bestemmes der hvor højt spilleren skal hoppe når space trykkes.
dette if statement 
*/
//Så hvis man står på jorden og du trykker på space, vil du bevæge dig opad med en vsp(vertikal hastighed) på -7.
if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
vsp = -7;

}


/*
Hvad placemeeting gør, er at den tjekker om der er en kollision altså et sammenstød mellem obj_player og obj_wall.
*/
if (place_meeting(x+hsp,y,obj_wall))
{
	/*
	Så det vi gør her er at vi laver en placemeeting for hvis der ikke er en kollision. 
	While bliver benyttet her, som er næsten det samme som if. Vi stiller et spørgsmål inde for nogle (), hvis det vi skriver er sandt vil den gøre alt vi gør inde for {}.
	Forskellen mellem et While statement og et if statement, er at et while statement vil fortsætte med at gøre de ting der står indefor {} i et loop indtil det ikke længere er sandt.
	En forskel på et while statemnt er at vi har SIGN funktionen involveret. Det SIGN gør er at den gir enten 1 eller -1, afhængiet af den variabel vi gir den er positiv eller negativ (hsp)
	Eksempel: Hvis vi gik til højre ville hsp være 4, så SIGN hsp vil være 1, og venstre ville SIGN hsp være -1.
	*/
    while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		/*
		Det der sker her er at x bliver adderet med SIGN(hsp) som er 1 eller -1.
		Det, det her gør et at så længe der ikke er en kollison med 1 pixel i retningenen vi bevæger os, så bliver funktionen loopet.
		*/
	    x = x + sign(hsp);
	}
	/*
	Jeg sætter hsp til 0 da der ikke er en grund til at rykke os mere, da vi ved at der skal til at ske en kollision.
	*/
	hsp = 0;
}	
x = x + hsp;



/*
Her laver jeg den vandrette kollision. Den vandrette er meget ens med den lodrette kollision, da man faktisk bare skal ændre på hsp til vsp (vandrette hastighed) samt ændre de x+, og placer det efter y+.
*/
if (place_meeting(x,y+vsp,obj_wall))
{
    while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		/*
		Vi ændre også på x til y her da det nu er på den vertikale plan.
		*/
	    y = y + sign(vsp);
	}
	vsp = 0;
}	
y = y + vsp;



//Jeg laver animations here imorgen <3

//Her kommer et punkt der hedder Animation.
// Hvad jeg gør her er, at jeg har lavet en masse sprites. Spr_Player,PlayerJ,PlayerR Alle 3 sprites er en forskellig bevægelse. 
//Sprite_index betyder at jeg tager en spesefik Sprite. Så det man ser med at vi laver et IF til et sign også VSP er at vi tager sprite 0 og 1, og sætter dem,
//til at den ved hvis vi falder skal de bruge falde sprite index 1 og hvis vi hopper skal den bruge den der ligner vi lige har sat af. 
// For Player of PlayerR Laver jeg et ELSE det betyder at hvis if (!place_meeting(x,y+1,obj_wall)) Ikke passer så passer det under.


/*
Det jeg kommer til her er noget som hedder Animation.
if statementet bliver benyttet igen her da der bliver arbejdet med kollisions igen, 
*/ 
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



