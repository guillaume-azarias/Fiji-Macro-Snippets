// Close all windows
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
toClose = newArray("Log", "Results", "Synchronize Windows", "B&C", "Threshold", "ROI Manager");
	// Apply the function closeit to the list components
for (i=0; i<lengthOf(toClose); i++) {
	closeit(toClose[i]);
}

