#!/bin/bash

echo "Organizing the messy downloads folder."

cd ~/Downloads/

#Create Folders
mkdir Images Music Videos PDFs Scripts Compressed Documents ISOs Softwares Books Others

#Image Files
mv *.png *.jpg *.jpeg *.tif *.tiff *.bpm *.gif *.eps *.raw Images

# Music Filess
mv *.mp3 *.m4a *.flac *.aac *.ogg *.wav Music

# Videos Files
mv *.mp4 *.mov *.avi *.mpg *.mpeg *.webm *.mpv *.mp2 *.wmv Videos

# PDFs
mv *.pdf *.PDF  PDFs

# Scripts
mv *.py *.sh Scripts

#Compressed Files
mv *.rar *.zip *.tar *.gz Compressed

#Documents Files
mv *.ppt *.pptx *.xls *.xlsx *.doc *.docx *.txt *.tex *.dwg *.csv *.odt *.xlsm *.ods *.rtf *.odp Documents

#ISOs Files
mv *.iso ISOs

#Softwares Files
mv *.rpm *.bin Softwares

#Books Files
mv *.mobi *.epub Books

#Others Files
mv *.* Others


echo "Putting trash out."

rm -rf ~/.local/share/Trash/*

echo "All done!"