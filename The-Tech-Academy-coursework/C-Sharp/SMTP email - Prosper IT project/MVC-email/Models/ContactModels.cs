using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Bmail.Models
{
    public class ContactModels
    {
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "A destination email is required")]
        public string Email { get; set; }
        [Required(ErrorMessage = "An essay is required")]
        public string Essay { get; set; }
    }
}