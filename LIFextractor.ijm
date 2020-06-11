/*
 * This macro transforms all the LIF files of a folder in separated Tiff files
 */
 
run("Close All");

input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".lif", 5);
Dialog.show();
suffix = Dialog.getString();

processFolder(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	// do the processing here by replacing
	// the following two lines by your own code
	print("Processing: " + input + file);
	run("Bio-Formats", "open=["+ input + file +"] color_mode=Default open_all_series split_channels view=Hyperstack stack_order=Default");
	// Close the FLIM files if relevant
	//close("*FLIM*");

// get image IDs of all open images and save it
ids=newArray(nImages); 
for (i=0;i<nImages;i++) { 
        selectImage(i+1); 
        title = getTitle; 
//        print(title); 
        ids[i]=getImageID; 

        saveAs("tiff", output+title); 
}

run("Close All");

	print(file + " is done.");

}

	print("All the pictures in the LIF files have been saved as Tiff in the folder " + output);