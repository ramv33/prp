#!/usr/bin/python3

import logging
import threading
import random
import time

# Generate frames and send them by calling sendframes() for each LAN
# @nframes: number of frames to send at a time
def genframes(nframes=3):
    seqnr = 0
    logging.info('in genframes')
    while True:
        frames = list(range(seqnr, seqnr+nframes))
        A = threading.Thread(target=sendframes, args=('A', frames.copy()))
        B = threading.Thread(target=sendframes, args=('B', frames.copy()))
        # start which first?
        if random.choice([0,1]):
            A.start()
            B.start()
        else:
            B.start()
            A.start()
        # wait for above two threads to join (or maybe not??)
        A.join()
        B.join()
        seqnr += nframes
        time.sleep(1)

# Send frames with sequence number for given LAN; one thread for each LAN/port
# @frames: list of sequence number to send. Shuffle and send to simulate out-of-order
def sendframes(LAN_id, frames):
    random.shuffle(frames)  # to simulate out of order reception 
    for f in frames:
        receive(f, LAN_id)
        time.sleep(0.5)     # so that sending is more likely to be interleaved

# Do the duplicate discard here using whatever method
buffer = [] # use buffer to discard duplicates
buflock = threading.Lock()
def receive(seqnr, LAN_id):
    # do duplicate discard and stuff
    # drop window or whatever

    # acquire lock on buffer, else both will do check and find frame not in buffer
    buflock.acquire()
    # logging.info(f'recv: frame {seqnr=:05d} from {LAN_id=} {buffer=}')
    if seqnr in buffer: # discard frame
        logging.info(f'recv: frame {seqnr=:05d} from {LAN_id=} DROPPED!')
    else:   # receive frame
        buffer.append(seqnr)
    buflock.release()

def main():
    fmt = '[%(asctime)s.%(msecs)03d]: %(message)s'
    logging.basicConfig(format=fmt, level=logging.DEBUG, datefmt='%H:%M:%S')
    logging.info('main started')
    genframes()

if __name__ == '__main__':
    main()
