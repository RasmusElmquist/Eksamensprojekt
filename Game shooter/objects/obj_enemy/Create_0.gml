/*
Her bestemmer vi vaiablerne for vores obj_enemy.
*/
vsp = 0;

// dette er tyngdekræften.
grv = 0.3;

// dette er walkspeed. Som bestemmer hastigheden den kan bevæge sig.
walksp = 3;


hsp = walksp;

//dette bestemmer hvor mange liv obj_enemy har. 4 betyder at den kan tage 4 skud.
hp = 4;

// hvis denne er nul vil der ikke ske noget. 
flash = 0;

//denne tjekker om hvorvidt at obj_enemy rammer en mur hvis = 0 så rammer den ikke noget. Hvis = 1 så vender den 180°
hitfrom = 0;