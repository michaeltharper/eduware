Database backup via file transfer - Python 2.7, IDLE 

Ticket: 
You recently created a script that will check a folder for new or modified files, and then copy those new or modified files to another location. You also created a GUI that makes using the script easier and more versatile.

Users are reporting issues with the current system you've made. Specifically, they are having to manually initiate the 'file check' script at the same time each day. Because they aren't doing this at the EXACT same time each day, some files that were edited right around the time the script was meant to be run were missed, and weren't copied to the outgoing files destination.
This means you will have to provide for recording the last time the 'file check' process was performed, so that you can be sure to cover the entire time period in which new or edited files could occur.

Create a database with a table that can store the date and time of the last 'file check' process, and use that date/time as a reference point in terms of finding new or modified files. Users are asking that the GUI also display the date and time of the last 'file check' process.

Requirements:
- creation of a database and appropriate table(s) using sqlite,
- modification of the existing Python script to both record date/time of 'file check' runs and to retrieve that data for use in the 'file check' process, and
- modification of the existing TKinter-based GUI to display the last 'file check' date/time.

Requirements
Python 2.7 or later, SQLite3, TKinter

----- ----- ----- ----- ----- ----- ----- ----- 

SOLUTION

#python ver 2.7.12, SQLite3

Run file FileCheckGUI.py, which imports fileutils.py and dbutils.py.

The application stores data in a SQLite3 database file. When launched, the application will create a GUI and attempt to establish a connection to an existing database. If none is found, a new empty database will be created and the GUI will display "No transfer to date".

The 'to' and 'from' directories can be modified with the "Change From Dir" and "Change To Dir" buttons.  Two default folders are provided - folderA and folderB - to act as the 'from' and'to' folders.  Sample files are provided - edit and save one of the text files, then run the application - only the edited .txt file should transfer.  A sample .jpg file is included to test the filtering - no files other than txt files should be transfered, regardless of modification date.

Clicking the Update Filecheck button will insert the first record in the database, and update the Current Filecheck timestamp.  Every time the "Update Filecheck" button is clicked, the Current Filecheck timestamp is updated.  The application then examines files in folderA, moves any modified in the last 24 hours to folderB, writing out the filename of any files moved.

