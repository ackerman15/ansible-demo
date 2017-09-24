#!/bin/bash

declare -a host_arr=(
    "ec2-18-220-13-77.us-east-2.compute.amazonaws.com"
    "ec2-18-220-236-147.us-east-2.compute.amazonaws.com"
    "ec2-18-221-120-190.us-east-2.compute.amazonaws.com"
    "ec2-13-59-204-230.us-east-2.compute.amazonaws.com"
    "ec2-18-221-154-103.us-east-2.compute.amazonaws.com"
    "ec2-18-221-131-77.us-east-2.compute.amazonaws.com"
    "ec2-52-15-95-111.us-east-2.compute.amazonaws.com"
)

for i in "${host_arr[@]}"
do
   cat ~/.ssh/id_rsa.pub | ssh -i ~/.ssh/bb-demo.pem -oStrictHostKeyChecking=no -l ubuntu ubuntu@$i 'cat >> .ssh/authorized_keys && echo "Key copied"'
   echo 'connected' | ssh ubuntu@$i 'cat >> ~/connect_test.txt'
   ssh ubuntu@$i 'cat ~/connect_test.txt'
done

# ssh ubuntu@ec2-18-220-13-77.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-18-220-236-147.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-18-221-120-190.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-13-59-204-230.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-18-221-154-103.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-18-221-131-77.us-east-2.compute.amazonaws.com
# ssh ubuntu@ec2-52-15-95-111.us-east-2.compute.amazonaws.com
