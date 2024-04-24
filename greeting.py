import time

text = "Hi! My name is peepeepoopoo and I am a machine designed to help with every day activities."

for char in text:
	print(char, end='', flush=True)
	time.sleep(0.05)

print()
