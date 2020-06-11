// This is a temporary macro to subsract the background to images calculated without background correction
// Load the single images you want to process
// Do not forget to CHANGE THE INPUT VARIABLE !


// Variables
input="your_path_to_the_folder_of_images";
backgroundT="your_path_to_the_background_correction_image.TIFF";

// Stack to images
run("Stack to Images");

// Getting the names of images
title=newArray(nImages);
for (i=0;i<nImages;i++) { 
        selectImage(i+1); 
        title[i] = getTitle;
						}

nombreimages=nImages;

open(backgroundT);
backgroundTID=getImageID();

for (i=0;i<nombreimages;i++) 	{ 
			selectImage(i+1);
			raw=getImageID();
	        imageCalculator("Subtract create", raw, backgroundTID);
	        saveAs("tiff", input+title[i] + "-BG");
	        beep();
								}

run("Close All");