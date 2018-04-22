/* I dette if statement bestemmes der hvilke knapper der skal kospondere til den retning spilleren bevæger sig i.
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
i denne del udregnes der hvilke bevægelser spilleren fortager sig. her bruger vi tre nye integers som vi har defineret i create koden.
hsp integeren er til vandrette bevægelser.
vsp integeren er til lodrette bevægelser.
grav integeren er tyngdekræften.
herefter beregner den så den lodrette bevægelse vsp og addere den til vsp integeren. 
*/

/*
I denne del bliver "var" funktionen brugt, og hvad "var" gør er at den tager en af variablerne (fx key_left)  og kun køre den i loop midlertidigt.
Grunden til at vi har sat dem op key_right - key_left er fordi, Når man trykker key_right, vil den give 1 og key_left vil give 0.
Der ved vil move give = 1. Hvis man trykker key_left vil den give -1 og key_right vil give 0, så vil move give = -1. Hvis du vælger at trykke,
key_right og key_left så vil det give 1 - 1 = 0 så move = 0 og det vil resultere i at du ikke bevæger dig. 
*/
var move = key_right - key_left;
/*
Det der bliver gjort her er at indsætter vores  bevægelses hastighed altså (walksp = walkspeed) Vi gav variablen walksp = 4, og vi ved at når vi trykker
key_right eller key_left får vi 1 eller -1. vi multiplicere vores move med variablen walksp. Så 1*4 = 4 pixels til højre og -1*4= -4 pixels til venstre.
*/
hsp = move * walksp;

//Det der sker her, er at vi kan bevæge os med tyndekraften (grv) så vi kan falde
vsp = vsp + grv;

/* 
Her bestemmes der hvor højt spilleren skal hoppe når space trykkes.
dette if statement 
så hvis man står på jorden og der trykkes på space, vil du bevæge dig opad med en vsp(vertikal hastighed) på -7.
*/
if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
vsp = -7;

}



//Hvad placemeeting gør, er at den tjekker om der er en kollision altså et sammenstød mellem obj_player og obj_wall.

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
	vi sætter hsp til 0 da der ikke er en grund til at rykke os mere, da vi ved at der skal til at ske en kollision.
	*/
	hsp = 0;
}	
x = x + hsp;



/*
Her laver vi den vandrette kollision. Den vandrette er meget ens med den lodrette kollision, da man faktisk bare skal ændre på hsp til vsp (vandrette hastighed) samt ændre de x+, og placer det efter y+.
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

/*
I animation har vi lavet endnu et if statement. Det vi bruger If statementet til er at vi skal finde ud af om vi er i luften eller ej. når vi bruger spritet der hedder spr_playerJ.
Så det vi gør er at bruge et place_meeting igen MEN vi sætter et "!" foran place_meeting da det er for når vi IKKE står på jorden, altså er i kontakt, med kollisionen.
Ellers er (x,y+1,obj_wall) præcis det samme som det andet i vores Calculate movement altså så vi kan tjekke om vi er på jorden så vi kan hoppe.
*/

if (!place_meeting(x,y+1,obj_wall)) 
{
	/*
	Her skriver vi HVAD der sker hvis der ikke er en kollision med 1 pixel under os. Så det vi gør er at vi skriver, sprite_index. Når man skriver det, bliver
	det grønt og det betyder at det er en "ejendom" af objektet, det betyder at den fortæller hvilet sprite den skal bruge. Så hvad man skriver efter "=" er hvilket
	sprite den skal bruge, I dette tilfælde skal vi bruge spr_playerJ som er vores jump sprite. 
	*/
   sprite_index = spr_playerJ;
   
   /*
   image_speed er hvor hurtigt vores animation skal være. I dette tilfælde vil vi ikke have den skal have en hastighed fordi så ville det se unaturligt ud når der hoppes,
   at den skifter animation hurtigt, så vi vil bare vælge en af vores frames der skal vises, når vi hopper.   
   */
   image_speed = 0;
   
   /*
   hvis obj_player bevæger sig lodret vil image_index = 1 og hvis obj_player er stående på jorden er image_index = 0.
   */
   if (sign(vsp) > 0) image_index = 1; else image_index = 0;   
}
else
{
	/*
	Her under laver vi animationen for. når vi i kontakt med jorden. her bruges else statementet igen, Men med et stykke kode.
	Det vi gør her er at hvis vores kode if (!place_meeting(x,y+1,obj_wall)) ikke er sandt,(hvis der ikke hoppes).
	Det betyder vi står på jorden, og da det er en animation der skal køre skal vi have vores image_speed være sat til = 1.
	*/
    image_speed = 1;
	
	// her tjekkes der om den vandrette hastighed er = 0 
	if (hsp == 0)
	{
		/*
		hvis hsp = 0 bruges spriten spr_player
		*/ 
	sprite_index = spr_player;
	}
    else
	{
		// eller konkluderer vi at obj_player er i bevægelse og bruger derfor spr_playerR
	    sprite_index = spr_playerR;
	}	
}

/*
Dette sørger for at obj_player kigger den rigtige vej. Det gør man ved at vi igen bruger et if statement, at vi stiller Game maker et spørgsmål. 
Vi bruger også noget der hedder, image_xscale der beslutter vores vandrette vægt.
Hvis man sætter den til 1, ville der ikke være en ændring. Men hvis vi ændre vores xscale til 2. Vil vores stickfigur blive tykkere.
Det sjove er at hvis vi så ændre xscale til -1, vil han kigge den anden vej. Altså mod venstre, så det rotere spriten.
Så det vi gør er at vi siger at hvis hsp ikke er = 0, kigges der mod højre og hvis det er = -1 kigges der mod venstre. 
*/
if (hsp != 0) image_xscale = sign(hsp);


