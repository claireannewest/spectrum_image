# spectrum_image

To run a spectrum image (i.e. raster the electron beam at a given energy range across your nanostructure):

1. Copy the folder, "pipeline" onto Mox.
2. Replace shape.dat with your shape file. You can use the given shape.f90 file as a template to make your shape if you'd like.
3. Update ddscat.par as you would for a normal eDDA calculation, except DO NOT change the electron beam position. It should always read: " 0.0 0.0 0.0 " exactly.
4. Decide how to define your window.
   - Exploit symmetries in your shape file. These calculations are quite expensive, so you should take a symmetric slice of your shape. For example if your shape is symmetric about the y axis, only take points in the negative y plane. Once the calculation is done, then you can reflect those points across the y axis to form your full 2D image. 
   - Note that eDDA does not converge for electron beam positions in the particle. Therefore, make sure your window contains enough points outside of the particle to determine the mode. 
5. Once you've descided on the y and z bounds of your window, update "ystart", "yend", and "ss" in "launch_temp" to define your window in the y direction. "ystart" is the minimum y value, "yend" is the maximum y value, and "ss" is the step size. All these values should be in units of lattice spacing. (Do not change z=0).
6. Update "zstart", "zend", and "ss" in "launch_full.sh". Note that "ss" should be the same value as "ss" in launch_temp.
7. Double check everything, then to launch all the jobs, type "bash launch_full.sh" in command window. 

A few notes...
If your shape is > 100,000 dipoles, you'll want all your jobs to run on the chem nodes. If you're having a problem where the simulation has reached it's wall time and the row hasn't fully completed, either reduce your y window, or increase your step size. 
