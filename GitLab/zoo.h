#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct{
    char name[50];
    char species [50];
    int total;
}Animal;
void load(Animal **animals, int *count);
void save(Animal *animals, int count);
void display(Animal *animals, int count);
void add(Animal **animals, int *count);
void deleteA(Animal *animals, int *count);
void edit(Animal *animals, int count);
void search(Animal *animals, int count);
