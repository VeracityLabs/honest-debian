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
echo "Adding "
bash ./CustoPiZer/make_worker_image.sh 1.1
if [ $? -ne 0 ]; then
    echo "Error: adding pioreactor files failed to execute."
    exit 1
fi

echo "pioreactor img file successsfully generated and edited."
