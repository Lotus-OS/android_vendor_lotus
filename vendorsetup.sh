for combo in $(curl -s https://raw.githubusercontent.com/LotusOS/android_vendor_lotus/pie/lotus.devices | sed -e 's/#.*$//' | awk '{printf "lotus_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done