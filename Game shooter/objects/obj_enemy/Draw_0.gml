

//denne funktion gør at den tegner objektet selvom at der ikke givet nogen kode.
draw_self();
// denne tjekker om hvorvidt at flash er større end nul
if (flash > 0)
{
	flash--;
	// dette gør at obj_enemy lyser hvidt når den bliver ramt af et skud.
	shader_set(shWhite);
	
	//denne funktion gør at den tegner objektet selvom at der ikke givet nogen kode.
	draw_self();
	//Funktionen nulstiller den givede nuace som du har givet din spirte.
	shader_reset();
}