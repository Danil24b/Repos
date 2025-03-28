#include "zoo.h"
#include <iostream>
using namespace std;
using namespace zoo;
int main() {
    setlocale(LC_ALL, "");
    ZooManager zooManager;
    zooManager.load();
    int choice;
    do {
        cout << "1. Показать всех животных\n";
        cout << "2. Добавить нового животного\n";
        cout << "3. Удалить животное\n";
        cout << "4. Редактировать\n";
        cout << "5. Поиск\n";
        cout << "6. Выход\n";
        cout << "Введите номер: ";
        cin >> choice;
        cin.ignore();

        switch (choice) {
            case 1:
                zooManager.display();
                break;
            case 2:
                zooManager.add();
                zooManager.save();
                break;
            case 3:
                zooManager.deleteAnimal();
                zooManager.save();
                break;
            case 4:
                zooManager.edit();
                zooManager.save();
                break;
            case 5:
                zooManager.search();
                break;
            case 6:
                zooManager.save();
                break;
            default:
                cout << "Неверный номер\n";
        }
    } while (choice != 6);

    return 0;
}
