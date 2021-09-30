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
    public class reservacionsController : Controller
    {
        private laboratorioEntities db = new laboratorioEntities();

        // GET: reservacions
        public ActionResult Index()
        {
            var reservacions = db.reservacions.Include(r => r.estadoReservacion).Include(r => r.estudiante).Include(r => r.horario).Include(r => r.laboratorio).Include(r => r.tipoReservacion).Include(r => r.usuario);
            return View(reservacions.ToList());
        }

        // GET: reservacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservacion reservacion = db.reservacions.Find(id);
            if (reservacion == null)
            {
                return HttpNotFound();
            }
            return View(reservacion);
        }

        // GET: reservacions/Create
        public ActionResult Create()
        {
            ViewBag.idEstadoReservacion = new SelectList(db.estadoReservacions, "idEstadoReservacion", "nombreEstado");
            ViewBag.idEstudiante = new SelectList(db.estudiantes, "idEstudiante", "nombreEstudiante");
            ViewBag.idHorario = new SelectList(db.horarios, "idHorario", "descripcion");
            ViewBag.idLaboratorio = new SelectList(db.laboratorios, "idLaboratorio", "nombreLaboratorio");
            ViewBag.idTipoReservacion = new SelectList(db.tipoReservacions, "idTipoReservacion", "nombreReservacion");
            ViewBag.idUsuario = new SelectList(db.usuarios, "idUsuario", "username");
            return View();
        }

        // POST: reservacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idReservacion,observacion,idLaboratorio,idUsuario,idEstudiante,horaEntrada,horaSalida,idTipoReservacion,idEstadoReservacion,idHorario,fechaReservacion")] reservacion reservacion)
        {
            if (ModelState.IsValid)
            {
                db.reservacions.Add(reservacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEstadoReservacion = new SelectList(db.estadoReservacions, "idEstadoReservacion", "nombreEstado", reservacion.idEstadoReservacion);
            ViewBag.idEstudiante = new SelectList(db.estudiantes, "idEstudiante", "nombreEstudiante", reservacion.idEstudiante);
            ViewBag.idHorario = new SelectList(db.horarios, "idHorario", "descripcion", reservacion.idHorario);
            ViewBag.idLaboratorio = new SelectList(db.laboratorios, "idLaboratorio", "nombreLaboratorio", reservacion.idLaboratorio);
            ViewBag.idTipoReservacion = new SelectList(db.tipoReservacions, "idTipoReservacion", "nombreReservacion", reservacion.idTipoReservacion);
            ViewBag.idUsuario = new SelectList(db.usuarios, "idUsuario", "username", reservacion.idUsuario);
            return View(reservacion);
        }

        // GET: reservacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservacion reservacion = db.reservacions.Find(id);
            if (reservacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEstadoReservacion = new SelectList(db.estadoReservacions, "idEstadoReservacion", "nombreEstado", reservacion.idEstadoReservacion);
            ViewBag.idEstudiante = new SelectList(db.estudiantes, "idEstudiante", "nombreEstudiante", reservacion.idEstudiante);
            ViewBag.idHorario = new SelectList(db.horarios, "idHorario", "descripcion", reservacion.idHorario);
            ViewBag.idLaboratorio = new SelectList(db.laboratorios, "idLaboratorio", "nombreLaboratorio", reservacion.idLaboratorio);
            ViewBag.idTipoReservacion = new SelectList(db.tipoReservacions, "idTipoReservacion", "nombreReservacion", reservacion.idTipoReservacion);
            ViewBag.idUsuario = new SelectList(db.usuarios, "idUsuario", "username", reservacion.idUsuario);
            return View(reservacion);
        }

        // POST: reservacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idReservacion,observacion,idLaboratorio,idUsuario,idEstudiante,horaEntrada,horaSalida,idTipoReservacion,idEstadoReservacion,idHorario,fechaReservacion")] reservacion reservacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEstadoReservacion = new SelectList(db.estadoReservacions, "idEstadoReservacion", "nombreEstado", reservacion.idEstadoReservacion);
            ViewBag.idEstudiante = new SelectList(db.estudiantes, "idEstudiante", "nombreEstudiante", reservacion.idEstudiante);
            ViewBag.idHorario = new SelectList(db.horarios, "idHorario", "descripcion", reservacion.idHorario);
            ViewBag.idLaboratorio = new SelectList(db.laboratorios, "idLaboratorio", "nombreLaboratorio", reservacion.idLaboratorio);
            ViewBag.idTipoReservacion = new SelectList(db.tipoReservacions, "idTipoReservacion", "nombreReservacion", reservacion.idTipoReservacion);
            ViewBag.idUsuario = new SelectList(db.usuarios, "idUsuario", "username", reservacion.idUsuario);
            return View(reservacion);
        }

        // GET: reservacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            reservacion reservacion = db.reservacions.Find(id);
            if (reservacion == null)
            {
                return HttpNotFound();
            }
            return View(reservacion);
        }

        // POST: reservacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            reservacion reservacion = db.reservacions.Find(id);
            db.reservacions.Remove(reservacion);
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
