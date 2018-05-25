
// digital pin 2 has a pushbutton attached to it. Give it a name:
int pushButton1 = 2;
int pushButton2 = 3;
int pushButton3 = 4;
int pushButton4 = 5;

int printed1 = 0;
int printed2 = 0;
int printed3 = 0;
int printed4 = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // Communication process
  Serial.begin(9600);
  
  // make the pushbutton's pin an input:
  pinMode(pushButton1, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(pushButton3, INPUT);
  pinMode(pushButton4, INPUT);
 


}

// the loop function runs over and over again forever
void loop() {
  int buttonState1 = digitalRead(pushButton1);
  int buttonState2 = digitalRead(pushButton2);
  int buttonState3 = digitalRead(pushButton3);
  int buttonState4 = digitalRead(pushButton4);
  
  //----------------------------------------------1----------------------------------------
  //If on print the answer to serial
  if (buttonState1 == LOW && printed1 == 0)
  {Serial.println("ON1"); printed1 = 1;}

  //When off print to serial
   if (buttonState1 == HIGH && printed1 == 1)
  {Serial.println("OFF1"); printed1 = 0;}


  //----------------------------------------------2----------------------------------------
   //If on print the answer to serial
  if (buttonState2 == LOW && printed2 == 0)
  {Serial.println("ON2"); printed2 = 1;}

  //When off print to serial
   if (buttonState2 == HIGH && printed2 == 1)
  {Serial.println("OFF2"); printed2 = 0;}



  //----------------------------------------------3----------------------------------------
   //If on print the answer to serial
  if (buttonState3 == LOW && printed3 == 0)
  {Serial.println("ON3"); printed3 = 1;}

  //When off print to serial
   if (buttonState3 == HIGH && printed3 == 1)
  {Serial.println("OFF3"); printed3 = 0;}


  //----------------------------------------------4----------------------------------------
   //If on print the answer to serial
  if (buttonState4 == LOW && printed4 == 0)
  {Serial.println("ON4"); printed4 = 1;}

  //When off print to serial
   if (buttonState4 == HIGH && printed4 == 1)
  {Serial.println("OFF4"); printed4 = 0;}

  delay(10);                       
}













