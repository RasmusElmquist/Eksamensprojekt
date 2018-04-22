
// "draw_self" denne funktion gør bare at den tegner objektet selvom at der ikke givet nogle kode eller aktion.
// "shader_set" Med denne funktion kan du indstille tegningsmålet til den givet shader og alle yderliger tegninger.
// "shader_reset" Funktionen nulstiller den givede nuace som du har givet din spirte.
draw_self();
if (flash > 0)
{
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}