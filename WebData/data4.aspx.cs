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
    public partial class Data4 : System.Web.UI.Page
    {
        string statusDn = "Cobranza";
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
            Cobranza cobranza = new Cobranza();
            cobranza.dn = Convert.ToDecimal(hdf_phone.Value.Replace(" ", ""));
            cobranza.Usuario_Cobranza = Session["mysession"].ToString();
            cobranza.Fecha_Cobranza = DateTime.Now;
            switch (hdf_q1.Value)
            {
                case "Si":
                    cobranza = clienteLocalizado(cobranza);
                    break;
                case "No":
                    cobranza.Estatus_Cobranza = hdf_reasonq1.Value;                    
                    break;
            }
            
            help.addCobranza(cobranza);
            help.updateDn(statusDn, cobranza.dn.ToString());
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
                    cobranzaExistente.Value = data.Rows[0]["Estatus_Cobranza"] != DBNull.Value ? (string)data.Rows[0]["Estatus_Cobranza"] : "";
                    //if (status == "No Cobranza")
                    //{
                    //    DateTime dateSell = (DateTime)data.Rows[0]["Fecha_Cobranza"];
                    //    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                    //        "document.getElementById('validForm').innerHTML = ' El DN " + hdf_phone.Value + " ya cuenta con un registro activado o rechazado, el día: " + dateSell.ToString() + "' ;";
                    //    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                    //}
                    if (status == "Cobranza" || status == "Primera Factura" || status == "No Cobranza")
                    {
                        newuser2.Visible = true;
                        switch ((string)data.Rows[0]["plan_vendido"])
                        {
                            case "KE":
                                lblPlan.Text = "Plan Movistar 3";
                                break;
                            case "KEM":
                                lblPlan.Text = "Vas a Volar 0.3 Canal";
                                break;
                            case "KEL":
                                lblPlan.Text = "Vas a Volar 0.5 Canal";
                                break;
                            case "KEF":
                                lblPlan.Text = "Vas a Volar 1 Canal";
                                break;
                            case "KEG":
                                lblPlan.Text = "Vas a Volar 1.5 Canal";
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

        private Cobranza clienteLocalizado(Cobranza cobranza)
        {
            cobranza.confirmaPago=hdf_confirmaPago.Value;
            if (cobranza.confirmaPago == "No")
            {
                cobranza.reflejadoFE = "";
                cobranza.pasado24hrs = "";
                cobranza.comprobante = "";
                cobranza.motivoAdeudo = hdf_ddlMotivoAdeudo.Value;
                cobranza.tieneDuda = hdf_approveDuda.Value;
            }
            else
            {
                cobranza.reflejadoFE = hdf_approvePago.Value;
                cobranza.pasado24hrs = hdf_approveReflejo.Value;
                cobranza.comprobante = hdf_comprobanteApprove.Value;                
            }
            cobranza.Estatus_Cobranza = hdf_acceptMigration.Value;
            statusDn = "No Cobranza";
            return cobranza;
        }
    }
}