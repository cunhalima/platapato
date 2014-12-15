#!/usr/bin/env python2
import sys
import pygame
from pygame.locals import *
# import our picture

def coiseia(infile, outfile):
    #image = pygame.image.load('map/map%02d.bmp' % num)
    image = pygame.image.load(infile)
    aa = pygame.surfarray.array2d(image)
    W = image.get_width()
    H = image.get_height()
    #f = open(("assets/map%02d.txt" % num), 'wt')
    f = open(outfile, 'wt')
    for y in xrange(H):
        for x in xrange(W):
            st = ""
            st += ("%02d" % aa[x][y])
            if x != W - 1: st += ","
            f.write(st)
        f.write("\n")
    f.close()
    #bb = aa[0][0]
    #print(bb)
    #for x in xrange(image.get_width()):
    #    for y in xrange(image.get_height()):
    #        print(x, y, aa[y][x])

#coiseia(1)
#coiseia(2)
#coiseia(3)
#coiseia(4)
#coiseia(5)
#coiseia(6)
#coiseia(7)
#coiseia(8)

coiseia(sys.argv[1], sys.argv[2])
