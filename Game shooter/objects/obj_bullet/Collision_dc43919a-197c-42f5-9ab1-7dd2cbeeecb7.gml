/*
Vi starter med et with statement til other, da vi har et objekt, der skal kunne
kolliderer, med et andet objekt. Other er en funktion er siger, at vi har noget vi skal kunne komme i kontakt med, 
så det ikke kolliderer med en masse andre ting, men kun den specifikke obj_enemy.
*/
with (other) 
{
	/*
	her under har vi nogle variabler.
	Hefter hp har vi -- Hvad -- gør er at det subtrere 1 fra en variable.
	Flash som er hvor meget de glimter når de bliver remt, altså den variabel vi har sat,
	op i obj_enemy.
	Hitfrom er den retning de bliver skudt fra, så når de dør kan de flippe.
	*/
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();