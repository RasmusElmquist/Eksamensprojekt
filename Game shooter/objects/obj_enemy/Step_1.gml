if (hp <= 0)
/* "instance_creat_layer" Med denne funktion kan du oprette en ny forekomst af den angivne objekt
på et givet punkt i rummet og på det specificerede lag (Noget der er vigtigt at tage med er at der er et 
minimum og et maximum lag dybte som ligger på -16000 til 16000 alt som bliver tegnet udefor disse rammer
vil ikke blive tegnet) */
// "lengtdir_x og lengthdir_y" 
{
	with(instance_create_layer(x,y,layer,obj_dead))
		{
			direction = other.hitfrom;
			hsp = lengthdir_x(3,direction);
			vsp = lengthdir_y(3,direction)-2;
			if (sign(hsp) != 0) image_xscale = sign(hsp);
		}
// "Instance_destroy" Man bruger denne funktion, når man ønsker at "ødelægge" en givet placering
	instance_destroy();

}