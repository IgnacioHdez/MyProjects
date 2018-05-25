#include <stdio.h>
#include <string.h>

//FUNCTION DECLARATION

int MyFun(int x);


//PROGRAM START

int main()
{
 //Hellow Wolrd------------------------------------------------------

    /* printf("Hellow World\n"); */
    /* return 0; */

 //Woring with integres----------------------------------------------
 
    /* int a = 1; */
    /* int b; */
    /* b = 2; */
    /* int c = a + b; */
    /* printf("%d",c); */
 
 //Working with arrays-----------------------------------------------
    
    /* int numbers[3]; */

    /* numbers[0]=1; */
    /* numbers[1]=2; */
    /* numbers[2]=3; */
    
    /* printf("The last number is %d",numbers[2]); */
  
  //Multidimensional arrays------------------------------------------
  
    /* int M[2][2]; */
    /* M[0][0]=1; */
    /* M[0][1]=2; */
    /* M[1][0]=3; */
    /* M[1][1]=4; */
    
    /* printf("%d",M[1][1]); */

  //Working with strings---------------------------------------------
    
    /* //Declaration-------------------------------- */
    /* char * name = (char*)"Jack Sparrow";   //This is inmutable */
    /* /1* char name2[] = "Jack Sparrow";   //This is mutable *1/ */
    /* /1* char name3[13] = "Jack Sparrow"; //This is equivalent to the previous *1/ */
    
    /* //Printing----------------------------------- */
    /* int age = 25; */

    /* printf("%s is %d years old.\n", name, age); */
    
    /* //Length calc-------------------------------- */
    /* int length=strlen(name); */
    /* printf("(%s) has %d characters.\n", name, length); */
    
    /* //Compare------------------------------------ */
    /* if (strncmp (name, "Jack Sparrow",12) == 0) */
    /* {printf("They are equal\n");} */
    /* else */
    /* {printf("They are different\n");} */
    
    /* //Concatenate-------------------------------- */
    /* char X[20] ="Hi "; */
    
    /* strncat(X,name,5); */
    /* printf("%s\n",X); */
    /* strncat(X,name,5); */
    /* printf("%s\n",X); */

  //For and while loop-----------------------------------------------
    
    /* printf("For:\n\n"); */
    /* for(int i=0;i<10;i++) */
    /*     printf("%d\n",i); */
    
    /* printf("While:\n\n"); */
    /* int j=0; */
    /* while (j<10) */
    /* {   printf("%d\n",j); */
    /*     j=j+2; */
    /* } */
  
  //Function use-----------------------------------------------------
    
    /* printf("%d\n",MyFun(4)); */
    /* printf("%d\n",MyFun(5)); */
    /* printf("%d\n",MyFun(6)); */
    
    return 0;
}


int MyFun(int x)
{   static int cnt=0;
    cnt++;
    printf("This is my %dth use of the function\n",cnt);
    return (x+5)*2 ;
}
