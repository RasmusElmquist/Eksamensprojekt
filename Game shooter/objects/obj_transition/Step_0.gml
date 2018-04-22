
if (mode!= TRANS_MODE.OFF)

{	
	if (mode == TRANS_MODE.INTRO)
	{
		// dette gør at det sorte fra top og bund langsomt bevæger sig mod midten. 
		percent = max(0,percent-0.05);
	}
	else
	{
		// omvendt gør det her at det sorte forsvinder fra midten.
		percent = min(1,percent+0.05);
	}

	if (percent == 1) or (percent == 0)
	{
		/* Switch statement er på mange måder det samme som et if statement.
		Dette kunne teknisk set også skrives i if statements men fordelen ved at skrive det i switch 
		er muligheden for at switch kan beregne alt det her i et statement hvor if statements 
		kan læse tværs hinanden.
		*/
		switch (mode)
		{
			/* en case er ligesom if statementet
			hvis mode = TRANS_MODE.INTRO så kører den dette specifikke case.
			*/
			case TRANS_MODE.INTRO:
			{
				/* dette sætter værdien af mode tilbage til 0
				da den her mode allerede er specificeret ovenover i koden.
				*/
				mode = TRANS_MODE.OFF;
				// dette slutter casen.
				break;
			}
			// hvis mode = TRANS_MODE.NEXT så kører den dette specifikke case.
			case TRANS_MODE.NEXT:
			{
				// dette starter transistionen 
				mode = TRANS_MODE.INTRO;
				// dette får spilleren til at starte i den næste bane i rækken.
				room_goto_next();
				// dette slutter casen.
				break;
			}
			//hvis mode = TRANS_MODE.RESTART så kører den dette specifikke case.
			case TRANS_MODE.RESTART:
			{
				//dette genstarter spillet tilbage til første rum.
				game_restart();
				// dette slutter casen.
				break;
			}
		}
	}
}