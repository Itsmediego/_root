# gpio_blink.py
# by Scott Kildall (www.kildall.com)
# LED is on pin 27, use a 1K Ohm reistor to ground

import RPi.GPIO as GPIO
import time

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(27, GPIO.OUT)

state = True

# endless loop, on/off for 1 second
# while True:
for i in range(0,10):
	GPIO.output(27,True)
	time.sleep(1)	
	GPIO.output(27,False)
	time.sleep(1)

