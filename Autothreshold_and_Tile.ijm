// Align and display the open images with the optimal contrast 

list = getList("image.titles");
for (i=0;i<=nImages-1;i++) {
	selectWindow(list[i]);
	run("Enhance Contrast", "saturated=0.35");
}

run("Tile");

/*
 * Alternatively, you can edit your file Startup.txt file
 * to launch it from the toolbar:
 * 
// B&C and Tile tool
macro "B&C and Tile Action Tool - R0063R0663R0c63Ra063Ra663Rac63" {
	run("Tile");
    for (i=1;i<=nImages;i++) { 
			selectImage(i);
			run("Enhance Contrast", "saturated=0.35");
			getLocationAndSize(x, y, width, height);
			y = y + 14;
			setLocation(x,y);
								}

  }
  
 * Note that you need to restart Fiji to use it
 */
