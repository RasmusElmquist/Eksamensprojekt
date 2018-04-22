/*
Grunden til vi har valgt at bruge "post draw" er fordi den er meget ens med step events. 
Det vi har gjort her er, det samme som vi gjorde med vores player. At der er en kolision.
Så når vores bullet koliderer vores obj_wall, stopper den, og det gør 
også at man faktsik ser skuden ramme og ikke forsvinde inden.
*/

if (place_meeting(x,y,obj_wall)) instance_destroy();