using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Reflection;
using System.Data;

namespace WebData
{
    public partial class Data1 : System.Web.UI.Page
    {
        string statusDn = "Venta";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mysession"] == null)
            {

                Response.Redirect("login.aspx");
            }
            IdEjecutivo.InnerHtml = "ID EJECUTIVO: " +Session["mysession"].ToString();
        }
        
        protected void submitRecord(object sender, EventArgs e)
        {
            Helper help = new Helper();
            Venta venta = new Venta();            
            venta.dn = Convert.ToDecimal(hdf_phone.Value.Replace(" ",""));
            venta.Usuario_Vent = Session["mysession"].ToString();
            venta.Fecha_Venta = DateTime.Now;
            venta.preg_1 = hdf_q1.Value;
            switch (hdf_q1.Value)
            {
                case "Si":
                    venta = clienteLocalizado(venta);
                    break;
                case "No":
                    venta.Estatus_Venta = hdf_reasonq1.Value;
                    break;
                case "Llamar despues":
                    venta.Estatus_Venta = hdf_q1.Value;
                    venta.preg_1_Dia = hdf_preg_1_Dia.Value;
                    venta.preg_1_Hora = hdf_preg_1_Hora.Value;
                break;
            }
            
            help.addVenta(venta);
            help.updateDn(statusDn, venta.dn.ToString());
        }

        protected void searchDNServer(object sender, EventArgs e)
        {
            Helper help = new Helper();
            DataTable data = help.isValidDn(hdf_phone.Value);
            lblDn.Text = hdf_phone.Value;
            var script = "";
            if (data.Rows.Count > 0)
            {
                //Se elimina vigencia
                //DateTime dateIni = (DateTime)data.Rows[0]["dateIni"];
                //DateTime dateFin = (DateTime)data.Rows[0]["dateFin"];
                //if (DateTime.Now >= dateIni && DateTime.Now <= dateFin)
                //{
                String status = (string)data.Rows[0]["status"];
                ventaExistente.Value = data.Rows[0]["Estatus_Venta"] != DBNull.Value ? (string)data.Rows[0]["Estatus_Venta"] : "";
                if (status == "No Venta" && ((DateTime)data.Rows[0]["Fecha_Venta"] >= DateTime.Now.AddMonths(-6)) && data.Rows[0]["Estatus_Venta"].ToString()!="Moroso")
                {
                    DateTime dateSell = (DateTime)data.Rows[0]["Fecha_Venta"];
                    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                        "document.getElementById('validForm').innerHTML = ' El DN " + hdf_phone.Value + " ya cuenta con un registro aceptado o rechazado, el día: " + dateSell.ToString() + "' ;";
                    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                }
                else if ((status == "Venta" || data.Rows[0]["Estatus_Venta"].ToString() == "Moroso") || (status == "Activacion" && ((DateTime)data.Rows[0]["Fecha_Venta"] <= DateTime.Now.AddMonths(-6))) || (status == "No Venta" && ((DateTime)data.Rows[0]["Fecha_Venta"] <= DateTime.Now.AddMonths(-6))))
                {
                    newuser2.Visible = true;
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
                //ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                //}
            }
            else
            {
                script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                        "document.getElementById('validForm').innerHTML = 'DN invalido';";
                ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
            }
        }

        private Venta clienteLocalizado(Venta venta)
        {
            venta.preg_3 = hdf_myaddname.Value;
            if (hdf_q3.Value=="Si")
            {
                venta.Tipo_Celular = hdf_qDevice.Value;
                venta.plan_vendido = hdf_planSelect.Value;
                venta.plan_carga = venta.plan_vendido;
                venta.preg_6 = hdf_approvePlan.Value;
                switch (hdf_approvePlan.Value)
                {
                    case "Si":
                        venta = clienteApruebaPlan(venta);
                        break;
                    case "No":
                        venta.Estatus_Venta = hdf_approvePlanSelect.Value;
                        venta.Motivos_No_Aceptacion = hdf_ddl_Motivos.Value;
                        venta.SubMotivos = hdf_ddl_SubMotivos.Value;
                        statusDn = "No Venta";
                        break;
                    case "Llamar despues":
                        venta.Estatus_Venta = hdf_approvePlan.Value;
                        venta.preg_1_Dia = hdf_preg_2_Dia.Value;
                        venta.preg_1_Hora = hdf_preg_2_hora.Value;
                        break;
                }
            }
            else
            {
                venta.EdadCliente =Convert.ToInt32(hdf_age.Value);
                venta.Estatus_Venta = "No cumple edad";
                statusDn = "No Venta";
            }
            return venta;
        }

        private Venta clienteApruebaPlan(Venta venta)
        {
            venta.preg_7 = hdf_approvePlan2.Value;
            switch (hdf_approvePlan2.Value)
            {
                case "Si":
                    venta.Nombre_Completo = hdf_Ap_Paterno.Value + " " + hdf_Ap_Materno.Value + " " + hdf_txt_Nombre_Completo.Value;
                    venta.Fecha_Nacimiento = Convert.ToDateTime(hdf_fech_nac.Value);
                    venta.Sexo = hdf_ddl_Sexo.Value;
                    venta.Calle = hdf_txt_Calle.Value;
                    venta.Colonia = hdf_txt_Colonia.Value;
                    venta.Num_Externo = hdf_txt_Num_Externo.Value;
                    venta.Num_Interno = hdf_txt_Num_Interno.Value;
                    venta.CP = hdf_txt_CP.Value;
                    venta.Ciudad = hdf_txt_Ciudad.Value;
                    venta.Correo_Elctronico = hdf_txt_Mail.Value;
                    venta.preg_4 = "";
                    venta.preg_5 = venta.Fecha_Nacimiento.ToString("dd/MM/yyyy");
                    venta.RFC = hdf_txt_RFC.Value;
                    venta.realizar_consulta_scoring = hdf_approveScoring.Value;
                    venta.EdadCliente = Convert.ToInt32(hdf_age.Value);
                    venta.Localidad_Nacimiento = hdf_txt_Estado.Value;
                    venta.Municipio = hdf_txt_Municipio.Value;
                    venta.TelefonoFijo = hdf_txt_Tel_Fijo.Value;
                    venta.TelefonoMovil = hdf_txt_Tel_Movil.Value;
                    if (venta.realizar_consulta_scoring == "Acepta consulta scoring")
                    {
                        venta.preg_8 = hdf_customerType.Value;
                        if(venta.preg_8=="Datos correctos")
                        {
                            venta.Estatus_Venta = "Acepta migración";
                            venta.DeseaHorarioEspecifico = hdf_callTime.Value;
                            venta.DiaClienteDeseaLlamada = hdf_preg_3_Dia.Value;
                            venta.HoraClienteDeseaLlamada = hdf_preg_3_Hora.Value;
                            statusDn = "Activacion";
                        }
                        else
                        {
                            venta.Estatus_Venta = venta.preg_8;
                            statusDn = "No Venta";
                        }
                    }
                    else
                    {
                        venta.Estatus_Venta = venta.realizar_consulta_scoring;
                        statusDn = "No Venta";
                    }                    
                    break;
                case "No":
                    venta.Estatus_Venta = hdf_approvePlanSelect.Value;
                    venta.Motivos_No_Aceptacion = hdf_ddl_Motivos.Value;
                    venta.SubMotivos = hdf_ddl_SubMotivos.Value;
                    statusDn = "No Venta";
                    break;
                case "Llamar despues":
                    venta.Estatus_Venta = hdf_approvePlan2.Value;
                    venta.preg_1_Dia = hdf_preg_2_Dia.Value;
                    venta.preg_1_Hora = hdf_preg_2_hora.Value;
                    break;
            }
            return venta;
        }
    }
}