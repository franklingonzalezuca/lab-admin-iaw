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
    public class estudiantesController : Controller
    {
        private laboratorioEntities db = new laboratorioEntities();

        // GET: estudiantes
        public ActionResult Index()
        {
            var estudiantes = db.estudiantes.Include(e => e.carrera).Include(e => e.genero);
            return View(estudiantes.ToList());
        }

        // GET: estudiantes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estudiante estudiante = db.estudiantes.Find(id);
            if (estudiante == null)
            {
                return HttpNotFound();
            }
            return View(estudiante);
        }

        // GET: estudiantes/Create
        public ActionResult Create()
        {
            ViewBag.idCarrera = new SelectList(db.carreras, "idCarrera", "descripcion");
            ViewBag.idGenero = new SelectList(db.generoes, "idGenero", "descripcion");
            return View();
        }

        // POST: estudiantes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEstudiante,nombreEstudiante,apellidoEstudiante,idGenero,idCarrera,añoCurso,email")] estudiante estudiante)
        {
            if (ModelState.IsValid)
            {
                db.estudiantes.Add(estudiante);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCarrera = new SelectList(db.carreras, "idCarrera", "descripcion", estudiante.idCarrera);
            ViewBag.idGenero = new SelectList(db.generoes, "idGenero", "descripcion", estudiante.idGenero);
            return View(estudiante);
        }

        // GET: estudiantes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estudiante estudiante = db.estudiantes.Find(id);
            if (estudiante == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCarrera = new SelectList(db.carreras, "idCarrera", "descripcion", estudiante.idCarrera);
            ViewBag.idGenero = new SelectList(db.generoes, "idGenero", "descripcion", estudiante.idGenero);
            return View(estudiante);
        }

        // POST: estudiantes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEstudiante,nombreEstudiante,apellidoEstudiante,idGenero,idCarrera,añoCurso,email")] estudiante estudiante)
        {
            if (ModelState.IsValid)
            {
                db.Entry(estudiante).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCarrera = new SelectList(db.carreras, "idCarrera", "descripcion", estudiante.idCarrera);
            ViewBag.idGenero = new SelectList(db.generoes, "idGenero", "descripcion", estudiante.idGenero);
            return View(estudiante);
        }

        // GET: estudiantes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            estudiante estudiante = db.estudiantes.Find(id);
            if (estudiante == null)
            {
                return HttpNotFound();
            }
            return View(estudiante);
        }

        // POST: estudiantes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            estudiante estudiante = db.estudiantes.Find(id);
            db.estudiantes.Remove(estudiante);
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
