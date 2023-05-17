import cursor
import time

cursor.hide()

start = time.time()

while True:
    print("\r", end="")
    time.sleep(1)
    print(int(time.time()-start), end="")
