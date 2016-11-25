using System.Web.Mvc;
using MVCEmail.Models;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace MVCEmail.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "About...";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact us...";

            return View();
        }

        public ActionResult Sent()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Contact(EmailFormModel model)
        {
            if (ModelState.IsValid)
            {
                // assemble message
                MailMessage message = new MailMessage();
                message.Subject = "Daily Report";
                message.Body = "tbd: Aggregated form data";
                message.From = new MailAddress("****@****.com"); // sender's email address
                message.To.Add("****@****.com"); //  To: replace with instructor email address
                message.To.Add("****@****.com"); //  Cc: replace with email of logged-in user

                // create & send SMTP email object containing message
                using (var smtp = new SmtpClient())
                {
                    var credential = new NetworkCredential
                    {   // Gmail smtp login - replace w valid account info
                        UserName = "****gmail.com",
                        Password = "********"
                    };
                    smtp.Credentials = credential;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    await smtp.SendMailAsync(message);
                    return RedirectToAction("Sent");
                }
            }
            return View(model);
        }
    }
}
