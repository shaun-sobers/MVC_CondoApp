using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebServerPropertyPrj.Models;

namespace WebServerPropertyPrj.Controllers
{
    public class Contact_ReportController : Controller
    {
        private ProperyProjectDBEntities db = new ProperyProjectDBEntities();

        // GET: Contact_Report
        public ActionResult Index()
        {


            return View(db.Contact_Reports.ToList());
        }

        // GET: Contact_Report/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact_Report contact_Report = db.Contact_Reports.Find(id);
            if (contact_Report == null)
            {
                return HttpNotFound();
            }
            Session["toUser"] = contact_Report.ToUserId;
            Session["fromUser"] = contact_Report.FromUserId;
            return View(contact_Report);
        }

        // GET: Contact_Report/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contact_Report/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MessageId,ToUserId,FromUserId,Message,ReportType,AppointmentDate")] Contact_Report contact_Report)
        {
            if (ModelState.IsValid)
            {
                db.Contact_Reports.Add(contact_Report);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contact_Report);
        }


        public ActionResult ReplyMessage()
        {
            return View();
        }


        // POST: Contact_Report/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ReplyMessage(int id,[Bind(Include = "MessageId,ToUserId,FromUserId,Message,ReportType,AppointmentDate")] Contact_Report contact_Report)
        {
            if (ModelState.IsValid)
            {
                db.Contact_Reports.Add(contact_Report);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contact_Report);
        }


        public ActionResult SendMessageTenant()
        {
            List<User> UserList = db.Users.ToList();
            ViewBag.UserList = UserList;
            return View();
        }

        // POST: Contact_Report/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SendMessageTenant([Bind(Include = "MessageId,ToUserId,FromUserId,Message,ReportType,AppointmentDate")] Contact_Report contact_Report)
        {
            List<User> UserList = db.Users.ToList();
            ViewBag.UserList = UserList;
            if (ModelState.IsValid)
            {
                contact_Report.FromUserId = Convert.ToInt32(Session["userid"]);
                db.Contact_Reports.Add(contact_Report);
                db.SaveChanges();
                return RedirectToAction("SendMessageTenant");
            }

            return View(contact_Report);
        }


        public ActionResult GetInbox(int? id)
        {
            List<Contact_Report> InboxList = db.Contact_Reports.Where(x => x.ToUserId == id).ToList();
            return View(InboxList);
        }

        // GET: Contact_Report/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact_Report contact_Report = db.Contact_Reports.Find(id);
            if (contact_Report == null)
            {
                return HttpNotFound();
            }
            return View(contact_Report);
        }

        // POST: Contact_Report/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MessageId,ToUserId,FromUserId,Message,ReportType,AppointmentDate")] Contact_Report contact_Report)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contact_Report).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contact_Report);
        }

        // GET: Contact_Report/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact_Report contact_Report = db.Contact_Reports.Find(id);
            if (contact_Report == null)
            {
                return HttpNotFound();
            }
            return View(contact_Report);
        }

        // POST: Contact_Report/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contact_Report contact_Report = db.Contact_Reports.Find(id);
            db.Contact_Reports.Remove(contact_Report);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
