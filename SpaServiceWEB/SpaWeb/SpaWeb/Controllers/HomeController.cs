using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SpaWeb.Models;

namespace SpaWeb.Controllers
{
    public class HomeController : Controller
    {
        private BeautySystemDBEntities db = new BeautySystemDBEntities();
        public ActionResult Index()
        {
            return View(db.Spa.ToList());
        }
        public int check(string id)
        {
            int check = 0;
            int count = db.SpaService.Where(s => s.SpaID == id).Count();
            if (count > 0)
            {
                check = 1;
            }
           return check;

        }
        public ActionResult Service(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SpaService spa = db.SpaService.Where(s=>s.SpaID==id).FirstOrDefault();
            ViewBag.idspa = id;
            if (spa == null)
            {
                return RedirectToAction("Index");
            }
            return View(db.SpaService);
        }

    }
}