$fn=64;
h=20;
s=60;
d_thick=2*15; // dough thickness

plast_thick=0.4*3;
plast_thick2=2.4;

arms=3;

intersection() {
    difference() {
        // Arms
        arm_thick=11;
        for( I = [ 0:360/arms: 359 ] )  {
            rotate ( [ 0,0,I])
                translate([0,-arm_thick/2,0])
                    cube([s,arm_thick,plast_thick2]);
        }
        // Core
        linear_extrude(plast_thick2+0.1)
            circle(d=s-plast_thick-d_thick);
    }
    // don't let the arms go longer than the whole thing
    linear_extrude(h)
        circle(d=s);
}

linear_extrude(h) {
    // Outer diameter walls
    difference() {
        circle(d=s);
        circle(d=s-plast_thick);
    }    

    // Inner diameter walls
    difference() {
        circle(d=s-d_thick);
        circle(d=s-plast_thick-d_thick);
    }
}

// extra support near handle
linear_extrude(plast_thick2) {
    // Outer
    difference() {
        circle(d=s);
        circle(d=s-4);
    }
    // Inner
    difference() {
        circle(d=s-plast_thick-d_thick+4);
        circle(d=s-plast_thick-d_thick);
    }
}
