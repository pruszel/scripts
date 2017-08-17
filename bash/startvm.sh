#!/bin/bash
VMNAME=$1

running=1;
running_msg="Virtual Machine '$VMNAME' currently running"
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
                [Yy]* ) echo "shutting down VM $VMNAME"; VBoxManage controlvm local.lpdev.us acpipowerbutton; exit 0; break;;
                [Nn]* ) running=0; exit 0;;
                * ) echo "Enter y (yes) or n (no)..";;
            esac
        done
    fi

    sleep 1
done

VBoxManage startvm local.lpdev.us --type headless
