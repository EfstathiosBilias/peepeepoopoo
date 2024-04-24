import time

text = "Invalid argument. Please try again!"

for char in text:
	print(char, end='', flush=True)
	time.sleep(0.05)

print()
