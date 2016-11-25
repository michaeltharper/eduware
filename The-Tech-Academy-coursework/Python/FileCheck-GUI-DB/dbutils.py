#!usr/bin/env python 
# -*- coding: utf-8 -*-
#python ver 2.7.12
# SQLite3

# Python DRILL #60

# ---------- database utils

import sqlite3
import time
import datetime
import random

def create_table():
    conn = sqlite3.connect('FileCheck.db')
    c = conn.cursor()
    c.execute("CREATE TABLE IF NOT EXISTS Checktable(id INTEGER PRIMARY KEY AUTOINCREMENT, unix REAL, timestamp TEXT, keyword TEXT, value REAL)")
    #print "create_table() finished"
    conn.commit()
    c.close()
    conn.close()
create_table()

def timestamp(timestamp):
    #print("\ntimestamp() called.\n")
    conn = sqlite3.connect('FileCheck.db')
    c = conn.cursor()
    unix = int(time.time())
    #print timestamp
    c.execute("INSERT INTO Checktable (unix, timestamp) VALUES (?, ?)",
          (unix, timestamp))
    conn.commit()
    c.close()
    conn.close()
    #print("\ntimestamped: " + timestamp +"\n")

def getlaststamp():
    #print("\ngetlaststamp() called.\n")
    conn = sqlite3.connect('FileCheck.db')
    c = conn.cursor()
    c.execute("SELECT timestamp FROM Checktable ORDER BY unix desc limit 1")
    try:
        data = c.fetchone()[0]
    except:
        data = "No transfer to date."
    c.close()
    conn.close()
    return data

def clear_table():
    c.execute('DELETE FROM Checktable')
    conn.commit()

'''
def read_db():
    c.execute('SELECT * FROM Checktable')
    data = c.fetchall()
    for row in data:
        print(row)
#read_db()
'''
