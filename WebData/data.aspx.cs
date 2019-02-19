using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Data;
using System.Text;

namespace WebData
{
    public partial class Data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            if (Session["mysession"] == null)
            {

                Response.Redirect("login.aspx");
            }


            if (IsPostBack)
            {
                string eventTarget = Page.Request.Params.Get("__EVENTTARGET");
                string eventParam = Page.Request.Params.Get("__EVENTARGUMENT");

                Helper help = new Helper();

                switch (eventTarget)
                {
                    case "newreg":


                        DataTable dt;
                        dt = help.getInfo();

                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow row in dt.Rows)
                            {

                                html.Append("<table class='table table-responsive table-striped table-condensed table-hover'>");
                                html.Append("<tr>" +
                                    "<td class='warning'><b>DN</b></td>" +
                                    "<td>" + row[1].ToString() + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td class='warning'><b>Nombre 1</b></td>" +
                                    "<td>" + row[3].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Nombre 2</b></td>" +
                                    "<td>" + row[4].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Apellido 1</b></td>" +
                                    "<td>" + row[5].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Apellido 2</b></td>" +
                                    "<td>" + row[6].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Referencia 1</b></td>" +
                                    "<td>" + row[7].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Referencia 2</b></td>" +
                                    "<td>" + row[8].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Fecha Venta</b></td>" +
                                    "<td>" + row[9].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning small'><b>FVC</b></td>" +
                                    "<td>" + row[2].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Tipificación</b></td>" +
                                    "<td >" +
                                    "<div class='col-lg-6'>" +
                                        "<div class='input-group'>" +
                                         "<!--<input type='text' class='form-control input-group-lg' placeholder='Ingrese Estatus...' id='savedata'  required autocomplete />-->" +
                                            "<select id='savedata' name='savedata' class='form-control'>" +
                                                "<option value='contacto'>Contacto</option>" +
                                                "<option value='no_contacto'>No Contacto</option>" +
                                            "</select>" +
                                         "<input type='hidden' id='rowid' value='" + row[0].ToString() + "' />" +
                                         "<span class='input-group-btn'>" +
                                                "<button class='btn btn-success input-group-lg' type='button' onclick=\"javascript:updatereg('" + row[0].ToString() + "')\" id='btnsaved' data-toggle='tooltip' data-placement='right' title='Guardar Datos'>" +
                                                    "<span class='glyphicon glyphicon-floppy-disk'></span>" +
                                                "</button>" +
                                            "</span>" +
                                        "</div>" +
                                    "</div>" +
                                    "</td>" +
                                "</tr>" +

                            "</table>");




                                //regtable.Controls.Add(new Literal { Text = html.ToString() });
                            }


                        }                        
                        break;
                    case "updatereg":

                        string[] values = eventParam.Split(new string[] { "^" }, StringSplitOptions.None);
                        int myid = Convert.ToInt32(values[0]);
                        string str = values[1];

                        help.updateReg(myid, str, (string) Session["mysession"]);

                        break;


                    case "recycle":

                        help.recycleReg();
                        
                        break;


                    case "findreg":

                        DataTable dt2;
                        dt2 = help.findReg(eventParam);

                        if (dt2.Rows.Count > 0)
                        {

                            foreach (DataRow row in dt2.Rows)
                            {

                                html.Append("<table class='table table-responsive table-striped table-condensed  table-hover'>");
                                html.Append("<tr>" +
                                    "<td class='warning'><b>DN</b></td>" +
                                    "<td>" + row[1].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning small'><b>FVC</b></td>" +
                                    "<td>" + row[2].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Nombre 1</b></td>" +
                                    "<td>" + row[3].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Nombre 2</b></td>" +
                                    "<td>" + row[4].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Apellido 1</b></td>" +
                                    "<td>" + row[5].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Apellido 2</b></td>" +
                                    "<td>" + row[6].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Referencia 1</b></td>" +
                                    "<td>" + row[7].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Referencia 2</b></td>" +
                                    "<td>" + row[8].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Fecha Nacimiento</b></td>" +
                                    "<td>" + row[9].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Sexo</b></td>" +
                                    "<td>" + row[10].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>NIP</b></td>" +
                                    "<td>" + row[11].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>CURP</b></td>" +
                                    "<td>" + row[12].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Tipificación</b></td>" +
                                     "<td>" + row[15].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Usuario</b></td>" +
                                    "<td>" + row[13].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Correo Electronico</b></td>" +
                                    "<td>" + row[14].ToString() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td class='warning'><b>Capturó</b></td>" +
                                    "<td>" + row[16].ToString() + "</td>" +
                                "</tr>" +
                            "</table>");
                            }

                        }
                        break;

                }
            }


        }
    }
}