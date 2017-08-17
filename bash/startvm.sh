#!/bin/bash
VMNAME=$1
if [ -z "$1" ]; then
    echo "USAGE: sh startvm.sh {VM name}";
    exit;
fi

running=1;
running_msg="VM '$VMNAME' currently running"
running_msg_shown=0;

while [ $running -eq 1 ]
do
    running=`VBoxManage list runningvms | grep -c $VMNAME`
    if [ $running -eq 1 ] && [ $running_msg_shown -eq 0 ]; then
        echo $running_msg;
        running_msg_shown=1;

        while true; do
            read -p "Do you want to shutdown the VM? (y/n): " yn
            case $yn in
                [Yy]* ) echo "shutting down VM $VMNAME"; VBoxManage controlvm $VMNAME acpipowerbutton; exit 0; break;;
                [Nn]* ) running=0; exit 0;;
                * ) echo "Enter y (yes) or n (no)..";;
            esac
        done
    fi

    sleep 1
done

VBoxManage startvm $VMNAME --type headless
