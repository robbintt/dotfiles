#!/usr/bin/python
'''
Steps:

    1. Sling your CANON100 folder into its new home 
    2. Rename it with a topic and date and enter the folder in a terminal
    3. Make a directory called `jpg` and `mv *.JPG jpg/`
        - Also make a folder called CR2 for this app...
        - FUTURE: auto
    4. Delete any jpgs you don't want.
    5. Run this program, `mvcr2`, to move the CR2s you do want into the `CR2` folder
        - in this setup, mvcr2 is a bash alias (not on the path)
    6. Delete the CR2 files still in the base folder manually (it contains leftovers)
    8. Zip the `topic and date` folder before making destructive changes with an editor
    9. Typically using darktable which is non-destructive, but need to zip as archive
    10. No backup system yet afterall
'''
import os

cr2_folder_name = 'CR2'
JPG_folder_name = 'jpg'

if not os.path.exists(cr2_folder_name):
    os.makedirs(cr2_folder_name)

jpgdir = os.listdir(JPG_folder_name)

# make list of cr2 files to keep based on the jpg files you kept
cr2files = [file[:-4]+'.CR2' for file in jpgdir if file[-3:] == 'JPG']

for file in cr2files:
    try:
        os.rename(os.path.join('.', file), os.path.join(cr2_folder_name, file))
    except OSError:
        pass # no such jpg
