import sys, os


while True:
    i = sys.stdin.readline() 
    if i == "":
        break
    i = i.rstrip()
    parts = i.split (" ", 2)
    msg = parts[2]
    #print msg
    os.system('espeak  "{0}" -w padded.wav'.format(msg))
    os.system('sox padded.wav -b 8 -e unsigned-integer -c 1 -r 4000 -t raw rawfile')

    #print "complete"

    framerate = 10 ; slice=4000/framerate
    dat = open("rawfile").read()
    frames = []

    for i in range(0,len(dat),slice):
        samples = map(lambda x:ord(x)-128,
                      dat[i:i+slice])
        frames.append(max(samples))

    pics = ["mouth-closed.png",
            "mouthopen-1.png",
            "mouthopen-2.png"]
    max_mouthOpen = len(pics)-1

    step = int(max(frames)/(max_mouthOpen*2))
    for i in range(len(frames)):
        mouth=min(int(frames[i]/step),max_mouthOpen)
        if i:
            if mouth>frames[i-1]+1:
                mouth=frames[i-1]+1
            elif mouth < frames[i-1]-1:
                mouth=frames[i-1]-1
        else: mouth=0
        frames[i] = mouth
        os.system("ln -s %s frame%09d.png" %
                  (pics[mouth],i))

    os.system(("mencoder 'mf://frame0*.png' " +
              "-audiofile padded.wav -mf type=png " +
              "-mf fps=%d -oac mp3lame -ovc lavc " +
              "-o animation.mp4 && rm frame0*.png")
              % framerate)

    #clean up files
    os.system("rm padded.wav rawfile")
    #open player and play animation
    os.system("omxplayer animation.mp4")
    os.system("fim mouth-closed.png")



print "end script"