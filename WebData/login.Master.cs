using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebData
{
    public partial class login : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl menu = (System.Web.UI.HtmlControls.HtmlGenericControl)this.FindControl("menu"); ;
            menu.Visible = false;

            if (Session["mysession"] != null)
            {                
                menu.Visible = true;
                switch (Session["mytype"].ToString())
                {
                    case "Venta":
                        lidata.Attributes["style"] = "display:none;";
                        lidata1.Attributes["style"] = "display:block;";
                        lidata2.Attributes["style"] = "display:none;";
                        lihistory.Attributes["style"] = "display:none;";
                        lihistory2.Attributes["style"] = "display:none;";
                        liupload.Attributes["style"] = "display:none;";
                        liaddusr.Attributes["style"] = "display:none;";
                        lihistoryFiles.Attributes["style"] = "display:none;";
                        lidata3.Attributes["style"] = "display:none;";
                        lihistory3.Attributes["style"] = "display:none;";
                        lidata4.Attributes["style"] = "display:none;";
                        lihistory4.Attributes["style"] = "display:none;";
                        break;
                    case "Activacion":
                        lidata.Attributes["style"] = "display:none;";
                        lidata1.Attributes["style"] = "display:none;";
                        lidata2.Attributes["style"] = "display:block;";
                        lihistory.Attributes["style"] = "display:none;";
                        lihistory2.Attributes["style"] = "display:none;";
                        liupload.Attributes["style"] = "display:none;";
                        liaddusr.Attributes["style"] = "display:none;";
                        lihistoryFiles.Attributes["style"] = "display:none;";
                        lidata3.Attributes["style"] = "display:none;";
                        lihistory3.Attributes["style"] = "display:none;";
                        lidata4.Attributes["style"] = "display:none;";
                        lihistory4.Attributes["style"] = "display:none;";
                        break;
                    case "BackOffice":
                        lidata.Attributes["style"] = "display:none;";
                        lidata1.Attributes["style"] = "display:none;";
                        lidata2.Attributes["style"] = "display:none;";
                        lidata3.Attributes["style"] = "display:block;";
                        lihistory.Attributes["style"] = "display:none;";
                        lihistory2.Attributes["style"] = "display:none;";
                        liupload.Attributes["style"] = "display:none;";
                        liaddusr.Attributes["style"] = "display:none;";
                        lihistoryFiles.Attributes["style"] = "display:none;";
                        lihistory3.Attributes["style"] = "display:none;";
                        lidata4.Attributes["style"] = "display:none;";
                        lihistory4.Attributes["style"] = "display:none;";
                        break;
                    case "Cobranza":
                        lidata.Attributes["style"] = "display:none;";
                        lidata1.Attributes["style"] = "display:none;";
                        lidata2.Attributes["style"] = "display:none;";
                        lihistory.Attributes["style"] = "display:none;";
                        lihistory2.Attributes["style"] = "display:none;";
                        liupload.Attributes["style"] = "display:none;";
                        liaddusr.Attributes["style"] = "display:none;";
                        lihistoryFiles.Attributes["style"] = "display:none;";
                        lidata3.Attributes["style"] = "display:none;";
                        lihistory3.Attributes["style"] = "display:none;";
                        lidata4.Attributes["style"] = "display:block;";
                        lihistory4.Attributes["style"] = "display:none;";
                        break;
                    case "admin":
                        lidata.Attributes["style"] = "display:block;";
                        lidata1.Attributes["style"] = "display:block;";
                        lidata2.Attributes["style"] = "display:block;";
                        lihistory.Attributes["style"] = "display:block;";
                        lihistory2.Attributes["style"] = "display:block;";
                        lihistory3.Attributes["style"] = "display:block;";
                        liupload.Attributes["style"] = "display:block;";
                        liaddusr.Attributes["style"] = "display:block;";
                        lihistoryFiles.Attributes["style"] = "display:block;";
                        lidata3.Attributes["style"] = "display:block;";
                        lidata4.Attributes["style"] = "display:block;";
                        lihistory4.Attributes["style"] = "display:block;";
                        break;
                }
                switch (Request.FilePath.Replace("/", ""))
                {
                    case "data.aspx":
                        lidata.Attributes["class"] = "active";
                        break;
                    case "data1.aspx":
                        lidata1.Attributes["class"] = "active";
                        break;
                    case "data2.aspx":
                        lidata2.Attributes["class"] = "active";
                        break;
                    case "data3.aspx":
                        lidata3.Attributes["class"] = "active";
                        break;
                    case "data4.aspx":
                        lidata4.Attributes["class"] = "active";
                        break;
                    case "history.aspx":
                        lihistory.Attributes["class"] = "active";
                        break;
                    case "history2.aspx":
                        lihistory2.Attributes["class"] = "active";
                        break;
                    case "history3.aspx":
                        lihistory3.Attributes["class"] = "active";
                        break;
                    case "history4.aspx":
                        lihistory4.Attributes["class"] = "active";
                        break;
                    case "upload.aspx":
                        liupload.Attributes["class"] = "active";
                        break;
                    case "historyFiles.aspx":
                        lihistoryFiles.Attributes["class"] = "active";
                        break;
                    case "addusr.aspx":
                        liaddusr.Attributes["class"] = "active";
                        break;
                    default:
                        break;
                }
            }
        }                      
    }
}