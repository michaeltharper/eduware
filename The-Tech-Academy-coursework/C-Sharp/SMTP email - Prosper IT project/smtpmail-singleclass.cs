using System;
using System.Net;
using System.Net.Mail;

namespace Examples.SmtpExamples.Tests
{
    public class SimpleSmtpExample
    {
        public static void Main(string[] args)
        {
            SendTestMessage();
        }

        public static void SendTestMessage()
        {
            // assemble message
            string to = "aaaaa@zzzzz.com";  // "instructor email";
            string cc = "aaaaa@zzzzz.com";   // "student email for cc";
            to = to + ", " + cc;  // concatenate to and cc, with comma delimiter
            string from = "aaaaa@zzzzz.com";
            string subject = "Daily Report";
            string body = "Body of message...";
            MailMessage message = new MailMessage(from, to, subject, body);

            // config smtp bundle
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            var credential = new NetworkCredential
            {
                UserName = "*****@gmail.com",  // provide valid gmail username and password
                Password = "*********"
            };
            client.Credentials = credential;
            //Console.WriteLine("Changing timeout from {0} to 500.", client.Timeout);
            //client.Timeout = 500;


            try
            {
                client.Send(message);
            }

            
            catch (SmtpFailedRecipientsException e)  // SmtpException
            {
                Console.WriteLine("Exception caught in CreateTimeoutTestMessage(): {0}\n\n",
                            e.ToString());
                Console.WriteLine("Exception Message(): {0}",
                            e.Message);
            }
        }
    }
}
