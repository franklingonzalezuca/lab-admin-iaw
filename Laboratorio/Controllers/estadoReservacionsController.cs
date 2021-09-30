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
    public class estadoReservacionsController : Controller
    {
        private laboratorioEntities db = new laboratorioEntities();

        // GET: estadoReservacions
        public ActionResult Index()
        {
            return View(db.estadoReservacions.ToList());
        }

        // GET: estadoReservacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estadoReservacion estadoReservacion = db.estadoReservacions.Find(id);
            if (estadoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(estadoReservacion);
        }

        // GET: estadoReservacions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: estadoReservacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEstadoReservacion,nombreEstado,activo")] estadoReservacion estadoReservacion)
        {
            if (ModelState.IsValid)
            {
                db.estadoReservacions.Add(estadoReservacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(estadoReservacion);
        }

        // GET: estadoReservacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estadoReservacion estadoReservacion = db.estadoReservacions.Find(id);
            if (estadoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(estadoReservacion);
        }

        // POST: estadoReservacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEstadoReservacion,nombreEstado,activo")] estadoReservacion estadoReservacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(estadoReservacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(estadoReservacion);
        }

        // GET: estadoReservacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estadoReservacion estadoReservacion = db.estadoReservacions.Find(id);
            if (estadoReservacion == null)
            {
                return HttpNotFound();
            }
            return View(estadoReservacion);
        }

        // POST: estadoReservacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            estadoReservacion estadoReservacion = db.estadoReservacions.Find(id);
            db.estadoReservacions.Remove(estadoReservacion);
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
