import sys
import os
import multiprocessing.connection
import time

COMM_PORT = 6723

address = ('localhost', COMM_PORT)
conn = multiprocessing.connection.Client(address)

try:
    while True:
        pass
        msg = conn.recv()
    
        sys.stdout.write(msg)
        sys.stdout.write("\n")

        sys.stdout.flush()

        #if msg == "close":
        #    break
finally:
    pass


conn.close()

    
