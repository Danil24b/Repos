#include <ostream>
#include <cstring>

namespace zoo {

struct Animal {
    char name[50];
    char species[50];
    int total;
};

class ZooManager {
private:
    Animal* animals;
    int count;

public:
    ZooManager();
    ~ZooManager();

    void load();
    void save();
    void display() const;
    void add();
    void deleteAnimal();
    void edit();
    void search();

    int getCount() const { return count; }
    Animal* getAnimals() { return animals; }

    friend std::ostream& operator<<(std::ostream& os, const ZooManager& zooManager);
    friend std::istream& operator>>(std::istream& is, ZooManager& zooManager);
};

}

