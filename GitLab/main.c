#include "zoo.h"
int main() {
    Animal *animals = NULL;
    int count = 0;
    load(&animals, &count);
    
   int choice;
   do{
        printf("1. Показать всех животных\n");
        printf("2. Добавить нового животного\n");
        printf("3. Удалить животное\n");
        printf("4. Редактировать\n");
        printf("5. Поиск\n");
        printf("6. Выход\n");
        printf("Введите номер: ");
        scanf("%d", &choice);
        getchar();

        switch (choice) {
            case 1:
                display(animals, count);
                break;
            case 2:
                add(&animals, &count);
                save(animals, count);
                break;
            case 3:
                deleteA(animals, &count);
                save(animals, count);
                break;
            case 4:
                edit(animals, count);
                save(animals, count);
                break;
            case 5:
                search(animals, count);
                break;
            case 6:
                save(animals, count);
                break;
            default:
                printf("Неверный номер");
        }
     }while (choice != 6);

    free(animals);
    return 0;
}
