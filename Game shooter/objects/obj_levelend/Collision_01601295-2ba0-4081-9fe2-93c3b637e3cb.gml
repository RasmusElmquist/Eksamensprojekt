/*
dette tjekker om playeren er inde i trigger zonen
Hvis man er, mister spilleren kontrollen over så begynder transition til lvl 2. 
*/
with (obj_player)
{	
	if (hascontrol)
	{
		hascontrol = false
		SlideTransition(TRANS_MODE.NEXT,other.target);
	}

}