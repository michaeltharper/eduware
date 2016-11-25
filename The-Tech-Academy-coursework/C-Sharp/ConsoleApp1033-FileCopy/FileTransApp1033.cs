using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileTransferApp1033
{
    class FileTran
    {
        static void Main(string[] args)
        {
            try
            {
                FileChecker fc = new FileChecker();
                fc.checkFile();
                Console.WriteLine("fc.getFileDate(): " + fc.getFileDate() );
            }

            catch (DirectoryNotFoundException dirNotFound)
            {
                Console.WriteLine(dirNotFound.Message);
            }

        }

        class FileChecker
        {
            string sourceDir = "C:/tta/folderA";
            string backupDir = "C:/tta/folderB";
            int LastFileCheck = 1470000000;

            public string getFileDate()
            {   Console.WriteLine("getFileDate reached");
                DateTime dt = new DateTime();
                return dt.ToString();   
            }

            
            public void checkFile()
            {
                Console.WriteLine("LastFileCheck was {0}.", LastFileCheck);
                // Get list of text files, report if none were found.
                string[] txtFileList = Directory.GetFiles(sourceDir, "*.txt");
                if (txtFileList.Length == 0)
                {
                    Console.WriteLine("No files found.");
                }

                // Copy text files
                foreach (string f in txtFileList)
                {   // Remove path from the file name.
                    string fName = f.Substring(sourceDir.Length + 1);
                    Console.WriteLine("Copied:  {0}", fName);

                    try
                    {   // Will overwrite if the destination file already exists.
                        File.Copy(Path.Combine(sourceDir, fName), Path.Combine(backupDir, fName), true);
                    }
                    // Catch exception if the file was already copied.
                    catch (IOException copyError)
                    {
                        Console.WriteLine(copyError.Message);
                    }
                }
            }
        }
    }
}