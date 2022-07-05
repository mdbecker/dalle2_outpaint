#!/bin/bash
# step 1 is to make OG image bigger... TODO don't hard code numbers
convert 1.webp -gravity center -background none -extent 1912x1912 o1.png
 
# # step 2 crop northwest corner and infill
convert o1.png -gravity northwest -crop 1024x1024+0+0 +repage 2.png
# now combine the 1st and 2nd image
convert 2.webp -gravity northwest -background none -extent 1912x1912 front.png
convert o1.png front.png -gravity center -background None -layers Flatten o2.png

# crop northeast corner and infill
convert o2.png -gravity northeast -crop 1024x1024+0+0 +repage 3.png
# now combine the 1st and 2nd image
convert 3.webp -gravity northeast -background none -extent 1912x1912 front.png
convert o2.png front.png -gravity center -background None -layers Flatten o3.png
 
# crop southeast corner and infill
convert o3.png -gravity southeast -crop 1024x1024+0+0 +repage 4.png
# now combine the 1st and 2nd image
convert 4.webp -gravity southeast -background none -extent 1912x1912 front.png
convert o3.png front.png -gravity center -background None -layers Flatten o4.png

# crop southwest corner and infill
convert o4.png -gravity southwest -crop 1024x1024+0+0 +repage 5.png
# now combine the 1st and 2nd image
convert 5.webp -gravity southwest -background none -extent 1912x1912 front.png
convert o4.png front.png -gravity center -background None -layers Flatten o5.png

# expand to 3x3 stop here if you only want 2x2
convert o5.png -gravity center -background none -extent 2868x2868 stage1.png

# crop west corner and infill
convert stage1.png -gravity west -crop 1024x1024+0+0 +repage 6.png
# now combine the 1st and 2nd image
convert 6.webp -gravity west -background none -extent 2868x2868 front.png
convert stage1.png front.png -gravity center -background None -layers Flatten o6.png

# crop southwest corner and infill
convert o6.png -gravity southwest -crop 1024x1024+0+0 +repage 7.png
# now combine the 1st and 2nd image
convert 7.webp -gravity southwest -background none -extent 2868x2868 front.png
convert o6.png front.png -gravity center -background None -layers Flatten o7.png

# crop south corner and infill
convert o7.png -gravity south -crop 1024x1024+0+0 +repage 8.png
# now combine the 1st and 2nd image
convert 8.webp -gravity south -background none -extent 2868x2868 front.png
convert o7.png front.png -gravity center -background None -layers Flatten o8.png
 
# crop southeast corner and infill
convert o8.png -gravity southeast -crop 1024x1024+0+0 +repage 9.png
# now combine the 1st and 2nd image
convert 9.webp -gravity southeast -background none -extent 2868x2868 front.png
convert o8.png front.png -gravity center -background None -layers Flatten o9.png

# crop east corner and infill
convert o9.png -gravity east -crop 1024x1024+0+0 +repage 10.png
# now combine the 1st and 2nd image
convert 10.webp -gravity east -background none -extent 2868x2868 front.png
convert o9.png front.png -gravity center -background None -layers Flatten o10.png

# crop northeast corner and infill
convert o10.png -gravity northeast -crop 1024x1024+0+0 +repage 11.png
# now combine the 1st and 2nd image
convert 11.webp -gravity northeast -background none -extent 2868x2868 front.png
convert o10.png front.png -gravity center -background None -layers Flatten o11.png
 
# crop north corner and infill
convert o11.png -gravity north -crop 1024x1024+0+0 +repage 12.png
# now combine the 1st and 2nd image
convert 12.webp -gravity north -background none -extent 2868x2868 front.png
convert o11.png front.png -gravity center -background None -layers Flatten o12.png

# crop northwest corner and infill
convert o12.png -gravity northwest -crop 1024x1024+0+0 +repage n.png
# now combine the 1st and 2nd image
convert 13.webp -gravity northwest -background none -extent 2868x2868 front.png
convert o12.png front.png -gravity center -background None -layers Flatten final.png
