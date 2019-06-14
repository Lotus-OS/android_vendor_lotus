for device in $(python vendor/lotus/tools/get_official_devices.py)
do
for var in user userdebug; do
add_lunch_combo lotus_$device-$var
done
done
