/*
dette tjekker om playeren er inde i trigger zonen
Hvis man er, mister spilleren kontrollen så begynder transition til det næste rum. 
*/
with (obj_player)
{	
	if (hascontrol)
	{
		hascontrol = false
		SlideTransition(TRANS_MODE.NEXT,other.target);
	}

}