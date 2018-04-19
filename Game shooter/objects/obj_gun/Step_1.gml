/// @description Gun begin steps
//Det jeg gør her er at jeg placere våbnet på vores obj_player med x og y
// Grunden til jeg har lagt +10 på Y er fordi vi vil ikke have et "delay" på våbnet når vi bevæger os.
//Hvis jeg ikke havde +10 på vores Y ville våbnet have en forsinkelse når vi bevæger os. Sammentidig vil våbnet også ikke være i hovedt på ham.
x = obj_player.x;
y = obj_player.y+10;
// //Hvad denne funktion gør er "hvor er vores mus på skærmen" samt gør den så vores pistol peger mod vores mus.
image_angle = point_direction(x,y,mouse_x,mouse_y);

firingdelay = firingdelay - 1; 
recoil = max(0, recoil - 1);

if (mouse_check_button (mb_left)) && (firingdelay < 0)
{
	//Her sætter jeg recoil til 4 og Fireingdelay til 5 så der er 5 frames mellemrum imellem hvert skud.
   recoil = 4;
   firingdelay = 5;
   //Det jeg gør her, er at jeg faktisk giver vores Gun et skud, samt hastighed. 
   with  (instance_create_layer(x,y,"Bullets",obj_bullet))
   {
	   //Her bliver hastigheden givet, og jeg har også lavet en retning hvor der er blevet tilføjet en "random_range" som gør at der er lidt tilfældig "spread" på skudne.
    speed = 25;
	direction = other.image_angle + random_range (-3,3);
	image_angle = direction;
   }

}
//Det vi gør her er at tilføje vore "recoil" Den funktion lengthdir_x gør at vi at et x og et y kordinat og vores våben skal have et "kick back" 
// Men vi kender ikke de kordinater den skal kick back til, kun en vinkel og pixels. så hvad denne funktion gør er at den faktisk udregner det for dig.
//Og rykker dig til de x og y du skal for at ramme den position, ligger du så de to sammen. BOMB! du har dit kordinat.
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);
//Det jeg har gjort her er at hvis vi kigger til højre flipper vores våben til højre, og hvis vi kigger til venstre flipper den til venstre.
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}