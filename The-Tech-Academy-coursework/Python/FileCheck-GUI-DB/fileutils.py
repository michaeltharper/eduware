#!usr/bin/env python 
# -*- coding: utf-8 -*-
#python ver 2.7.12
# SQLite3

# Python DRILL #60

# ---------- file checker and related utils

import os
import datetime
import time
import shutil
from dbutils import *

        
# return true if file is a text file
def isTextFile(thisFile):    
    if thisFile.endswith('txt'):
        return True

# return true if file created within last 24 hrs
def fileIsModified(fullPath):
    m = os.path.getmtime(fullPath) # creation time
    nowtime = time.time()
    diff = (nowtime - m)/86400   
    if diff < 1:            
        print "NEW or MODIFIED FILE:"
        return True

# -----------------------------> RUNNER 

def runFileCheck(self):
    var_fromdir = self.var_fromdir.get()
    var_todir = self.var_todir.get()

    timenow = datetime.datetime.fromtimestamp(float(time.time())).strftime("%B %d, %Y, %H:%M:%S")
    timestamp(timenow)
    
    # check files in from directory for New or Modified dates < 24 hs
    allCandidateFiles = os.listdir(var_fromdir)
    now = time.time()
    
    # for each candidate file
    for thisFile in allCandidateFiles:
        # construct full path for each file
        fullPath = os.path.join(var_fromdir,thisFile)
        
        # if a text file
        if isTextFile(fullPath):
            # and if it's recently modified
            if fileIsModified(fullPath):         

                # refresh timestamp
                #print "timenow: " + str(timenow)
                self.var_timestamp.set(timenow)
                
                #self.timestamp(timenow)
                
                # move the file to the staging directory...   
                print str(fullPath) + " was recently modified and will be copied to HQ tonight."
                shutil.move(fullPath,var_todir)
             
    #self.var_timestamp.set(datetime.datetime.fromtimestamp(float(now)).strftime("%B %d, %Y, %H:%M:%S"))
    #self.var_timestamp.set("hello")
    self.var_getlaststamp.set(getlaststamp())
