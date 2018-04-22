// "Instance_destroy" Man bruger denne funktion, når man ønsker at "ødelægge" en givet placering
with (other) 
{
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();