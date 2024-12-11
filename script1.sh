#!/bin/bash
temperatures=()
c_to_f() {
    celsius=$1
    fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
    echo $fahrenheit
    }
f_to_c() {
    fahrenheit=$1
    celsius=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc)
    echo $celsius
    }
while true; do
    echo "1 - добавить температуру"
    echo "2 - показать температуры в Цельсиях"
    echo "3 - показать температуры в Фаренгейтах"
    echo "4 - выход"
    read -p "Введите номер: " choice
    if [ "$choice" -eq 1 ]; then
        read -p "Введите температуру в Цельсиях: " temp
        temperatures+=("$temp")
        echo "Температура $temp °C добавлена"

    elif [ "$choice" -eq 2 ]; then
        echo "Температуры в Цельсиях:"
        for temp in "${temperatures[@]}"; do
            echo "$temp °C"
        done

    elif [ "$choice" -eq 3 ]; then
        echo "Температуры в Фаренгейтах:"
        for temp in "${temperatures[@]}"; do
            fahrenheit=$(c_to_f "$temp")
            echo "$fahrenheit °F"
        done

    elif [ "$choice" -eq 4 ]; then
        echo "Выход"
        break

    else
        echo "Неверный ввод"
    fi
done
