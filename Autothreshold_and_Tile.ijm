// Align and display the open images with the opyimal contrast 

list = getList("image.titles");
for (i=0;i<=nImages-1;i++) {
	selectWindow(list[i]);
	run("Enhance Contrast", "saturated=0.35");
}

run("Tile");