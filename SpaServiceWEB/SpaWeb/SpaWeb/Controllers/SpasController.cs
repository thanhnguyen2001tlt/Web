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
    public class SpasController : Controller
    {
        private BeautySystemDBEntities db = new BeautySystemDBEntities();

        // GET: Spas
        public ActionResult Index()
        {
            return View(db.Spa.ToList());
        }

        // GET: Spas/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Spa spa = db.Spa.Find(id);
            if (spa == null)
            {
                return HttpNotFound();
            }
            return View(spa);
        }

        // GET: Spas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Spas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SpaID,SpaName,Phone,Address,Email,Website,Zalo,Facebook,Description,Logo,Image")] Spa spa)
        {
            string _FileName = "";
            string _path = "";
            if (ModelState.IsValid)
            {
                Random random = new Random();
                spa.SpaID = random.Next().ToString().Substring(0,5);
                HttpPostedFileBase image = Request.Files["image"];    
                if (image.FileName != "")
                {
                    string name = image.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = "Spa"+spa.SpaID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    spa.Image = _FileName;
                }
                else
                {
                    spa.Image = "defaultimg.png";
                }
                HttpPostedFileBase logo = Request.Files["Logo"];
                if (logo.FileName != "")
                {
                    string name = logo.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = "logo"+spa.SpaID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    logo.SaveAs(_path);
                    spa.Logo = _FileName;
                }
                else
                {
                    spa.Logo = "defaultimg.png";
                }
                db.Spa.Add(spa);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(spa);
        }

        // GET: Spas/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Spa spa = db.Spa.Find(id);
            if (spa == null)
            {
                return HttpNotFound();
            }
            return View(spa);
        }

        // POST: Spas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SpaID,SpaName,Phone,Address,Email,Website,Zalo,Facebook,Description,Logo,Image")] Spa spa)
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
                    _FileName = "Spa" + spa.SpaID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    image.SaveAs(_path);
                    spa.Image = _FileName;
                }
               
                HttpPostedFileBase logo = Request.Files["Logo"];
                if (logo.FileName != "")
                {
                    string name = logo.FileName;
                    string tail = name.Substring(name.IndexOf("."));
                    _FileName = "logo"+ spa.SpaID + tail;
                    _path = Path.Combine(Server.MapPath("~/ImageSpa"), _FileName);
                    logo.SaveAs(_path);
                    spa.Logo = _FileName;
                }
                db.Entry(spa).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(spa);
        }

        // GET: Spas/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Spa spa = db.Spa.Find(id);
            if (spa == null)
            {
                return HttpNotFound();
            }
            return View(spa);
        }

        // POST: Spas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            List<SpaService> listsvt = new List<SpaService>();
            foreach (SpaService sp in db.SpaService)
            {
                if (sp.SpaID == id)
                {
                    listsvt.Add(sp);
                }
            }
            foreach (SpaService spasv in listsvt)
            {
                deleteSpaService(spasv);
            }
            Spa spa = db.Spa.Find(id);
            db.Spa.Remove(spa);
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
