USAGE

#python ver 2.7.12, SQLite3


Run file FileCheckGUI.py, which imports fileutils.py and dbutils.py.

The application stores data in a SQLite3 database file. When launched, the application will create a GUI and attempt to establish a connection to an existing database. If none is found, a new empty database will be created and the GUI will display "No transfer to date".

The 'to' and 'from' directories can be modified with the "Change From Dir" and "Change To Dir" buttons.  Two default folders are provided - folderA and folderB - to act as the 'from' and'to' folders.  Sample files are provided - edit and save one of the text files, then run the application - only the edited .txt file should transfer.  A sample .jpg file is included to test the filtering - no files other than txt files should be transfered, regardless of modification date.

Clicking the Update Filecheck button will insert the first record in the database, and update the Current Filecheck timestamp.  Every time the "Update Filecheck" button is clicked, the Current Filecheck timestamp is updated.  The application then examines files in folderA, moves any modified in the last 24 hours to folderB, writing out the filename of any files moved.