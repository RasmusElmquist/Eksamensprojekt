/*
Grunden til vi har valgt at bruge "post draw" er fordi den er meget ens med step evernts. 
Så når noget sker i rummet sker for alle objekter i spillet.
Det vi har gjort her er, det samme som vi gjorde med vores player. At der er en kolision.
Så når vores bullet altså skud rammer vores obj_wall altså kommer i kollision med den, stopper den, og det gør 
også at man faktsik ser skuden ramme og ikke forsvinde inden.
*/
if (place_meeting(x,y,obj_wall)) instance_destroy();