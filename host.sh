# Sandbox hardening script.
# Configure VirtualBox machine information.
# Original script: http://blog.prowling.nu/
# ./host.sh <VIRTUALBOX MACHINE>

VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVendor" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardProduct" "198F"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardVersion" "KBC Version 15.55"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardSerial" "PDXVC00WB7S1OO"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardAssetTag" ""
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBoardLocInChass" ""
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiChassisVendor" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiChassisVersion" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiChassisSerial" "5CG45008GV"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiChassisAssetTag" "5CG45008GV"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVendor" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "L71 Ver. 01.21"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseDate" "09/03/2014"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseMajor" "3"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSReleaseMinor" "1"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSFirmwareMajor" "3"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSFirmwareMinor" "1"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemProduct" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVersion" "Hewlett-Packard"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" "5CG45008GV"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSKU" "5CG45008GV"
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemFamily" ""
VBoxManage setextradata $1 "VBoxInternal/Devices/pcbios/0/Config/DmiSystemUuid" "FF83A351-167D-E311-B204-6299E803C0FF"
VBoxManage setextradata $1 "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/SerialNumber" "5CG45008GV"
VBoxManage setextradata $1 "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/FirmwareRevision" ""
VBoxManage setextradata $1 "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/ModelNumber" "Hewlett-Packard"
VBoxManage modifyvm $1 --macaddress1 d0bf9c204feb

# Does not work from a virtual machine. 
# The SLIC file from a physical machine must be used.
sudo dd if=/sys/firmware/acpi/tables/SLIC of=~/VirtualBox\ VMs/$1/SLIC.bin
VBoxManage setextradata $1 "VBoxInternal/Devices/acpi/0/Config/CustomTable" ~/VirtualBox\ VMs/$1/SLIC.bin
