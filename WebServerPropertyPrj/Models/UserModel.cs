using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebServerPropertyPrj.Models
{
    public class UserModel
    {
        private int id;
        private string userName;
        private string password;

        public string UserName { get => userName; set => userName = value; }
        public int Id { get => id; set => id = value; }
        public string Password { get => password; set => password = value; }
    }
}