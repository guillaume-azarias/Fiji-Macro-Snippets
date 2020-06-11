# Fiji-Macro-Snippets
*Set of simple tools to custom to make the life of imaging scientist easier*

Manual processing of images can be time-consumming, sometime impossible in the case of high content screening.
Fiji provides the possibility to apply image processing tasks in macro that are easy to combine.

Here, I provide a set of simple tools to customise to your images and provide a basis to learn basic functions.

### Autothreshold_and_Tile
* *Application*: When several images are open with Fiji, we often want to align them and optimize the contrast for a quick overview
* *What it does*: Optimize the contrast for each images and align them using the tile function
* *Advantage*: Allow to quickly screen a high number of images in a single function

### Closeit
* *Application*: When several images are open with Fiji, including B&C, Log, Results, etc and you want to close everything at once
* *What it does*: Close all open windows, select and close "Log", "Results", "Synchronize Windows", "B&C", "Threshold" and "ROI Manager"
* *Advantage*: Allow to clean your screen instantly. Usefull when called through the toolbar

### LIFextractor
* *Application*: Image processing for images acquired with a Leica microscopy instrumentation device
* *What it does*: Extract all the .lif files and convert them in tiff
* *Advantage*: Allow to further process images with Fiji 

### Plate_annotation
* *Application*: Titration/screening experiment
* *What it does*: Annotate the number of cells and plasmid or virus concentration
* *Advantage*: Save your file with the relevant information and avoid losing information

### Removing background from an image series
* *Application*: Remove the background fluorescence from an image series
* *What it does*: Substract the background
* *Advantage*: Necessary step for image processing. Mind the acquisition settings.

### Save and close all images
* *Application*: Save all the open images at once
* *What it does*: Save the images as tiff, in the order they were open
* *Advantage*: Usefull for parameter testing

### Stack to images and save it
* *Application*: Image processing on specific images
* *What it does*: Dissociate the stack and stack the images as tiff
* *Advantage*: Single step function

### Stack_Align
* *Application*: In case you have a 2-channel images where the channels are not correctly aligned
* *What it does*: Dissociate the channels, average images (to edit for your purpose) and show a user-interface to set the shift.
* *Advantage*: Critical step for image ratio calculation
