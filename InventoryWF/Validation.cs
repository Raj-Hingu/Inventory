using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace InventoryWF
{
    public class Validation
    {
        public int orderID { get; set; }

        [Required(ErrorMessage = "Title is required")]
        public string Title { get; set; }

        public DateTime ReleaseDate { get; set; }

        [Required(ErrorMessage = "Genre must be specified")]
        public string Genre { get; set; }

        [Range(1, 100, ErrorMessage = "Price must be between $1 and $100")]
        public decimal Price { get; set; }

        [StringLength(5)]
        public string Rating { get; set; }

        public void cityValidation()
        {
           
        }
    }
}