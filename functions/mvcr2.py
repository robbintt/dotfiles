#!/usr/bin/python
'''
Steps:

    1. Sling your CANON100 folder into its new home 
    2. Rename it with a topic and date and put this script directly in that folder
    3. Make a directory called `CR2s` and `mv *.CR2 CR2s/`
    4. Delete any jpgs you don't want.
    5. Run this program to move the CR2s you do want from `CR2s` back into this folder
    6. Delete the CR2s folder manually (it contains leftovers)
    7. ... at this point i may want to actually split jpgs into a subdir??
    8. Zip the `topic and date` folder before making destructive changes with an editor
'''

CR2s_folder_name = 'CR2s'

import os

thisdir = os.listdir('.')

jpgfiles = [file[:-4]+'.CR2' for file in thisdir if file[-3:] == 'JPG']

for file in jpgfiles:
    os.rename(os.path.join(CR2s_folder_name, file), os.path.join('.', file))
