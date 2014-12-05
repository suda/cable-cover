length = 20;
gap = 10;
radius = 40;
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