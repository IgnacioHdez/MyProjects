import serial, time
import pyglet

# Importamos la musica

# Copiar esta parte
song1 = pyglet.media.load('vaso.mp3')
# Hasta aqui
song2 = pyglet.media.load('exprimidor.mp3')


#Iniciamos el arduino
arduino = serial.Serial('COM3', 9600)
time.sleep(2)

def exiter(dt):
    pyglet.app.exit()

# Guardamos el numero de lecturas
reads=0

# Mientras el numero de lecturas sea menor que 10
while reads < 10:
    print("Waiting for signal")
    
    # Leemos lo ultimo que dice el arduino
    rawString = str(arduino.readline())
    
    # Copiar esta parte
    # Si el arduino ha encendido el boton 1 reproducimos la musica 1
    if rawString.find('ON1') > 0:
        print("\tON1")
        song1.play()
        pyglet.clock.schedule_once(exiter, song1.duration)

        
        pyglet.app.run()
    # Hasta aqui
    
    if rawString.find('ON2') > 0:
        print("\tON2")
        song2.play()
        pyglet.clock.schedule_once(exiter, song2.duration)
        pyglet.app.run()


    reads = reads + 1
    print("End of reading\n" )

arduino.close()
