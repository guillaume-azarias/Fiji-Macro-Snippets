/*
 * Starting simple: Illustrates the annotation principle in Fiji
 * 
 * Application: Titration of plasmid/virus and cell number
 *
 */

//setTool("text"). Note that the function Overlay.drawString is not shown outside of Fiji unless the file is saved as a jpg;
setForegroundColor(255, 255, 255);
setFont("SansSerif", 14, " antialiased");
setColor("white");

//Title;
Overlay.drawString("Construct name", 300, 20, 0.0);

//Line annotations;
Overlay.drawString("4000 cells", 20, 195, 0.0);
Overlay.drawString("6000 cells", 20, 325, 0.0);
Overlay.drawString("8000 cells", 20, 455, 0.0);

//Column annotations;
Overlay.drawString("0ng", 208, 80, 0.0);
Overlay.drawString("100ng", 348, 80, 0.0);
Overlay.drawString("150ng", 487, 80, 0.0);
Overlay.drawString("200ng", 626, 80, 0.0);

Overlay.show();