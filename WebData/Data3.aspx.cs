using Business;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebData
{
    public partial class Data3 : System.Web.UI.Page
    {
        string statusDn = "Primera Factura";
        string plan = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mysession"] == null)
            {

                Response.Redirect("login.aspx");
            }
            IdEjecutivo.InnerHtml = "ID EJECUTIVO: " + Session["mysession"].ToString();
        }

        protected void submitRecord(object sender, EventArgs e)
        {
            Helper help = new Helper();
            PrimerFactura primerFactura = new PrimerFactura();
            primerFactura.dn = Convert.ToDecimal(hdf_phone.Value.Replace(" ", ""));
            primerFactura.usuario = Session["mysession"].ToString();
            primerFactura.Fecha_Encuesta = DateTime.Now;
            primerFactura.preg_1 = hdf_q1.Value;
            switch (hdf_q1.Value)
            {
                case "Si":
                    primerFactura = clienteLocalizado(primerFactura);
                    break;
                case "No":
                    primerFactura.Estatus = hdf_reasonq1.Value;
                    break;
            }
            
            help.addPrimerFactura(primerFactura);
            help.updateDn(statusDn, primerFactura.dn.ToString());
        }

        protected void searchDNServer(object sender, EventArgs e)
        {
            Helper help = new Helper();
            DataTable data = help.isValidDn(hdf_phone.Value);
            var script = "";
            if (data.Rows.Count > 0)
            {
                //DateTime dateIni = (DateTime)data.Rows[0]["dateIni"];
                //DateTime dateFin = (DateTime)data.Rows[0]["dateFin"];
                //if (DateTime.Now >= dateIni && DateTime.Now <= dateFin)
                //{
                String status = (string)data.Rows[0]["status"];
                primerFacturaExistente.Value = data.Rows[0]["Estatus_PrimerFactura"] != DBNull.Value ? (string)data.Rows[0]["Estatus_PrimerFactura"] : "";
                if (status == "No Primera Factura")
                {
                    DateTime dateSell = (DateTime)data.Rows[0]["Fecha_PrimerFactura"];
                    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                        "document.getElementById('validForm').innerHTML = ' El DN " + hdf_phone.Value + " ya cuenta con un registro activado o rechazado, el día: " + dateSell.ToString() + "' ;";
                    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                }
                else if (status == "Primera Factura" || data.Rows[0]["Estatus_PrimerFactura"].ToString()== "Encuesta Efectiva")
                {
                    newuser2.Visible = true;
                    hdf_plan.Value = (string)data.Rows[0]["plan_vendido"];
                    switch (hdf_plan.Value)
                    {
                        case "KE":
                            lblPlan.Text = "Plan Movistar 3";
                            lblPrecio.Text = "219";
                            break;
                        case "KEM":
                            lblPlan.Text = "Vas a Volar 0.3 Canal";
                            lblPrecio.Text = "149";
                            break;
                        case "KEL":
                            lblPlan.Text = "Vas a Volar 0.5 Canal";
                            lblPrecio.Text = "219";
                            break;
                        case "KEF":
                            lblPlan.Text = "Vas a Volar 1 Canal";
                            lblPrecio.Text = "349";
                            break;
                        case "KEG":
                            lblPlan.Text = "Vas a Volar 1.5 Canal";
                            lblPrecio.Text = "449";
                            break;
                    }
                    IdDn.InnerHtml = "DN: " + hdf_phone.Value;
                    script = "document.getElementById('phone').value='" + hdf_phone.Value + "'; document.getElementById('Divq1').style = 'display:block;';" +
                        "document.getElementById('validForm').innerHTML = '';";
                    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                }
                else
                {
                    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                            "document.getElementById('validForm').innerHTML = 'DN invalido';";
                    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                }
                //}
                //else
                //{
                //    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                //        "document.getElementById('validForm').innerHTML = 'DN expirado';";
                //    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                //}
            }
            else
            {
                script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                        "document.getElementById('validForm').innerHTML = 'DN invalido';";
                ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
            }
        }

        private PrimerFactura clienteLocalizado(PrimerFactura primerFactura)
        {
            primerFactura.preg_2 = hdf_myaddname.Value;
            primerFactura.preg_4 = hdf_approvePlan.Value;
            primerFactura.cod_plan_mig = hdf_plan.Value;
            switch (hdf_approvePlan.Value)
            {
                case "Si":
                    primerFactura = clienteApruebaPlan(primerFactura);                    
                    break;
                case "No":
                    primerFactura.Estatus = hdf_approvePlanSelect.Value;
                    statusDn = "No Primera Factura";
                    break;
                case "No Titular":
                    primerFactura.preg_5 = hdf_titularApprove.Value;
                    switch(hdf_titularApprove.Value)
                    {
                        case "Si":
                            primerFactura = clienteApruebaPlan(primerFactura);
                            statusDn = "No Primera Factura";
                            break;
                        case "No":
                            primerFactura.Estatus = hdf_noTitularSelect.Value;
                            statusDn = "No Primera Factura";
                            break;
                    }
                    break;
                case "Llamar despues":
                    primerFactura.Estatus = hdf_approvePlan.Value;
                    primerFactura.Preg_4_Dia = hdf_preg_2_Dia.Value;
                    primerFactura.Preg_4_Hora = hdf_preg_2_hora.Value;
                    break;
            }
            return primerFactura;
        }

        private PrimerFactura clienteApruebaPlan(PrimerFactura primerFactura)
        {
            primerFactura.preg_6 = hdf_approveSms.Value;
            primerFactura.preg_7 = hdf_direccionApprove.Value;
            primerFactura.preg_8 = hdf_electronicoApprove.Value;
            primerFactura.preg_9 = hdf_emailApprove.Value;
            primerFactura.preg_10 = hdf_myemail.Value;
            primerFactura.preg_11 = hdf_dudaApprove.Value;
            primerFactura.Estatus = hdf_acceptMigration.Value;
            primerFactura.LugarPagoRecurrente = hdf_ddlLugarPagoRecurrente.Value;
            primerFactura.OtroLugarPago = hdf_myPago.Value;
            primerFactura.EnvioReferenciaBancaria = hdf_referenciaApprove.Value;
            primerFactura.DomiciliaTDC = hdf_domiciliarApprove.Value;
            statusDn = "Cobranza";
            return primerFactura;
        }
    }
}