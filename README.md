## How to make a spectrum image

To run a spectrum image (i.e. raster the electron beam at a given energy range across your nanostructure):

1. Copy the folder, "pipeline" onto Mox.
2. Replace shape.dat with your shape file. You can use the given shape.f90 file as a template to make your shape if you'd like.
3. Update ddscat.par as you would for a normal eDDA calculation, except DO NOT change the electron beam position. It should always read: " 0.0 0.0 0.0 " exactly.
4. Launch an interactive node ( type in command line: srun -p build --time=2:00:00 --mem=100G --pty /bin/bash )
5. Define the extend and raster step size in "create_folders.sh". Then bash this script.
6. python makelaunchfiles.py
7. bash submit_jobs.sh