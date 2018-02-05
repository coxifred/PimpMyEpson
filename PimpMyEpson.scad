/**
Boite pour pimpMyEpson avec openScad
2017 (Fred)
**/

// La boite principale
module   boite()
{   
     // Intersection trapeze USB et boite
    difference() {
        // Intersection trapeze RS232 et boite
        difference() {
            // Intersection des 2 boites
            difference() {
                translate([-18,0,0]) cube ([36,44,27]);
                translate([-16,1,2]) cube ([32,41,25]);
            }
            translate([0,5,18])  rotate([90,180,0]) linear_extrude (height=10) polygon (points=[[-9,0],[9,0],[7,8],[-7,8]]);
        }
       translate([0,45,20])  rotate([90,0,0])  linear_extrude (height=10)  polygon (points=[[-5,0],[5,0],[4,4],[-4,4]]);
    }
}

// Le couvercle
module couvercle()
{
  // Intersection avec le couvercle
  rotate([180,0,0]) translate([45,-44,-29]) difference() {
                       // Couvercle
                       translate([-18,0,25]) cube ([36,44,4]);   
                       boite();
                       }
}

// La marche interne
module marche();
{
  // La marche interne
translate([-16,36,2]) rotate([90,0,90]) linear_extrude (height=32) polygon (points=[[-4,0],[6,0],[6,10],[-2,10]]);  
}

boite();
couvercle();
marche();







