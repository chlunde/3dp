walls=0.1;
w1=36+0.2;
w2=30.5+0.2;
h=17+0.5;

sz1=w1+7; // overlap, larger than the largest
sz2=w2+7;

round=1.2;
$fn=16;


difference() {
    // round outwards facing walls
    minkowski() {
        union() {
            cube([sz2,w1+walls*2,h+walls]);
            cube([w2+walls*2,sz1,h+walls]);
        }

        sphere(round);
    }
    
    // cut out space for pipes (w/o rounding)
    translate([walls,walls,-0.00001]) {
        cube([sz1+3,w1,h]);
        cube([w2,sz1+3,h]);
    }
    
    // remove extra material due to rounding, facing wall
    translate([-100,-100,-2*round])
        cube([200,200,2*round]);
}
cube([2,2,h]);

