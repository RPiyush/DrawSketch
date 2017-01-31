# DrawSketch
Draw Sketch on scratchpad. 

1. Just instantiate the object of class 'DrawSketchViewController' like:

      let drawsketchVC = DrawSketchViewController(nibName: "DrawSketchViewController", bundle: nil)

2. Set 'previosAnnotationImagePath', if you are editing existing sketch.

3. Set 'isNewSnap' to true, in case of new Sketch.
4. Set 'originalImage', so that white drawing screen comes when view loaded, for this we have used some function to load files from Bundle (pathForSavedImage()).
5. Set 'image_title' as your image file name, name with which you want to store your sketch image.
6. Implement delegate 'DrawSketchViewControllerDelegate' which will return you image path where image saved.