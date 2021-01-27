$fn=16;

module battery(){
    cube([77,72,19]);
}

module PCB(){
    translate([96,66,0])rotate([0,0,180])union(){
        cube([94+2,64+2,25]);   
        //mounting holes
        translate([5.318,5.572,-10])cylinder(h=35,d=3.2+0.5);
        translate([5.318,5.572,-5.1])cylinder(h=3,d1=6+0.5,d2=3+0.5);        
        translate([72.882,8.620,-10])cylinder(h=35,d=3.2+0.5);
        translate([72.882,8.620,-5.1])cylinder(h=3,d1=6+0.5,d2=3+0.5);        
        translate([5.318,60.182,-10])cylinder(h=35,d=3.2+0.5);
        translate([5.318,60.182,-5.1])cylinder(h=3,d1=6+0.5,d2=3+0.5);        
        translate([90.154,60.182,-10])cylinder(h=35,d=3.2+0.5);
        translate([90.154,60.182,-5.1])cylinder(h=3,d1=6+0.5,d2=3+0.5);        
    }
}

module base(){
    cube([185,80,5]);
}
module small_wall(){
    difference(){
        cube([5,80,50]);
        translate([-1,55,-1])cube([7,21,16]);
    }
}

module end_wall(){
    union(){
        cube([5,80,55+2]);
        translate([5,0,45])cube([5,80,5]);
        //add notch to keep lid in place
        translate([5,80,56])rotate([90,0,0])cylinder(h=80,r=1);
        
        //add outwards bit to 5mm at end of box
        translate([-0,7.8,52])cylinder(h=5,r=5);
        translate([-0,72.2,52])cylinder(h=5,r=5);
        translate([-5,7.8,52])cube([5,72.2-7.8,5]);

    }
}
module semicircle(){
    difference(){
        rotate([0,90,0])cylinder(h=7,r=20);
        translate([-1,-21,-21])cube([9,42,21]);
    }
}

module ledge(){
    difference(){
        translate([-25,0,0])cube([25,80,25]);
        rotate([0,-45,0])translate([-35.36,-1,0])cube([35.36,82,35.36]);
    }
}


module large_wall(){
        union(){
            difference(){
                cube([5,80,140]);
                translate([-1,40,0])semicircle();
                //usb socket (+0.5 for nozzel)
                translate([-1,40,75])rotate([0,90,0])cylinder(h=7,d=30+0.5);
                //Lighter socket  (+0.5 for nozzel)
                translate([-1,40,120])rotate([0,90,0])cylinder(h=7,d=30+0.5);
            }
            translate([0,0,25])ledge();
            //add notch to keep lid in place            
            translate([0,80,56])rotate([90,0,0])cylinder(h=80,r=1);
        }
}

module top(){
    difference(){
        cube([50,80,5]);
        translate([25,20,-1])cylinder(h=7,r=10);
        translate([25,60,-1])cylinder(h=7,r=10);
    }
}

        


module complete(){
    difference(){
        union(){
            translate([0,-5,0])base();
            translate([0,-5,5])end_wall();
            translate([79,-5,5])small_wall();
            translate([180,-5,5])large_wall();
            //translate([185,-5,150])top();
        }
        translate([-7,0,0])rotate([91.97,0,0])cube([255,200,10]);
        translate([-7,70,0])rotate([-1.97,0,0])cube([255,10,200]);

    }
}



module lid(){
    difference(){
        translate([5.25,-5,55])difference(){
            cube([175-0.5,80,5]); //0.5 for nozzel width for fitting
            translate([37,40,-1])cylinder(h=7,r=11.25);
            translate([37,40,-1])cylinder(h=4,r=14);
            //four holes for current charge level (+0.5 for nozzel) 
            translate([17.8,15,-1])cylinder(h=7,d=8.3+0.5);
            translate([17.8,15,-1])cylinder(h=4,d=12);
            translate([30.6,15,-1])cylinder(h=7,d=8.3+0.5);
            translate([30.6,15,-1])cylinder(h=4,d=12);
            translate([43.4,15,-1])cylinder(h=7,d=8.3+0.5);
            translate([43.4,15,-1])cylinder(h=4,d=12);            
            translate([56.2,15,-1])cylinder(h=7,d=8.3+0.5);
            translate([56.2,15,-1])cylinder(h=4,d=12);
            //holes for DC jack and 3 Charging statue LEDs
            translate([17.8,65,-1])cylinder(h=7,d=9+0.5);
            translate([17.8,65,-1])cylinder(h=4,d=16);
            translate([30.6,65,-1])cylinder(h=7,d=8.3+0.5);
            translate([30.6,65,-1])cylinder(h=4,d=12);
            translate([43.4,65,-1])cylinder(h=7,d=8.3+0.5);
            translate([43.4,65,-1])cylinder(h=4,d=12);
            translate([56.2,65,-1])cylinder(h=7,d=8.3+0.5);
            translate([56.2,65,-1])cylinder(h=4,d=12);      
        }
        translate([-2,0,0])rotate([91.97,0,0])cube([250,200,10]);
        translate([-2,70,0])rotate([-1.97,0,0])cube([250,10,200]);
    }
        
}
module complete_with_holes(){
    difference(){
        complete();
        translate([84,2,5])PCB();
    }
}

module end_section(){
    union(){
        difference(){
            difference(){
                translate([185,-5,0])cube([37,80,145]);
                translate([180,0,0])rotate([91.97,0,0])cube([255,200,10]);
                translate([180,70,0])rotate([-1.97,0,0])cube([255,10,200]);
            }
            difference(){
                translate([184,0,5])cube([47,70,135]);
                translate([180,5,0])rotate([91.97,0,0])cube([255,200,10]);
                translate([180,65,0])rotate([-1.97,0,0])cube([255,10,200]);        
            }
            translate([207.5,5+11.25,139])cylinder(h=7,r=11.25);
            translate([207.5,5+11.25,139])cylinder(h=4,r=14);
            translate([207.5,5+22.5+15+11.25,139])cylinder(h=7,r=11.25);
            translate([207.5,5+22.5+15+11.25,139])cylinder(h=4,r=14);
            
            //hole for wire
            translate([185+5+2,70-5,139])cylinder(h=7,r=5);
            translate([185+5+2,70-5,144])cylinder(h=2,r1=5,r2=7);
        }
    //add outwards bit to 5mm at bottom
    translate([185+37,5,0])cylinder(h=5,r=5);
    translate([185+37,65,0])cylinder(h=5,r=5);
    translate([185+37,5,0])cube([5,60,5]);
        
    //add outwards bit to 7mm at top
    translate([185+37,2,140])cylinder(h=5,r=7);
    translate([185+37,68,140])cylinder(h=5,r=7);
    translate([185+37,2,140])cube([7,66,5]);
    }
}

complete_with_holes();
color("red")lid();
color("blue")end_section();

//rotate([90-1.97,0,0])complete_with_holes();
//rotate([180,0,0])color("red")lid();
//rotate([0,-90,0])end_section();


//PCB();
//translate([-100,0,0])battery();