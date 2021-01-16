#lang basic
10 for h = 1 to 2
20 for t = 2 to 4 step 2
30 for d = 9 to 8 step -1
40 gosub 60
50 next d : next t : next h : print "done" : end
60 print h ; t ; d
70 return