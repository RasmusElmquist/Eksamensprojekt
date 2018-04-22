/*
Det vi gør her er at vi placere våbnet på vores obj_player med x og y.
vi har så valgt at + med 1 på y da våbnet skulle sidde lidt lavere fra origo. 
*/

x = obj_player.x;
y = obj_player.y+1;

//Hvad denne funktion gør er at den peger våbnet mod musen.

image_angle = point_direction(x,y,mouse_x,mouse_y);


firingdelay = firingdelay - 1; 

//max kommandoen gør at recoil retunere den største værdi af de to outputs.
recoil = max(0, recoil - 1);

if (mouse_check_button (mb_left)) && (firingdelay < 0)
{
   //Her sætter vi recoil til 4 og Fireingdelay til 5 så der er 5 frames mellemrum imellem hvert skud.
   recoil = 4;
   firingdelay = 5;
   
   /*
   Det vi gør her, er at vi faktisk giver vores Gun et skud, samt hastighed. 
   inde i et with statement laver man om på koden i det man har refferet til, i det her tilfælde obj_bullet
   */
   with  (instance_create_layer(x,y,"Bullets",obj_bullet))
   {
	//Her bliver hastigheden defineret.
    speed = 25;
	/*
	med other kommandoen kan man ændre på koden i den lokale fil altså obj_gun
	random range tilføjer en tilfældighed til skudet så den ikke bare skyder ligeud.
	*/
	direction = other.image_angle + random_range (-3,3);
	image_angle = direction;
   }

}


//denne funktion benytter vektor regning til at udregene koordinaterne til punktet hvor våbnbet skal ende efter skuddet er blevet affyret for at give en følelse af rekyl.
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

//Det vi har gjort her er at hvis vi kigger til højre flipper vores våben til højre, og hvis vi kigger til venstre flipper den til venstre.

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}