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
    public partial class Data2 : System.Web.UI.Page
    {
        string statusDn = "Activacion";
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
            Activacion activacion = new Activacion();
            activacion.dn = Convert.ToDecimal(hdf_phone.Value.Replace(" ", ""));
            activacion.usuario = Session["mysession"].ToString();
            activacion.Fecha_Encuesta = DateTime.Now;
            activacion.preg_1 = hdf_q1.Value;
            switch (hdf_q1.Value)
            {
                case "Si":
                    activacion = clienteLocalizado(activacion);
                    break;
                case "No":
                    activacion.Estatus = hdf_reasonq1.Value;
                    activacion.Motivos_No_Aceptacion = hdf_reasonq1.Value;
                    break;
            }
            
            help.addActivacion(activacion);
            help.updateDn(statusDn, activacion.dn.ToString());
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
                activacionExistente.Value = data.Rows[0]["Estatus_Activacion"] != DBNull.Value ? (string)data.Rows[0]["Estatus_Activacion"] : "";
                if (status == "No Activacion")
                {
                    DateTime dateSell = (DateTime)data.Rows[0]["Fecha_Activacion"];
                    script = "document.getElementById('phone').value=''; document.getElementById('Divq1').style = 'display:none;'; " +
                        "document.getElementById('validForm').innerHTML = ' El DN " + hdf_phone.Value + " ya cuenta con un registro activado o rechazado, el día: " + dateSell.ToString() + "' ;";
                    ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
                }
                else if (status == "Activacion")
                {
                    newuser2.Visible = true;
                    IdDn.InnerHtml = "DN: " + hdf_phone.Value;
                    script = "document.getElementById('phone').value='" + hdf_phone.Value + "'; document.getElementById('Divq1').style = 'display:block;';" +
                        "document.getElementById('validForm').innerHTML = '';";
                    script += populateControls(data);
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

        private string populateControls(DataTable data)
        {
            lblFechaVenta.Text=Convert.ToDateTime(data.Rows[0]["Fecha_Venta"]).ToString("dd/MM/yyyy hh:mm:ss");
            lblName.Text = (string)data.Rows[0]["Nombre_Completo"];
            lblName2.Text = (string)data.Rows[0]["Nombre_Completo"];
            lblName3.Text = (string)data.Rows[0]["Nombre_Completo"];
            lblName4.Text = (string)data.Rows[0]["Nombre_Completo"];
            plan = (string)data.Rows[0]["plan_vendido"];
            switch (plan)
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
            lblPrecio2.Text = lblPrecio.Text;
            hdf_NombreCompleto.Value = (string)data.Rows[0]["Nombre_Completo"];
            hdf_fech_nac.Value = Convert.ToDateTime(data.Rows[0]["Fecha_Nacimiento"]).ToString("dd/MM/yyyy");
            hdf_txt_RFC.Value = (string)data.Rows[0]["RFC"];
            hdf_ddl_equipo.Value = (string)data.Rows[0]["Tipo_Celular"];
            hdf_ddl_Sexo.Value = (string)data.Rows[0]["Sexo"];
            hdf_txt_Calle.Value = (string)data.Rows[0]["Calle"];
            hdf_txt_Num_Externo.Value = (string)data.Rows[0]["Num_Externo"];
            hdf_txt_Num_Interno.Value = (string)data.Rows[0]["Num_Interno"];
            hdf_txt_CP.Value = (string)data.Rows[0]["CP"];
            hdf_txt_Ciudad.Value = (string)data.Rows[0]["Ciudad"];
            hdf_txt_Estado.Value = (string)data.Rows[0]["Localidad_Nacimiento"];
            hdf_txt_Colonia.Value = (string)data.Rows[0]["Colonia"];
            hdf_txt_Municipio.Value = (string)data.Rows[0]["Municipio"];
            hdf_txt_Tel_Fijo.Value = (string)data.Rows[0]["TelefonoFijo"];
            hdf_txt_Tel_Movil.Value = (string)data.Rows[0]["TelefonoMovil"];
            hdf_txt_Mail.Value = (string)data.Rows[0]["Correo_Elctronico"];
            string script = " document.getElementById('NombreCompleto').value='" + hdf_NombreCompleto.Value +
                "';\n\r document.getElementById('ddl_dia_2').value='" + hdf_fech_nac.Value.Substring(0, 2) +
                "';\n\r document.getElementById('ddl_mes_2').value='" + hdf_fech_nac.Value.Substring(3, 2) +
                "';\n\r document.getElementById('ddl_ano_2').value='" + hdf_fech_nac.Value.Substring(6, 4) +
                "';\n\r document.getElementById('txt_RFC').value='" + hdf_txt_RFC.Value +
                "';\n\r document.getElementById('ddl_equipo').value='" + hdf_ddl_equipo.Value +
                "';\n\r document.getElementById('ddl_Sexo').value='" + hdf_ddl_Sexo.Value +
                "';\n\r document.getElementById('txt_Calle').value='" + hdf_txt_Calle.Value +
                "';\n\r document.getElementById('txt_Num_Externo').value='" + hdf_txt_Num_Externo.Value +
                "';\n\r document.getElementById('txt_Num_Interno').value='" + hdf_txt_Num_Interno.Value +
                "';\n\r document.getElementById('txt_CP').value='" + hdf_txt_CP.Value +
                "';\n\r document.getElementById('txt_Ciudad').value='" + hdf_txt_Ciudad.Value +
                "';\n\r document.getElementById('txt_Estado').value='" + hdf_txt_Estado.Value +
                "';\n\r document.getElementById('txt_Colonia').value='" + hdf_txt_Colonia.Value +
                "';\n\r document.getElementById('txt_Municipio').value='" + hdf_txt_Municipio.Value +
                "';\n\r document.getElementById('txt_Tel_Fijo').value='" + hdf_txt_Tel_Fijo.Value +
                "';\n\r document.getElementById('txt_Tel_Movil').value='" + hdf_txt_Tel_Movil.Value +
                "';\n\r document.getElementById('txt_Mail').value='" + hdf_txt_Mail.Value + "';";
            return script;
        }

        private Activacion clienteLocalizado(Activacion activacion)
        {
            activacion.cod_plan_mig = plan;
            activacion.preg_3 = hdf_approvePlan.Value;
            switch (hdf_approvePlan.Value)
            {
                case "Si":
                    activacion = clienteApruebaPlan(activacion);
                    break;
                case "No":
                    activacion.Estatus = hdf_approvePlanSelect.Value;
                    statusDn = "No Activacion";
                    activacion.Motivos_No_Aceptacion = hdf_approvePlanSelect.Value;
                    break;
                case "Llamar despues":
                    activacion.Estatus = hdf_approvePlan.Value;
                    activacion.preg_3_Dia = hdf_preg_2_Dia.Value;
                    activacion.preg_3_Hora = hdf_preg_2_hora.Value;
                    activacion.Motivos_No_Aceptacion = hdf_approvePlan.Value;
                    break;
            }
            return activacion;
        }

        private Activacion clienteApruebaPlan(Activacion activacion)
        {
            activacion.Nombre_Completo = hdf_NombreCompleto.Value;
            activacion.Fecha_Nacimiento = Convert.ToDateTime(hdf_fech_nac.Value);
            activacion.Sexo = hdf_ddl_Sexo.Value;
            activacion.Calle = hdf_txt_Calle.Value;
            activacion.Colonia = hdf_txt_Colonia.Value;
            activacion.Num_Externo = hdf_txt_Num_Externo.Value;
            activacion.Num_Interno = hdf_txt_Num_Interno.Value;
            activacion.CP = hdf_txt_CP.Value;
            activacion.Ciudad = hdf_txt_Ciudad.Value;
            activacion.Correo_Elctronico = hdf_txt_Mail.Value;
            activacion.RFC = hdf_txt_RFC.Value;
            activacion.Equipo = hdf_ddl_equipo.Value;
            activacion.Municipio = hdf_txt_Municipio.Value;
            activacion.TelefonoFijo = hdf_txt_Tel_Fijo.Value;
            activacion.TelefonoMovil = hdf_txt_Tel_Movil.Value;
            activacion.Se_realizaron_cambios = hdf_cambio.Value;
            activacion.preg_5 = activacion.Se_realizaron_cambios != "" ? "Si" : "No";
            switch (hdf_customerType.Value)
            {
                case "Moroso":
                    activacion.preg_6 = hdf_customerType.Value;
                    activacion.Estatus = "Cliente Moroso";
                    //statusDn = "No Activacion";
                    activacion.Motivos_No_Aceptacion = activacion.Estatus;
                    break;
                case "Vetado":
                    activacion.preg_6 = hdf_customerType.Value;
                    activacion.Estatus = "Cliente Vetado";
                    statusDn = "No Activacion";
                    activacion.Motivos_No_Aceptacion = activacion.Estatus;
                    break;
                case "Cliente cumple requisitos":
                    activacion.preg_6 = hdf_customerType.Value;
                    activacion.preg_7 = hdf_tipoActivacion.Value;
                    activacion.Estatus = hdf_estadoMigration.Value;
                    statusDn = "Primera Factura";
                    break;
            }
            
            return activacion;
        }
    }
}