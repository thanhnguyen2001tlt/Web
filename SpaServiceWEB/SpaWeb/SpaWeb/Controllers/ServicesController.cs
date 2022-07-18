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
    public class ServicesController : Controller
    {
        private BeautySystemDBEntities db = new BeautySystemDBEntities();

        // GET: Services
        public ActionResult Index()
        {
            var service = db.Service.Include(s => s.ServiceType1);
            return View(service.ToList());
        }

        // GET: Services/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.Service.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            return View(service);
        }

        // GET: Services/Create
        public ActionResult Create()
        {
            ViewBag.ServiceType = new SelectList(db.ServiceType, "ServiceType1", "Description");
            return View();
        }

        // POST: Services/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ServiceID,ServiceType,Description,Image")] Service service)
        {
            Random id = new Random();
            string _FileName = "";
            string _path = "";
            if (ModelState.IsValid)
            {
                HttpPostedFileBase image = Request.Files["image"];
                service.ServiceID = id.Next().ToString();
                if (image.FileName != "")
                {
                    string name = image.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = "spv" + service.ServiceID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    service.Image = _FileName;
                }
                else
                {
                   service.Image = "defaultimg.png";
                }
                db.Service.Add(service);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ServiceType = new SelectList(db.ServiceType, "ServiceType1", "Description", service.ServiceType);
            return View(service);
        }

        // GET: Services/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.Service.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            ViewBag.ServiceType = new SelectList(db.ServiceType, "ServiceType1", "Description", service.ServiceType);
            return View(service);
        }

        // POST: Services/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ServiceID,ServiceType,Description,Image")] Service service)
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
                    _FileName = service.ServiceID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    service.Image = _FileName;
                }
                db.Entry(service).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ServiceType = new SelectList(db.ServiceType, "ServiceType1", "Description", service.ServiceType);
            return View(service);
        }

        // GET: Services/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.Service.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            return View(service);
        }

        // POST: Services/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            List<SpaService> listsvt = new List<SpaService>();
            foreach (SpaService sp in db.SpaService)
            {
                if (sp.Service.ServiceID == id)
                {
                    listsvt.Add(sp);
                }
            }
            foreach (SpaService spasv in listsvt)
            {
                deleteSpaService(spasv);
            }
            Service service = db.Service.Find(id);
            db.Service.Remove(service);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        private void deleteSpaService(SpaService ssv)
        {
            db.SpaService.Remove(ssv);
            db.SaveChanges();
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
