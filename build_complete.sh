#!/bin/bash

# Run the first script
# You need to run this as sudo.
echo "Generating stock raspbian .img with pi-gen"
bash build.sh
if [ $? -ne 0 ]; then
    echo "Error: building pi-gen failed to execute."
    exit 1
fi

# Run the second script
echo "Moving the .img file to custopizer workspace, then renaming to input.img"
pwd
sudo mv ./work/pio_image/export-image/pio_image-full.img ./CustoPiZer/workspace/input.img
if [ $? -ne 0 ]; then
    echo "Error: moving the .img file failed."
    exit 1
fi

# Run the second script
echo "Adding the pioreactor files to the .img file"
cd CustoPiZer
sudo bash make_worker_image.sh 1.1
if [ $? -ne 0 ]; then
    echo "Error: adding pioreactor files failed to execute."
    exit 1
fi

echo "pioreactor img file successsfully generated and edited."
