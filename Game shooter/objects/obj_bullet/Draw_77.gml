/*
Det vi har gjort her er, det samme som vi gjorde med vores player. At der er en kolision.
Så når vores bullet rammer vores obj_wall, stopper den, og det gør 
også at man faktsik ser skudet ramme og ikke forsvinde inden.
Vi bruger et if statement til en placemeeting hvor efter vi bruger instance_destroy, da skudet 
skal forsvinde når det kommer i kontakt med vægen. 
*/

if (place_meeting(x,y,obj_wall)) instance_destroy();