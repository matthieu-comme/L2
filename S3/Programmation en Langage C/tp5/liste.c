#include <stdio.h>
#include <stdlib.h>

typedef struct list_t
{	int value; 
  	struct list_t* next; } list_t;
  	
void print_list(list_t* list) {
	if(list == NULL) return;
	for(list_t* it = list; it; it = it->next) // while p ?
		printf("%d%s", it->value, (it->next?",":"\n"));
	/* list_t* it = *list;
	while(it) {
		printf("%d, ", it->value);
		it = it->next;
	}*/
}

list_t* push_front(list_t* elt, list_t** list) {
	if(elt==NULL)
		return *list;
	elt->next = *list;
	*list = elt; // retourn elt suffit ? non
	return *list;
}