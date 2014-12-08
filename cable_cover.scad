// Length of the cover. Adjust according to your bed length
length = 20;
// Space in the bottom. Adjust according to your widest cable
gap = 10;
// Radius of the arch. Higher the radius, flatter the cover. But beware overhang!
radius = 40;
// Set depending on amount of cables you want put inside
height = 10;

inner_radius = radius - 2;

module shell() {
	difference() {
		difference(){
			cylinder(r=radius, h=length, center=true, $fn=50);
			cylinder(r=inner_radius, h=length, center=true, $fn=50);
		}
		translate([height, 0, 0])
			cube([radius*2, radius*2, length], center=true);
	}
}

module clip_shell() {
	difference(){
		cylinder(r=radius+10, h=length, center=true, $fn=50);
		cylinder(r=radius, h=length, center=true, $fn=50);
	}
}

module bottom() {
	hypo = sqrt(height * (radius * 2));
	adj = sqrt((hypo * hypo) - (height * height));
	
	difference() {
		translate([-radius + height, 0, 0])
			cube([1, adj * 2, length], center=true);
		translate([-radius + height, 0, 0])
			cube([2, gap, length], center=true);
	}
}

shell();
difference(){
	bottom();
	clip_shell();
}