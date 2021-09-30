using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Laboratorio.Models;

namespace Laboratorio.Controllers
{
    public class opcionsController : Controller
    {
        private laboratorioEntities db = new laboratorioEntities();

        // GET: opcions
        public ActionResult Index()
        {
            return View(db.opcions.ToList());
        }

        // GET: opcions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            opcion opcion = db.opcions.Find(id);
            if (opcion == null)
            {
                return HttpNotFound();
            }
            return View(opcion);
        }

        // GET: opcions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: opcions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idOpcion,nombreOpcion,descripcionOpcion,estadoOpcion")] opcion opcion)
        {
            if (ModelState.IsValid)
            {
                db.opcions.Add(opcion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(opcion);
        }

        // GET: opcions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            opcion opcion = db.opcions.Find(id);
            if (opcion == null)
            {
                return HttpNotFound();
            }
            return View(opcion);
        }

        // POST: opcions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idOpcion,nombreOpcion,descripcionOpcion,estadoOpcion")] opcion opcion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(opcion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(opcion);
        }

        // GET: opcions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            opcion opcion = db.opcions.Find(id);
            if (opcion == null)
            {
                return HttpNotFound();
            }
            return View(opcion);
        }

        // POST: opcions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            opcion opcion = db.opcions.Find(id);
            db.opcions.Remove(opcion);
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
