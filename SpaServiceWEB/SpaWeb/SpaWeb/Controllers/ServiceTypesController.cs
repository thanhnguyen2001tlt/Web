using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SpaWeb.Models;

namespace SpaWeb.Controllers
{
    public class ServiceTypesController : Controller
    {
        private BeautySystemDBEntities db = new BeautySystemDBEntities();

        // GET: ServiceTypes
        public ActionResult Index()
        {
            return View(db.ServiceType.ToList());
        }

        // GET: ServiceTypes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServiceType serviceType = db.ServiceType.Find(id);
            if (serviceType == null)
            {
                return HttpNotFound();
            }
            return View(serviceType);
        }

        // GET: ServiceTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ServiceTypes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ServiceType1,Description")] ServiceType serviceType)
        {
            if (ModelState.IsValid)
            {
                Random random = new Random();
                serviceType.ServiceType1 = "T"+random.Next().ToString().Substring(0, 4);
                db.ServiceType.Add(serviceType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(serviceType);
        }

        // GET: ServiceTypes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServiceType serviceType = db.ServiceType.Find(id);
            if (serviceType == null)
            {
                return HttpNotFound();
            }
            return View(serviceType);
        }

        // POST: ServiceTypes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ServiceType1,Description")] ServiceType serviceType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(serviceType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(serviceType);
        }

        // GET: ServiceTypes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServiceType serviceType = db.ServiceType.Find(id);
            if (serviceType == null)
            {
                return HttpNotFound();
            }
            return View(serviceType);
        }

        // POST: ServiceTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            List<SpaService> listsvt = new List<SpaService>();
            List<Service> listsv = new List<Service>();
            foreach(SpaService sp in db.SpaService)
            {
                if(sp.Service.ServiceType1.ServiceType1 == id)
                {
                    listsvt.Add(sp);
                }
            }
            foreach (Service sv in db.Service)
            {
                if (sv.ServiceType == id)
                {
                    listsv.Add(sv);
                }
            }
            foreach(SpaService spasv in listsvt)
            {
                deleteSpaService(spasv);
            }
            foreach (Service sv in listsv)
            {
                deleteService(sv);
            }
            ServiceType serviceType = db.ServiceType.Find(id);
            db.ServiceType.Remove(serviceType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        private void deleteSpaService(SpaService ssv) 
        {
            db.SpaService.Remove(ssv);
            db.SaveChanges();
        }
        private void deleteService(Service sv)
        {
            db.Service.Remove(sv);
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
