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
    public class tipoReservacionsController : Controller
    {
        private laboratorioEntities db = new laboratorioEntities();

        // GET: tipoReservacions
        public ActionResult Index()
        {
            return View(db.tipoReservacions.ToList());
        }

        // GET: tipoReservacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoReservacion tipoReservacion = db.tipoReservacions.Find(id);
            if (tipoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(tipoReservacion);
        }

        // GET: tipoReservacions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tipoReservacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoReservacion,nombreReservacion,descripcion,activo")] tipoReservacion tipoReservacion)
        {
            if (ModelState.IsValid)
            {
                db.tipoReservacions.Add(tipoReservacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tipoReservacion);
        }

        // GET: tipoReservacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoReservacion tipoReservacion = db.tipoReservacions.Find(id);
            if (tipoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(tipoReservacion);
        }

        // POST: tipoReservacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoReservacion,nombreReservacion,descripcion,activo")] tipoReservacion tipoReservacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoReservacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipoReservacion);
        }

        // GET: tipoReservacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoReservacion tipoReservacion = db.tipoReservacions.Find(id);
            if (tipoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(tipoReservacion);
        }

        // POST: tipoReservacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tipoReservacion tipoReservacion = db.tipoReservacions.Find(id);
            db.tipoReservacions.Remove(tipoReservacion);
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
