#include <stdio.h>
#include <stdlib.h>
#include "liste.h"

// 2, 5, 1, 3, 4

int main() {

list_t *L = malloc(sizeof(list_t));
L->value=4;
print_list(L);

list_t *p1 = malloc(sizeof(list_t));
p1->value = 3;
L = push_front(p1, &L);
print_list(L);

list_t *p2 = malloc(sizeof(list_t));
p2->value = 1;
L = push_front(p2, &L);
print_list(L);

list_t *p3 = malloc(sizeof(list_t));
p3->value = 5;
L = push_front(p3, &L);
print_list(L);

list_t *p4 = malloc(sizeof(list_t));
p4->value = 2;
L = push_front(p4, &L);
print_list(L);

} 
//(L->next).value