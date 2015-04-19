from multiprocessing import connection
import threading

COMM_PORT = 6723

#IP and port
address = ("localhost", COMM_PORT)

listener = connection.Listener(address)

conn = listener.accept();
print("New client connected")

index = 0;
while True:
    #msg = conn.recv()

    conn.send("Does this work: {}".format(index))

    index += 1


listener.close()


