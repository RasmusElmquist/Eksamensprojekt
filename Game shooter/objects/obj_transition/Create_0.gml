
/*
disse funktioner finder størrelsen på GUI'en til at lave
transitionen den rigtige størrelse
*/
w = display_get_gui_width();
h = display_get_gui_height(); 

// dette er for at udrenge hvor de sorte linjer skal mødes så de møder i den præcise midte.
h_half = h* 0.5;

/* en enum giver navne, såsom off og tildeler den en konstant. 
så det er nemmere at have med at gøre dette gøres fra 0 -- > ∞.
alle navne har unikke konstanter. 
*/
enum TRANS_MODE
{
	OFF,
	NEXT,
	RESTART,
	INTRO 
}
/* her er en enum brugbar, man kunne godt have skrevet at 30 = on og 0 = off.
Men det er nemmere at huske en værdi ved at tildele den et navn.
*/
mode = TRANS_MODE.INTRO;
/*percent er en variable mellem 0-1 dette betyder at når percent = 1 er hele skærmen sort
Når percent = 0 så er der intet sort på skærmen.
*/
percent = 1;

