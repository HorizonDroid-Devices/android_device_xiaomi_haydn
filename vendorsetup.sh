echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/HorizonDroid-Devices/android_device_xiaomi_sm8350-common-haydn -b HorizonDroid device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree'
git clone https://github.com/HorizonDroid-Devices/android_kernel_xiaomi_sm8350 --recursive --depth=1 -b lineage-21 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning vendor tree'
git clone https://github.com/HorizonDroid-Devices/proprietary_vendor_xiaomi_haydn -b lineage-21 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning common vendor tree'
git clone https://github.com/HorizonDroid-Devices/proprietary_vendor_xiaomi_sm8350-common-haydn -b lineage-21 vendor/xiaomi/sm8350-common

# Xiaomi
echo 'Cloning hardware xiaomi'
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi -b lineage-21 hardware/xiaomi

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware.git -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera.git -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

# Audio
echo 'Adding audio-app support'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Audio-app-main/0001-Add-audio-app-support.patch
patch -p1 <0001-Add-audio-app-support.patch
cd ../..

# VoNR
echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

# Gms
echo 'Adding Gms patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Gms/0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Gms/0002-Remove-read-device-config-checks.patch
patch -p1 <0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
patch -p1 <0002-Remove-read-device-config-checks.patch
cd ../..

# Dolby
echo 'Adding Dolby patch'
cd frameworks/av
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Dolby/0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Dolby/0004-Import-Dolby-Effects-initialization.patch
patch -p1 <0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0004-Import-Dolby-Effects-initialization.patch
cd ../..

# Optimization
echo 'Adding optimization patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Optimization/0001-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0001-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
