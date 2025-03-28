#include "zoo.h"
#include <iostream>
namespace zoo {
ZooManager::ZooManager() : animals(nullptr), count(0) {}
ZooManager::~ZooManager() {
    if (animals) {
        free(animals);
        animals = nullptr;
        count = 0;
    }
}

void ZooManager::load() {
    FILE* file = fopen("animals.txt", "r");
    if (!file) {
        count = 0;
        animals = nullptr;
        return;
    }

    fscanf(file, "%d\n", &count);
    animals = (Animal*)malloc(count * sizeof(Animal));

    if (!animals && count > 0) {
        fclose(file);
        count = 0;
        return;
    }

    for (int i = 0; i < count; i++) {
        fgets(animals[i].name, sizeof(animals[i].name), file);
        animals[i].name[strcspn(animals[i].name, "\n")] = 0;
        fgets(animals[i].species, sizeof(animals[i].species), file);
        animals[i].species[strcspn(animals[i].species, "\n")] = 0;
        fscanf(file, "%d\n", &animals[i].total);
    }
    fclose(file);
}

void ZooManager::save() {
    FILE* file = fopen("animals.txt", "w");
    fprintf(file, "%d\n", count);
    for (int i = 0; i < count; i++) {
        fprintf(file, "%s\n%s\n%d\n", animals[i].name, animals[i].species, animals[i].total);
    }
    fclose(file);
}

void ZooManager::display() const {
    for (int i = 0; i < count; i++) {
        printf("Зоопарк: %s, Вид: %s, Количество: %d\n", animals[i].name, animals[i].species, animals[i].total);
    }
}

void ZooManager::add() {
    animals = (Animal*)realloc(animals, (count + 1) * sizeof(Animal));
    printf("Введите название зоопарка: ");
    fgets(animals[count].name, sizeof(animals[count].name), stdin);
    animals[count].name[strcspn(animals[count].name, "\n")] = 0;
    printf("Введите вид животного: ");
    fgets(animals[count].species, sizeof(animals[count].species), stdin);
    animals[count].species[strcspn(animals[count].species, "\n")] = 0;
    printf("Введите количество животных: ");
    scanf("%d", &animals[count].total);
    getchar();
    count++;
}

void ZooManager::deleteAnimal() {
    int index;
    printf("Введите номер животного для удаления (0-%d): ", count - 1);
    scanf("%d", &index);
    getchar();

    if (index < 0 || index >= count) {
        printf("Неверно\n");
        return;
    }
    for (int i = index; i < count - 1; i++) {
        animals[i] = animals[i + 1];
    }
    count--;
    animals = (Animal*)realloc(animals, (count) * sizeof(Animal));
}

void ZooManager::edit() {
    int index;
    printf("Введите номер животного для редактирования (0-%d): ", count - 1);
    scanf("%d", &index);
    getchar();
    if (index < 0 || index >= count) {
        printf("Неверно\n");
        return;
    }

    printf("Введите новой зоопарк: ");
    fgets(animals[index].name, sizeof(animals[index].name), stdin);
    animals[index].name[strcspn(animals[index].name, "\n")] = 0;
    printf("Введите новый вид животного: ");
    fgets(animals[index].species, sizeof(animals[index].species), stdin);
    animals[index].species[strcspn(animals[index].species, "\n")] = 0;
    printf("Введите новое количество животных: ");
    scanf("%d", &animals[index].total);
    getchar();
}

void ZooManager::search() {
    char query[50];
    printf("Введите название зоопарка или вид животного для поиска: ");
    fgets(query, sizeof(query), stdin);
    query[strcspn(query, "\n")] = 0;
    for (int i = 0; i < count; i++) {
        if (strstr(animals[i].name, query) || strstr(animals[i].species, query)) {
            printf("Найдено: Название: %s, Вид: %s, Количество: %d\n", animals[i].name, animals[i].species, animals[i].total);
        }
    }
}
std::ostream& operator<<(std::ostream& os, const ZooManager& zooManager) {
    for (int i = 0; i < zooManager.count; ++i) {
        os << "Название: " << zooManager.animals[i].name << ", Вид: " << zooManager.animals[i].species << ", Количество: " << zooManager.animals[i].total << std::endl;
    }
    return os;
}
std::istream& operator>>(std::istream& is, ZooManager& zooManager) {
    zooManager.add();
    return is;
}
}
