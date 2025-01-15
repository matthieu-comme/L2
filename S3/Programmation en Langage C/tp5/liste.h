typedef struct list_t
{	int value; 
  	struct list_t* next; } list_t;
  	
void print_list(list_t* list);

list_t* push_front(list_t* elt, list_t** list);