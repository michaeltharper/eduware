#!usr/bin/env python 
# -*- coding: utf-8 -*-
#python ver 2.7.12
# SQLite3

# Python DRILL #60

# ---------- constructor and GUI classes

import os
import datetime
import time
from Tkinter import *
from ttk import *
import Tkconstants, tkFileDialog
from fileutils import *
from dbutils import *

class Filecheck:

    def __init__(self, master):
        
        master.title('Filecheck Updater')
        master.resizable(False, False)
        master.configure(background = '#ddd')
      
        # ---------- initialize variables & styles
        print "FileCheck started at " + str(datetime.datetime.now()) + "\n"
        now = time.time()
        self.var_timestamp = IntVar()
        #self.var_timestamp.set(datetime.datetime.fromtimestamp(float(now)).strftime("%B %d, %Y, %H:%M:%S"))

        self.var_fromdir = StringVar()
        self.var_fromdir.set('./folderA/')

        self.var_todir = StringVar()
        self.var_todir.set('./folderB/')
        
        # get last timestamp from DB
        self.var_getlaststamp = StringVar()
        self.var_getlaststamp.set(getlaststamp())

        self.style = Style()
        self.style.configure('TFrame', background = '#fff')
        self.style.configure('TButton', background = '#464')
        self.style.configure('TLabel', background = '#fff', font = ('Arial', 11))
        self.style.configure('Header.TLabel', font = ('Arial', 14, 'bold'))
        self.style.configure('Comment.TLabel', font = ('Arial', 8))
        
        
        # ---------- GUI layout header frame
        self.frame_header = Frame(master)
        self.frame_header.pack(pady=10)
        
        self.photo = """R0lGODlhPAA8ANUAAP////z6+4Zthf3r/Z+cn9jV2P/+//79/u/a8P7x//Dk8du/3peGmZCBkpSQlfz//gCSAACKAACAAAB2APz//LCysO7v7sjJyKWmpQt/CBKFDyWQInW8cwuJBAqGBR2OGCB+GzqWNlusV2uzZ1eNVGuhaYG2f5ivlzF6LEFzPaLNnoeehbC6r9Lkz/b79eju5vn8+GJrXsDCv+rr6f3++/v7+vf39vT08+fn5tDQz7m5uP79/f7+/v39/fz8/ODg4CH5BAAAAAAALAAAAAA8ADwAAAb/QIBwSCwaj8ikcslsOp/Q6JMnrVqFPOpBSBMarmDkV2gDbMPo4ysUuh1q6TAN9gBQVJrJxBS4+eJXfwBrExIRGywFM3CAUlR3GRMRESQYOhc4jI1ODz0ALiKFkyQEBBiKmptLYy0bkqMMDhgXPzaeqqtCKhITHqMNDLM4N7e4Rl8GFEIchR0REDGxFTk4tgBUxkZZAD6hEc6UDQ7Ti0PY2URfhN+TMeIVqF7o5jwGO4OuHeApAuPx8vOwfGmRR18HCPz8LRoT0NzADBIMQkDRD97CIQyNjenSIpLBCBQbYMhRriGRAw8j6osAQoBIkjbGZJxHpaNKZxpiCBBm41zA/zF1bH6M4I4ArZgADMzMho3ghKEJZdS65ROdgS0vNNx0llBHAQueqmoUUudGvo8tGcCz8EepSSIhnnbwcDDny0VUlgYMZRCcTp56wdRTogwAs28f+RGQauOMKrFDPKmQ1JdlPx0/iAUOA5lICwlbIWSItlbQ5iUPGKoYIcLEDQA1lm6x8UHuSqIiL5RMWoVHbAAqQvDSEwLHARi8hRTmC1XA4mqnoTCjTHdCCAU2fgvZcecp3ZUtHWB+nVzKGFDNDHrwMKHEAD8GaCj7vDWCh2in2EbPxYPZVoOgsTCADTRQEcAGN60XAT/CwLEfEwe0YAJofQEYwlcwfDGCbeBdlv8ZID0EMMAJEFXojAQnKPDaZN+tdF8DpRmAzYNJ8HDDDwusQGGFEpCwQAK0/bfgTpggR+MqBtRgQQELlCBBiytJgMEAG1YYgQYeNgZIFm/cuIBwFXogQQk6GGKlO2ul0sgONyDAgi9WboBgX75QZFQm5cVxxg4WICDCk1Z+02IEozEwHjKbuJWkAjKUaKKVKbzEVkM3KPDno+pBEB5mZRzZGwAwDCADnJj6Eml+jgVkg6UcWtnSnWpaFSoLhkB5G5oFEPNWMm2CaaKmzukW61hCuDCimZVJQFqubxWRQAEf3PQMCO7MstuuANgwgJO38dPAYpl52kgNCZQ5CbUugTtRabPprIogRf3M8oN+eTaklAE2JGACCQx869UMNghS709fsMkkBhVIZYF24qpiwww/5EDNDcOyi5EPNlgwgwUBW6zEvTXUwMMBnXnsRcMmexwEADs="""
        self.logo = PhotoImage(data=self.photo).subsample(2,2)
        
        self.logo = Label(self.frame_header, image = self.logo)
        self.logo.grid(row = 0, column = 0)
        
        self.currentFilecheck = Label(self.frame_header, text = 'Current Filecheck: ', style = 'Header.TLabel')
        self.currentFilecheck.grid(row = 0, column = 1, sticky = 'w')

        self.timestamp = Label(self.frame_header, text = "", textvariable=self.var_getlaststamp, style = 'Header.TLabel')
        self.timestamp.grid(row = 0, column = 2, sticky = 'e')

        self.instructions = Label(self.frame_header,text = 'To update Filecheck: \nConfirm the From and To directories below, then click the \"Update Filecheck\" button',
                  style = 'Comment.TLabel')
        self.instructions.grid(row = 1, column = 1, columnspan = 2)

        # ---------- var_fromdir frame
        self.frame_var_fromdir = Frame(master)
        self.frame_var_fromdir.pack(padx = 10, pady = 10)

        self.fromdir = Label(self.frame_var_fromdir, text = 'From Directory:')
        self.fromdir.grid(row = 0, column = 0, padx = 10, pady = 5, sticky = 'w')
        
        self.button_fromdir = Button(self.frame_var_fromdir, text = 'Change From Dir',
                   command = self.changevar_fromdir)
        self.button_fromdir.grid(row = 0, column = 1, padx = 10, pady = 5,  sticky = 'w')
        
        self.fromdirValue = Label(self.frame_var_fromdir, textvariable = self.var_fromdir)
        self.fromdirValue.grid(row = 1, column = 0, padx = 10, pady = 3, sticky = 'w')


       # ---------- var_todir frame
        self.frame_var_todir = Frame(master)
        self.frame_var_todir.pack(padx = 10, pady = 10)

        self.todir = Label(self.frame_var_todir, text = 'To Directory:')
        self.todir.grid(row = 0, column = 0, padx = 10, pady = 5, sticky = 'w')
        
        self.button_todir = Button(self.frame_var_todir, text = 'Change To Dir',
                   command = self.changevar_todir)
        self.button_todir.grid(row = 0, column = 1, padx = 10, pady = 5,  sticky = 'w')
        
        self.todirValue = Label(self.frame_var_todir, textvariable = self.var_todir)
        self.todirValue.grid(row = 1, column = 0, padx = 10, pady = 3, sticky = 'w')


        # ---------- update/cancel buttons frame
        self.frame_change = Frame(master)
        self.frame_change.pack(pady=10)
        
        self.button_updateFilecheck = Button(self.frame_change, text = 'Update Filecheck',
                command = lambda: runFileCheck(self))
        self.button_updateFilecheck.grid(row = 4, column = 0, padx = 10, pady = 10, sticky = 'e')


    # change var_fromdir - directory that files are moved from   
    def changevar_fromdir(self):
        self.var_fromdir.set(tkFileDialog.askdirectory())

  
    # change var_todir - directory that files are moved to 
    def changevar_todir(self):
        self.var_todir.set(tkFileDialog.askdirectory())
 
def main():            
    root = Tk()
    filecheck = Filecheck(root)
    root.mainloop()
    
if __name__ == "__main__": main()
