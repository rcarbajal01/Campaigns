<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeFile="Data3.aspx.cs" Inherits="WebData.Data3" %>
<asp:Content ID="Content3" ContentPlaceHolderID="search" runat="server">
    <!--
        Here we add the Search and the menus to the Navbar
        -->

    <!-- User Menu upon Login -->
    <ul class="nav navbar-nav navbar-right">
        <li><a id="IdEjecutivo" runat="server" href="#"></a></li>
        <li><a id="IdDn" runat="server" href="#"></a></li>
        <li><a href="login.aspx">Salir</a></li>
        <li><a href="#">Ayuda</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!--
        This is the main content of the Data User Page
        -->
    <form runat="server" id="formMain">
    <!-- Golbal Container -->
    <div class="container-fluid">

        <!-- We format the page to use rows -->
        <div class="row">
            <!-- The data Page Container -->
            <div class="center col-sm-9 col-sm-offset-3 col-md-6 col-md-offset-2 main" style="width:920px">
                <h2 class="sub-header">Registro</h2>


                <div id="adduser" class="tab-pane">
                        <br />
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <table><tr nowrap>
                                    <td><input type="number" id="phone" class="form-control" placeholder="Capture DN" required style="width:200px" autofocus /><asp:HiddenField runat="server" ID="hdf_phone" /></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="searchDN" OnClick="searchDNServer" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Buscar DN" OnClientClick="return searchDNfunction();">
                                            <span aria-hidden="true" class="glyphicon glyphicon-search"></span>Buscar
                                        </asp:LinkButton><asp:HiddenField ID="primerFacturaExistente" runat="server" /><asp:HiddenField ID="hdf_plan" runat="server" />                                      
                                    </td>       
                                    <td><p id="validForm" class="text-danger"> </td>                        
                                    </tr>
                                </table>
                            </div>  
                            <div class="panel-body">
                                <div id="Divq1" style="display:none;">
                                    <label for="myname" class="">1. Se localiza al cliente.?</label><br /><asp:HiddenField runat="server" ID="hdf_q1" />
                                          <input type="radio" name="q1" id="q1" value="Si" onclick="javascript: q1function(this.value)"/> Si<br>
                                          <input type="radio" name="q1" id="q1" value="No" onclick="javascript: q1function(this.value)"/> No<br />
                                    <br />
                                    <div id="reasonq1div" style="display:none;">
                                        <select id='reasonq1' name='reasonq1' class='form-control' required>
                                            <option value='Se corto llamada'>Se cort&oacute; llamada</option>
                                            <option value='Buzon'>Buzon</option>
                                            <option value='Problema de marcacion'>Problema de marcacion</option>                                            
                                            <option value='No contesta'>No contesta</option>
                                            <option value='Tono de ocupado'>Tono de ocupado</option>
                                        </select><asp:HiddenField runat="server" ID="hdf_reasonq1" />
                                    </div>    
                                </div>
                                <div id="reasonq1divYes" style="display:none;">
                                    <br /><label>
                                            Buenos días/tardes/noches le llamo de Movistar, mi nombre es______ y el motivo de esta llamada es para verificar si recibió la factura del plan que contrato recientemente. <br /><br />
                                            <label for="myusr">2. Con quien tengo el gusto?</label><br />
                                            <input type="text" id="myaddname" class="form-control" placeholder="Nombre Completo" required style="width: 400px"/>
                                            </label><br />   <asp:HiddenField runat="server" ID="hdf_myaddname" /> 
                                            <label class="alert-info">
                                                VALIDACIÓN
                                            </label> <br />     
                                            <label>                                                
                                                4. Es usted el titular de la líena
                                            </label><br />    
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Si" onclick="javascript: approvePlanfunction(this.value)"/> Si<br>
                                              <input type="radio" name="approvePlan" id="approvePlan" value="No Titular" onclick="javascript: approvePlanfunction(this.value)" /> No Titular<br />
                                              <input type="radio" name="approvePlan" id="approvePlan" value="No" onclick="javascript: approvePlanfunction(this.value)" /> No acepta llamada<br />
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Llamar despues" onclick="javascript: approvePlanfunction(this.value)"/> Llamar despu&eacute;s
                                        <br /><asp:HiddenField runat="server" ID="hdf_approvePlan" />                                     

                                        <div id="objectionDiv" style="display:none;" class="bg-primary">                                            
                                            <br /><label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label><br /><br />
                                            <select id='approvePlanSelect' name='approvePlanSelect' class='form-control' onchange="javascript: approvePlanSelectFunction(this.value)" required>
                                                <option value=''>Selecciona</option>
                                                <option value='Encuesta No Efectiva'>Encuesta No Efectiva</option>
                                            </select><asp:HiddenField runat="server" ID="hdf_approvePlanSelect" /><br />
                                            </div>
                                        <div id="callLater2Div" style="display:none;">
                                            <input  type="date" id="preg_2_Dia" required /><asp:HiddenField runat="server" ID="hdf_preg_2_Dia" />
                                            <input  type="time" id ="preg_2_Hora" required /><asp:HiddenField runat="server" ID="hdf_preg_2_hora" /><br />
                                            <label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label>
                                            <br />
                                        </div> 
                                        <div id="noTitularDiv" style="display:none;">
                                            <label>                                                
                                                5. Me puede comunicar con el titular de la línea?
                                            </label><br />    
                                              <input type="radio" name="titularApprove" id="titularApprove" value="Si" onclick="javascript: titularApprovefunction(this.value)" /> Si<br>
                                              <input type="radio" name="titularApprove" id="titularApprove" value="No" onclick="javascript: titularApprovefunction(this.value)" /> No<br />
                                            <br /><asp:HiddenField runat="server" ID="hdf_titularApprove" />
                                        </div> 
                                          <div id="rechazaTitularDiv" style="display:none;" class="bg-primary">                                            
                                            <label class="alert-danger">
                                            De acuerdo Sr./Srita () en este caso no puedo continuar con esta llamada a nombre de MoviStar le agradezco su tiempo, le reitero mi nombre _________ y le recuerdo que estamos a su disposición las 24hrs de los 365 días de año llamando al *611. Que tenga un excelente día / tarde / noche.<br /></label><br /><br />
                                            <select id='noTitularSelect' name='approvePlanSelect' class='form-control' onchange="javascript: approvePlanSelectFunction2(this.value)" required>
                                                <option value=''>Selecciona</option>
                                                <option value='No es titular'>No es titular</option>
                                            </select><asp:HiddenField runat="server" ID="hdf_noTitularSelect" /><br />
                                        </div>
                                        <div id="acceptDiv" style="display:none;">
                                            <label>                                                
                                                6. Sr. / Srita. Recibió la factura vía SMS? correspondiente a su plan <asp:Label ID="lblPlan" runat="server"></asp:Label>?
                                            </label><br />    
                                              <input type="radio" name="approveSms" id="approveSms" value="Si" onclick="javascript: approveSmsfunction(this.value)" /> Si<br>
                                              <input type="radio" name="approveSms" id="approveSms" value="No" onclick="javascript: approveSmsfunction(this.value)" /> No
                                            <br /><asp:HiddenField runat="server" ID="hdf_approveSms" />
                                            <div id="rechazaSMS" style="display:none;">
                                                <label>                                                
                                                    7. Sr. / Srita. me puede corroborar su dirección por favor? (Verificar la dirección en el Front End)
                                                </label><br />    
                                                    <input type="radio" name="direccionApprove" id="direccionApprove" value="Correcta" onclick="javascript: approveDireccionfunction(this.value)" /> Correcta<br>
                                                    <input type="radio" name="direccionApprove" id="direccionApprove" value="No es correcta" onclick="javascript: approveDireccionfunction(this.value)" /> No es correcta (modificar y codificar como cambio de datos de correspondencia en el Front En)
                                                <br /><asp:HiddenField runat="server" ID="hdf_direccionApprove" />                                    
                                            </div>
                                            <label>                                                
                                                8. Me puede indicar si recibió la factura de manera electrónica?
                                            </label><br />    
                                                <input type="radio" name="electronicoApprove" id="electronicoApprove" value="Si" onclick="javascript: electronicoApprovefunction(this.value)" /> Si<br>
                                                <input type="radio" name="electronicoApprove" id="electronicoApprove" value="No" onclick="javascript: electronicoApprovefunction(this.value)" /> No
                                            <br /><asp:HiddenField runat="server" ID="hdf_electronicoApprove" />                                                                                   
                                          
                                        <div id="aceptaElectronico" style="display:none;">         
                                            <div id="correo" style="display:none;">
                                                <label>                                                
                                                    9. Sr. Srita cuenta con correo electrónico (registro de paperless) ?
                                                </label><br />    
                                                    <input type="radio" name="emailApprove" id="emailApprove" value="Si" onclick="javascript: approveEmailfunction(this.value)" /> Si<br>
                                                    <input type="radio" name="emailApprove" id="emailApprove" value="No" onclick="javascript: approveEmailfunction(this.value)" /> No
                                                <br /><asp:HiddenField runat="server" ID="hdf_emailApprove" />    
                                            </div>   
                                            <div id="tieneCorreoElectronico" style="display:none;"> 
                                                <label>                                                
                                                    10. Capturar correo electrónico
                                                </label><br />    
                                                    <input type="email" id="myemail" class="form-control" placeholder="Correo electrónico" required style="width: 400px"/>
                                                    <asp:HiddenField runat="server" ID="hdf_myemail" />
                                                <br />                                  
                                            </div>
                                            <font color="#4c71a6" size="4">Le recuerdo los principales beneficios con los que cuenta su plan: <br /></font>
                                            <div id="planKEDiv" style="display:none;"><ul><li>
                                                Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                <li>4 GB para navegar en internet.</li>
                                                <li>2 GB para Netflix.</li>
                                                <li>Redes Sociales ilimitadas como lo son Facebook. Twiter, WhatsApp, Instagram, Snapchat y Uber.</li>
                                                <li>Movistar PLAY incluido (se cobran de los 4GB)</li>
                                                <li>Además puede utilizar todos estos beneficios estando en México, EUA, Canadá y Puerto Rico</li>
                                                <li>Tarifa Excedente de $0.70</li>
                                                </ul>
                                            </div>
                                            <div id="planKEMDiv" style="display:none;"><ul><li>
                                                Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                <li>1 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                <li>Tarifa Excedente de $0.70</li>
                                                <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                </ul>
                                            </div>
                                            <div id="planKELDiv" style="display:none;"><ul><li>
                                                Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                <li>2 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                <li>Tarifa Excedente de $0.70</li>
                                                </ul>
                                            </div>
                                            <div id="planKEFDiv" style="display:none;"><ul><li>
                                                Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                <li>4 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                <li>Tarifa Excedente de $0.70</li>
                                                <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                </ul>
                                            </div>
                                            <div id="planKEGDiv" style="display:none;"><ul><li>
                                                Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                <li>5.5 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                <li>Tarifa Excedente de $0.70</li>
                                                <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                </ul>
                                            </div><br />
                                            En su factura aparece el monto total a pagar de $<asp:Label ID="lblPrecio" runat="server"></asp:Label> que mensualmente deberá cubrir antes del día . Usted podrá realizar dicho pago a través de su TDC, Debito o bien en efectivo por medio de un deposito a través de bancos o establecimientos autorizados , entre los que le destacamos los siguientes <a href="http://10.225.236.31/icl/login.html">http://10.225.236.31/icl/login.html</a> <br /><br />
                                            Sr. / Srita. me puede indicar el lugar donde realizaría sus pagos de forma recurrente?<br />
                                            <select name="ddlLugarPagoRecurrente" id="ddlLugarPagoRecurrente" onchange="javascript:ddlLugarPagoRecurrenteFunction(this.value)" class='form-control' required>
	                                            <option selected="selected" value="">Seleccionar...</option>
	                                            <option value="BBVA Bancomer">BBVA Bancomer</option>
	                                            <option value="Banco Azteca">Banco Azteca</option>
	                                            <option value="Coppel">Coppel</option>
	                                            <option value="Farmacias del Ahorro">Farmacias del Ahorro</option>
	                                            <option value="Tiendas Extra">Tiendas Extra</option>
	                                            <option value="RED Efectiva">RED Efectiva</option>
	                                            <option value="HSBC">HSBC</option>
	                                            <option value="Banamex">Banamex</option>
	                                            <option value="Santander">Santander</option>
	                                            <option value="Banorte">Banorte</option>
	                                            <option value="Scotiabank Inverlat">Scotiabank Inverlat</option>
	                                            <option value="Otro">Otro</option>
                                            </select><asp:HiddenField runat="server" ID="hdf_ddlLugarPagoRecurrente" /><br />
                                            <div id="otroPagoRecurrenteDiv" style="display:none;">
                                                En caso de seleccionar otro, capturar el lugar: (sólo aplica si el cliente menciona pagar en CAC, por Internet o pago recurrente)<br />
                                                <input type="text" id="myPago" class="form-control" placeholder="Lugar" required style="width: 400px"/>
                                                    <asp:HiddenField runat="server" ID="hdf_myPago" />
                                            </div>
                                            <br />
                                            
                                                En este momento le haremos llegar por medio de mensaje de texto su referencia esto para que la pueda consultar en el momento que usted la necesite. <br /> <br />
                                                ¿Se envía referencia bancaria? (pregunta para el ejecutivo)  <br />

                                                <input type="radio" name="referenciaApprove" id="referenciaApprove" value="Si" onclick="javascript: referenciaApprovefunction(this.value)" /> Si<br>
                                                <input type="radio" name="referenciaApprove" id="referenciaApprove" value="No" onclick="javascript: referenciaApprovefunction(this.value)" /> No
                                                <br /><asp:HiddenField runat="server" ID="hdf_referenciaApprove" />     <br />                                                                              

                                                En el caso de terminar sus beneficios usted podrá realizar recargas para continuar con su servicio hasta que se le asignen los beneficios nuevamente en su fecha de corte. Le recuerdo que las recargas no pagan la factura del plan con el que cuenta actualmente.<br /><br />
                                                 Le recuerdo que su fecha limite de pago es el dia XX de cada mes y su fecha de corte el día XX. Movistar por agradecimiento a su lealtad le otorgará beneficios especiales cada vez que usted pague su factura antes de su fecha límite de pago.  <br /><br />

                                                11. Tiene alguna duda?<br />

                                                <input type="radio" name="dudaApprove" id="dudaApprove" value="Si" onclick="javascript: dudaApprovefunction(this.value)" /> Si(Resolver)<br>
                                                <input type="radio" name="dudaApprove" id="dudaApprove" value="No" onclick="javascript: dudaApprovefunction(this.value)" /> No
                                                <br /><asp:HiddenField runat="server" ID="hdf_dudaApprove" /> <br />
            


                                                 Estimado cliente, para usted tenernos una promoción por su lealtad con nosotros y consiste en que si realiza en este momento la domiciliación del pago de su factura a una TDC la sexta renta de su plan será gratis. Solo necesitamos que nos proporcione datos de su TDC para poder activarle esta promoción que está sujeta a una autorización previa por parte de su banco y nosotros. <br />
                                                 En caso de ser rechazada, nos pondremos en contacto con usted.  (Utilizar aplicativo de domiciliación en TDC) <br />  <br />


                                                <input type="radio" name="domiciliarApprove" id="domiciliarApprove" value="Acepta Domiciliar" onclick="javascript: domiciliarApprovefunction(this.value)" /> Acepta Domiciliar<br>
                                                <input type="radio" name="domiciliarApprove" id="domiciliarApprove" value="No Acepta Domiciliar" onclick="javascript: domiciliarApprovefunction(this.value)" /> No Acepta Domiciliar<br />
                                                <br /><asp:HiddenField runat="server" ID="hdf_domiciliarApprove" /> 
                                                Con base en una escala de 0 a 10 donde 0 es la calificacion mas baja y 10 es la calificacion mas alta, ¿Que tan probable es que usted recomiende los servicios de Movistar a sus familiares y amigos?<br />
                                                <input type="radio" name="recomendar1" id="recomendar1" value="1" onclick="javascript: recomendarfunction(this.value)" /> 1
                                                <input type="radio" name="recomendar1" id="recomendar1" value="2" onclick="javascript: recomendarfunction(this.value)" /> 2
                                                <input type="radio" name="recomendar1" id="recomendar1" value="3" onclick="javascript: recomendarfunction(this.value)" /> 3
                                                <input type="radio" name="recomendar1" id="recomendar1" value="4" onclick="javascript: recomendarfunction(this.value)" /> 4
                                                <input type="radio" name="recomendar1" id="recomendar1" value="5" onclick="javascript: recomendarfunction(this.value)" /> 5
                                                <input type="radio" name="recomendar1" id="recomendar1" value="6" onclick="javascript: recomendarfunction(this.value)" /> 6
                                                <input type="radio" name="recomendar1" id="recomendar1" value="7" onclick="javascript: recomendarfunction(this.value)" /> 7
                                                <input type="radio" name="recomendar1" id="recomendar1" value="8" onclick="javascript: recomendarfunction(this.value)" /> 8
                                                <input type="radio" name="recomendar1" id="recomendar1" value="9" onclick="javascript: recomendarfunction(this.value)" /> 9
                                                <input type="radio" name="recomendar1" id="recomendar1" value="10" onclick="javascript: recomendarfunction(this.value)" /> 10
                                                <br /><asp:HiddenField runat="server" ID="hdf_Recomendar" />
                                                <label class="alert-success">
                                                    Sr. / Srita. () agradecemos su tiempo y preferencia con Movistar, estamos a sus ordenes las 24 hrs. los 365 días del año marcando *611, Que tenga excelente día / tarde / noche. Hasta luego. 
                                                <br /></label>
                                                <select id='acceptMigration' name='acceptMigration' class='form-control' required>
                                                    <option value=''>Selecciona</option>
                                                    <option value='Encuesta Efectiva'>Encuesta Efectiva</option>
                                                </select><asp:HiddenField runat="server" ID="hdf_acceptMigration" />       
                                        </div>          
                                            </div>                                                                                 
                                </div>                                                       
                            </div>              
                                <asp:LinkButton runat="server" Visible="false" ID="newuser2" OnClick="submitRecord" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Guardar" OnClientClick="return validateFields();">
                                        <span aria-hidden="true" class="glyphicon glyphicon-check"></span>Guardar
                                    </asp:LinkButton><p id="validForm2" class="text-danger"></p>                       
                        </div>
                    </div>
            </div>
            <!-- End data container -->
        </div>
        <!-- End container as Row-->

        <div class=" col-sm-5 center">
            <div runat="server" id="alerts"></div>
        </div>

    </div></form>
    <!-- End Global Container -->
    
    <script type="text/javascript">     
        function validateFields() {
            var divs = document.getElementsByTagName("div");
            for (var i = 0; i < divs.length; i++) {
                if (divs[i].id != "") {
                    if (divs[i].style.getPropertyValue("display") == "none") {
                        descendents = divs[i].getElementsByTagName("div");
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.style.getPropertyValue("display") == "block") {
                                alert("parent: " + divs[i].id);
                                alert("children: " + divs[i].id);
                                e.style.getPropertyValue("display") == "none";
                            }
                        }
                    }
                }
            }        
            var valid = true;
            if (phone.value == "")
                valid = false;
            if (Divq1.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_q1.ClientID %>').value == "") {
                valid = false;
            }
            if (reasonq1divYes.style.getPropertyValue("display") == "block" && myaddname.value == "")
            {
                valid = false;
            }
            if (tieneCorreoElectronico.style.getPropertyValue("display") == "block" && myemail.value == "")
            {
                valid = false;
            }
            if (aceptaElectronico.style.getPropertyValue("display") == "block" && acceptMigration.value == "")
            {
                valid = false;
            }
            if (otroPagoRecurrenteDiv.style.getPropertyValue("display") == "block" && myPago.value == "")
            {
                valid = false;
            } 

            if (!valid)
            {                
                document.getElementById("validForm2").innerHTML = "Selecciona todas las opciones visibles";
                return valid;
            }
            document.getElementById('<%= hdf_reasonq1.ClientID %>').value = reasonq1.value;
            document.getElementById('<%= hdf_phone.ClientID %>').value = phone.value;
            document.getElementById('<%= hdf_preg_2_Dia.ClientID %>').value = preg_2_Dia.value;
            document.getElementById('<%= hdf_preg_2_hora.ClientID %>').value = preg_2_Hora.value;            
            document.getElementById('<%= hdf_approvePlanSelect.ClientID %>').value = approvePlanSelect.value; 
            document.getElementById('<%= hdf_myaddname.ClientID %>').value = myaddname.value;
            document.getElementById('<%= hdf_myemail.ClientID %>').value = myemail.value;
            document.getElementById('<%= hdf_acceptMigration.ClientID %>').value = acceptMigration.value;
            document.getElementById('<%= hdf_myPago.ClientID %>').value = myPago.value;
            var divs = document.getElementsByTagName("div");
            for (var i = 0; i < divs.length; i++) {                
                if (divs[i].id != "") {
                    if (divs[i].style.getPropertyValue("display") == "none") {
                        descendents = divs[i].getElementsByTagName("input");                        
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.required) {
                                e.required = false;
                            }
                        }                        
                        descendents = divs[i].getElementsByTagName("select");
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.required) {
                                e.required = false;
                            }
                        }
                    }
                }                
            }

            for (var i = 0; i < divs.length; i++) {
                if (divs[i].id != "") {
                    if (divs[i].style.getPropertyValue("display") == "block") {
                        descendents = divs[i].getElementsByTagName("input");
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.required && e.value == "") {
                                document.getElementById("validForm2").innerHTML = "Selecciona todas las opciones visibles";
                                return false;                                
                            }
                            if (e.type == "radio" && e.parentNode.style.getPropertyValue("display") == "block")
                            {
                                var checkGroup = document.getElementsByName(e.name);
                                var otherChecked = false;
                                for (var k = 0; k < checkGroup.length; ++k) {
                                    var f = checkGroup[k];
                                    if (f.checked) {
                                        otherChecked = true;
                                        break;
                                    }                                    
                                }
                                if (!otherChecked) {
                                    document.getElementById("validForm2").innerHTML = "Selecciona todas las opciones visibles";
                                    return false;
                                }
                            }
                        }
                        descendents = divs[i].getElementsByTagName("select");
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.required && e.value == "") {
                                document.getElementById("validForm2").innerHTML = "Selecciona todas las opciones visibles";
                                return false;
                            }
                        }
                    }
                }
            }
            return true;
        }

        function ddlLugarPagoRecurrenteFunction(answer)
        {
            if (answer == "Otro") {
                document.getElementById("otroPagoRecurrenteDiv").style = "display:block;";
            }
            else {
                document.getElementById("otroPagoRecurrenteDiv").style = "display:none;";
            }
            document.getElementById('<%= hdf_ddlLugarPagoRecurrente.ClientID %>').value = answer;
        }
        
        function q1function(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No")
            {
                document.getElementById("reasonq1div").style = "display:block;";
                document.getElementById("reasonq1divYes").style = "display:none;";
            }
            else
            {
                document.getElementById("reasonq1divYes").style = "display:block;";
                document.getElementById("reasonq1div").style = "display:none;";
                switch(document.getElementById('<%= hdf_plan.ClientID %>').value)
                {
                    case "KE":
                        document.getElementById("planKEDiv").style = "display:block;";
                        document.getElementById("planKEMDiv").style = "display:none;";
                        document.getElementById("planKELDiv").style = "display:none;";
                        document.getElementById("planKEFDiv").style = "display:none;";
                        document.getElementById("planKEGDiv").style = "display:none;";
                        break;
                    case "KEM":
                        document.getElementById("planKEMDiv").style = "display:block;";
                        document.getElementById("planKELDiv").style = "display:none;";
                        document.getElementById("planKEFDiv").style = "display:none;";
                        document.getElementById("planKEGDiv").style = "display:none;";
                        document.getElementById("planKEDiv").style = "display:none;";
                        break;
                    case "KEL":
                        document.getElementById("planKEMDiv").style = "display:none;";
                        document.getElementById("planKELDiv").style = "display:block;";
                        document.getElementById("planKEFDiv").style = "display:none;";
                        document.getElementById("planKEGDiv").style = "display:none;";
                        document.getElementById("planKEDiv").style = "display:none;";
                        break;
                    case "KEF":
                        document.getElementById("planKEMDiv").style = "display:none;";
                        document.getElementById("planKELDiv").style = "display:none;";
                        document.getElementById("planKEFDiv").style = "display:block;";
                        document.getElementById("planKEGDiv").style = "display:none;";
                        document.getElementById("planKEDiv").style = "display:none;";
                        break;
                    case "KEG":
                        document.getElementById("planKEMDiv").style = "display:none;";
                        document.getElementById("planKELDiv").style = "display:none;";
                        document.getElementById("planKEFDiv").style = "display:none;";
                        document.getElementById("planKEGDiv").style = "display:block;";
                        document.getElementById("planKEDiv").style = "display:none;";
                        break;
                }
            }
            document.getElementById('<%= hdf_q1.ClientID %>').value = answer;
        }

        function titularApprovefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No") {
                document.getElementById("rechazaTitularDiv").style = "display:block;";
                document.getElementById("acceptDiv").style = "display:none;";
            }
            else {
                document.getElementById("rechazaTitularDiv").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:block;";
            }
            document.getElementById('<%= hdf_titularApprove.ClientID %>').value = answer;
        }

        function approveSmsfunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No") {
                document.getElementById("rechazaSMS").style = "display:block;";
            }
            else {
                document.getElementById("rechazaSMS").style = "display:none;";
            }
            document.getElementById('<%= hdf_approveSms.ClientID %>').value = answer;
        }

        function approveDireccionfunction(answer) {
            document.getElementById("validForm").innerHTML = "";            
            document.getElementById('<%= hdf_direccionApprove.ClientID %>').value = answer;
        }

        function referenciaApprovefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_referenciaApprove.ClientID %>').value = answer;
        }

        function dudaApprovefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_dudaApprove.ClientID %>').value = answer;
        }

        function domiciliarApprovefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_domiciliarApprove.ClientID %>').value = answer;
        } 
        function recomendarfunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_Recomendar.ClientID %>').value = answer;
        }

        function electronicoApprovefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_direccionApprove.ClientID %>').value = answer;
            if (answer == "No")
                document.getElementById("correo").style = "display:block;";
            else
                document.getElementById("correo").style = "display:none;";
            document.getElementById("aceptaElectronico").style = "display:block;";
        }

        function approveEmailfunction(answer) {
            if (answer == "No")
            {
                document.getElementById("tieneCorreoElectronico").style = "display:none;";
            }
            else
            {
                document.getElementById("tieneCorreoElectronico").style = "display:block;";
            }
            document.getElementById("validForm").innerHTML = "";
            document.getElementById('<%= hdf_emailApprove.ClientID %>').value = answer;
        }

        function searchDNfunction() {
            document.getElementById('<%= hdf_phone.ClientID %>').value = phone.value;            
            var inpObj = document.getElementById("phone");
            if (inpObj.checkValidity()) {
                
                document.getElementById("Divq1").style = "display:block;";
                document.getElementById("validForm").innerHTML = "";
            }
            else {
                document.getElementById("validForm").innerHTML = "Captura un DN";
                document.getElementById("Divq1").style = "display:none;";
            }
            return inpObj.checkValidity();
        }

        function approvePlanfunction(answer) {
            document.getElementById('<%= hdf_approvePlan.ClientID %>').value = answer; 
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No") {
                document.getElementById("objectionDiv").style = "display:block;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:none;";
                document.getElementById("noTitularDiv").style = "display:none;";
            }
            else if (answer == "Llamar despues")
            {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:block;";
                document.getElementById("acceptDiv").style = "display:none;";
                document.getElementById("noTitularDiv").style = "display:none;";
                
            }
            else if (answer == "No Titular")
            {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:none;";
                document.getElementById("noTitularDiv").style = "display:block;";
                
            }
            else {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:block;";
                document.getElementById("noTitularDiv").style = "display:none;";
            }
        }

        function approvePlanSelectFunction(answer)
        {
            document.getElementById('<%= hdf_approvePlanSelect.ClientID %>').value = answer; 
        }

        function approvePlanSelectFunction2(answer) {
            document.getElementById('<%= hdf_noTitularSelect.ClientID %>').value = answer;
        }
        //]]>
    </script>


</asp:Content>
