// This is to open an save images from an image stack

showStatus("Welcome to the Stack to images and save it");

setOption("JFileChooser", true);
output = getDirectory("Output directory");
setOption("JFileChooser", false);

setSlice(1);
nSlice = nSlices;
name = getTitle;

Dialog.create("    File name");
Dialog.addString("Name of the file: ", name, 18);
Dialog.show();
name = Dialog.getString();

setBatchMode(true);
for (i=1;i<nSlice;i++) {
	run("Duplicate...", "duplicate range=1-1");
		saveAs("Tiff", output + File.separator + name + "_" + i);
		close();
	run("Slice Remover", "first=1 last=1 increment=1");
						}
//last

saveAs("Tiff", output + File.separator + name + "_" + nSlice);
close();
setBatchMode(false);

Dialog.create("Stack to images and save it");
Dialog.addMessage("\n                                            All good :-)\n");
Dialog.show();