#include <stdio.h>
#include <string.h>

//PROGRAM START

int main()
{/* define a local variable a */
    int a = 1;

 /* define a pointer variable, and point it to a using the & operator */
    int * pointer_to_a = &a;

    printf("The value a is %d\n", a);
    printf("The pointer to a is %d\n", pointer_to_a);
    printf("The value of a is also %d\n", *pointer_to_a);
 
 /* let's change the variable a */
    a += 1;
    
 /* we just changed the variable a again! */
    *pointer_to_a += 1;
    
 /* will print out 3 */
    printf("The value of a is now %d\n", a);
    
    return 0;
}
