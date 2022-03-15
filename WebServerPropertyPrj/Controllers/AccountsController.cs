using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebServerPropertyPrj.Models;
using System.Web.Security;

namespace WebServerPropertyPrj.Controllers
{
    public class AccountsController : Controller
    {
        // GET: Accounts
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Tenant_Login(User user)
        {
            return View();
        }




        [HttpPost]
        public ActionResult Login(UserModel model)
        {
            using (ProperyProjectDBEntities context = new ProperyProjectDBEntities())
            {
                bool isValidUser = context.Users.Any(user => user.Username.ToLower() == model.UserName.ToLower() && user.Password == model.Password);
                if (isValidUser)
                {
                    System.Web.Security.FormsAuthentication.SetAuthCookie(model.UserName, false);
                    User us1 = new User();
                    us1 = context.Users.Find(model.UserName);
                    Session["userid"] = us1.UserId;
                    switch (us1.UserType.Trim())
                    {
                        case "Property Owner":
                            Session["UserType"] = "property owner";
                            break;

                        case "Property Manager":
                            Session["UserType"] = "property manager";
                            
                            break;

                        case "Tenant":
                            Session["UserType"] = "tenant";
                            break;

                    }

                    return RedirectToAction("Index", "Accounts");

                }
                ModelState.AddModelError("", "Invalid username or password !");
                return View();
            }
        }

        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(User user)
        {
            using (ProperyProjectDBEntities context = new ProperyProjectDBEntities())
            {
                context.Users.Add(user);
                context.SaveChanges();
            }
            return RedirectToAction("Login");
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,Username,Password,Firstname,Lastname,UserType")] User user)
        {
            ProperyProjectDBEntities context = new ProperyProjectDBEntities();
                if (ModelState.IsValid)
            {
                context.Users.Add(user);
                context.SaveChanges();
                return RedirectToAction("Login");
            }

            return View(user);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

    }
}