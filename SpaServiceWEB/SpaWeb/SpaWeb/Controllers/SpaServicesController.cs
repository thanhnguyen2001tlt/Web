using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SpaWeb.Models;

namespace SpaWeb.Controllers
{
    public class SpaServicesController : Controller
    {
        private BeautySystemDBEntities db = new BeautySystemDBEntities();

        // GET: SpaServices
        public ActionResult Index()
        {
            var spaService = db.SpaService.Include(s => s.Service).Include(s => s.Spa);
            return View(spaService.ToList());
        }

        // GET: SpaServices/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpaService spaService = db.SpaService.Find(id);
            if (spaService == null)
            {
                return HttpNotFound();
            }
            return View(spaService);
        }

        // GET: SpaServices/Create
        public ActionResult Create()
        {
            ViewBag.ServiceID = new SelectList(db.Service, "Service Name", "Description");
            ViewBag.SpaID = new SelectList(db.Spa, "Spa Name", "SpaName");
            return View();
        }

        // POST: SpaServices/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SpaServiceID,ServiceID,SpaID,Description,Price,DiscountMoney,DiscountPercent,Response,Image")] SpaService spaService)
        {
            Random id = new Random();
            string _FileName = "";
            string _path = "";
            if (ModelState.IsValid)
            {
                HttpPostedFileBase image = Request.Files["image"];
                spaService.SpaServiceID = id.Next().ToString();
                if (image.FileName != "")
                {
                    string name = image.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = "spv" + spaService.SpaServiceID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    spaService.Image = _FileName;
                }
                else
                {
                    spaService.Image = "defaultimg.png";
                }
                db.SpaService.Add(spaService);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServiceID = new SelectList(db.Service, "ServiceID", "ServiceType", spaService.ServiceID);
            ViewBag.SpaID = new SelectList(db.Spa, "SpaID", "SpaName", spaService.SpaID);
            return View(spaService);
        }

        // GET: SpaServices/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpaService spaService = db.SpaService.Find(id);
            if (spaService == null)
            {
                return HttpNotFound();
            }
            ViewBag.ServiceID = new SelectList(db.Service, "ServiceID", "ServiceType", spaService.ServiceID);
            ViewBag.SpaID = new SelectList(db.Spa, "SpaID", "SpaName", spaService.SpaID);
            return View(spaService);
        }

        // POST: SpaServices/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SpaServiceID,ServiceID,SpaID,Description,Price,DiscountMoney,DiscountPercent,Response,Image")] SpaService spaService)
        {
            string _FileName = "";
            string _path = "";
            if (ModelState.IsValid)
            {
                HttpPostedFileBase image = Request.Files["image"];
                if (image.FileName != "")
                {
                    string name = image.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = spaService.SpaServiceID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    spaService.Image = _FileName;
                }
                db.Entry(spaService).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServiceID = new SelectList(db.Service, "ServiceID", "ServiceType", spaService.ServiceID);
            ViewBag.SpaID = new SelectList(db.Spa, "SpaID", "SpaName", spaService.SpaID);
            return View(spaService);
        }

        // GET: SpaServices/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpaService spaService = db.SpaService.Find(id);
            if (spaService == null)
            {
                return HttpNotFound();
            }
            return View(spaService);
        }

        // POST: SpaServices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {

            SpaService spaService = db.SpaService.Find(id);
            db.SpaService.Remove(spaService);
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
