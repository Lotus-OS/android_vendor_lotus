lunch_others_targets=()
for device in $(python vendor/lotus/tools/get_official_devices.py)
do
    for var in user userdebug eng; do
        lunch_others_targets+=("lotus_$device-$var")
    done
done
