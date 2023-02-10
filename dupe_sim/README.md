# dupe_sim.py
`dupe_sim.py` tries to simulate the reception of frames over both the LANs by a DANP.
The frames in this case are simply the sequence numbers.

## def genframes(nframes=3)
Generates frames, i.e, sequence numbers, and "sends" them by calling `sendframes()` for
each LAN. The argument `nframes` specifies the number of frames that it sends at once.
For example, if seqnr=0 and nframes=3, it sends the frames [0, 1, 2] at a time by calling
`sendframes()`.
It calls `sendframes()` for both the LANs by running two separate threads with
`sendframes` as the starting point, with arguments for the LAN\_id and the list of
frames. Since python threads cannot be run parallely, we randomize the order in which
the two threads are called. We then wait for the two threads to complete, increment
the sequence number and continue.
TODO: maybe use multiprocessing or something to have it run truly parallely.

## def sendframes(LAN_id, frames)
`frames` is a list of frames and `LAN_id` is 'A' or 'B'. It shuffles the frames and calls
`receive(f, LAN_id)` for each frame f. It also goes to sleep for a short while to allow
for sending to be interleaved between the two LANs.

## def receive(seqnr, LAN_id)
Receive frame with given sequence number over given LAN. Does the duplicate discard stuff.
This is where we try out our duplicate discard algorithm.
