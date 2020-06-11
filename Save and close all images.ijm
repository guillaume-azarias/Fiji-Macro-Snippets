// This is to save images into a target folder

setOption("JFileChooser", true);
target = getDirectory("Target directory");
setOption("JFileChooser", false);

title=newArray(nImages);
for (i=0;i<nImages;i++) { 
        selectImage(i+1);
        title[i] = getTitle;
        //saveAs("tiff", target + File.separator + title[i]);
        saveAs("tiff", target + File.separator + i);
						}

run("Close All");

Dialog.create("Save and close");
Dialog.addMessage("\n                                                                                      Done\n");
Dialog.addMessage("  The images and cell regions have been saved in: ");
Dialog.addMessage(target + "\n");
Dialog.show();