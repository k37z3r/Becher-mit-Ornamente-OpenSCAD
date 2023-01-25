/*
Becher-mit-Ornamente-OpenSCAD by Sven Reddemann is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
Based on a work at https://github.com/k37z3r/Becher-mit-Ornamente-OpenSCAD.
*/
radius=70;
sradius=3.5;
rows=11;
rowdistance=1.5;
speherefn = 6;
height=90;
cupfn=100;
module diamonds(radius,angle){
    x = radius * sin(angle/360*360);
    y =radius * cos(angle/360*360);
    translate([x,y,0])rotate([0,0,-angle])sphere(r = sradius,$fn=speherefn);
}
module muster(radius){
    for(b=[0:1:rows]){
        for (a = [0:(radius/20):360]) color("red") translate([0,0,b*sradius*rowdistance]) diamonds(radius,a);
    }
}
difference(){
    translate([0,0,35])cylinder(h=height, r=radius, $fn=cupfn, center=true);
    translate([0,0,37])cylinder(h=height-2, r=radius-1.5, $fn=cupfn, center=true);
}
difference(){
    muster(radius);
    translate([0,0,37])cylinder(h=height-2, r=radius-1.5, $fn=cupfn, center=true);
}
