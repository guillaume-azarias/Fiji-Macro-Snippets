// This is to align two Green and Red stacks
// Note: You may need to edit the script between the les 61 and 72 (case-specific averaging of images)

// Function Tile and Adjust B&C
function tile() {
	run("Tile");
    for (i=1;i<=nImages;i++) { 
			selectImage(i);
			run("Enhance Contrast", "saturated=0.35");
			getLocationAndSize(x, y, width, height);
			y = y + 21;
			setLocation(x,y);
    }
}

// Function Synchronize Windows
function synchronize() {
    run("Synchronize Windows");
    selectWindow("Synchronize Windows");
	setLocation(1050, 354);
}
	
// Function closeit, close a windows if it is open
function closeit(title) {
	if (isOpen(title)) { 
    	selectWindow(title);
    	run("Close"); 
     }
}

// Clean up the screen
run("Close All");
run("Clear Results"); 

	// List of the windows that you want to close:
toClose = newArray("Results", "Synchronize Windows", "B&C", "Threshold", "ROI Manager", "930nm.log");
	// Apply the function closeit to the list components
for (i=0; i<lengthOf(toClose); i++) {
	closeit(toClose[i]);
}

path = File.openDialog("The Stack Alignor: Select a File");
input = File.getParent(path) + File.separator;

// Create temporary directory
myDir = input + "ImageJ" + File.separator;
if (File.exists(myDir)) {
	list = getFileList(myDir);
	for (i=0; i<list.length; i++)
		ok = File.delete(myDir+list[i]);
		ok = File.delete(myDir);
}

File.makeDirectory(myDir);

// Slip the colors and save in the tempory directory 
setBatchMode(true);
open(path);
saveAs("Tiff", myDir + "Original");
run("Split Channels");
// Making the average of 4 images
raw_Green = getImageID();
run("Grouped Z Project...", "projection=[Average Intensity] group=4");
saveAs("Tiff", myDir + "Green");
close();
selectImage(raw_Green);
close();
// Making the average of 4 images
saveAs("Tiff", "Red");
run("Grouped Z Project...", "projection=[Average Intensity] group=4");
saveAs("Tiff", myDir + "Red");
run("Close All");

// Open the Green stacks
open(myDir + "Green.tif");
run("Enhance Contrast", "saturated=0.35");
Green = getImageID();

// These parameters could be adjusted by the user if a DialogBox is created
X_origin = 21;
Y_origin = 21;
Rectangle_width = 470;
Rectangle_height = 470;

// Open the Red stacks
open(myDir + "Red.tif");
run("Enhance Contrast", "saturated=0.35");
Red = getImageID();

// Merge and show the Rectangle
run("Merge Channels...", "c1=Red.tif c2=Green.tif create");
makeRectangle(X_origin, Y_origin, Rectangle_width, Rectangle_height);

setBatchMode(false);
tile();

// Ask for the best slice 
windows_title =     "The Stack Alignor";
msg_start = "Select your the best slice to align";
waitForUser(windows_title, msg_start);
			
// Asking for the shift			
Dialog.create("The Stack Alignor");
Dialog.addMessage("Estimate the shift of the Red Channel:");
Dialog.addMessage("____________________________________");
Dialog.addMessage("Shift on the X axis");
Dialog.addMessage("");
Dialog.addSlider("      Shifted to the left from", 0, 20, 0);
Dialog.addSlider("     Shifted to the right from", 0, 20, 0);
Dialog.addMessage("____________________________________");
Dialog.addMessage("Shift on the Y axis from");
Dialog.addMessage("");
Dialog.addSlider("   Shifted toward the top from", 0, 20, 0);
Dialog.addSlider("Shifted toward the bottom from", 0, 20, 0);
Dialog.show();

Xl = Dialog.getNumber();
Xr = Dialog.getNumber();
Yt = Dialog.getNumber();
Yb = Dialog.getNumber();

X_shift = Xr - Xl;
Y_shift = Yb - Yt;

getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
Hour = hour;
Minute = minute;
Second = second;
print("Today, at " + Hour + ":" + Minute +":" + Second + ", X was shifted by " + X_shift + " pixels and Y shifted by " + Y_shift + " pixels.");

Xshifted = X_origin + X_shift;
Yshifted = Y_origin + Y_shift;

// Making the Cropped version not shifted
makeRectangle(X_origin, Y_origin, Rectangle_width, Rectangle_height);
run("Crop");
saveAs("Tiff", myDir + "Cropped_Merge_Not_Shifted");

setBatchMode(true);

// Cutting the Green channel
open(myDir + "Green.tif");
run("Enhance Contrast", "saturated=0.35");
Green = getImageID();
selectImage(Green);
makeRectangle(X_origin, Y_origin, Rectangle_width, Rectangle_height);
run("Crop");
saveAs("Tiff", myDir + "Cropped_Green");

// Cutting the Red channel (shifted)
open(myDir + "Red.tif");
run("Enhance Contrast", "saturated=0.35");
makeRectangle(Xshifted, Yshifted, Rectangle_width, Rectangle_height);
run("Crop");
saveAs("Tiff", myDir + "Red_Shifted");

// Merge and save
open(myDir + "Cropped_Green.tif");
run("Merge Channels...", "c1=Red_Shifted.tif c2=Cropped_Green.tif create");
setBatchMode(false);
//saveAs("Tiff", myDir + "Cropped_Merge_Shifted");

// Show the results
tile();
synchronize();

// Cleaning up the temporary folder
showStatus("Cleaning up the temporary files");
  list = getFileList(myDir);
  for (i=0; i<list.length; i++)
      ok = File.delete(myDir+list[i]);
  ok = File.delete(myDir);
  if (File.exists(myDir))
      exit("Unable to delete directory");