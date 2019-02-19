<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="True" CodeFile="data1.aspx.cs" Inherits="WebData.Data1" %>

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
                                        </asp:LinkButton><asp:HiddenField ID="ventaExistente" runat="server" />                                            
                                    </td>       
                                    <td><p id="validForm1" class="text-danger"> </td>                        
                                    </tr>
                                </table>
                            </div>  
                            <div class="panel-body">
                                <div id="Divq1" style="display:none;">
                                    <label for="myname" class="">1. Se localiza al cliente.?</label><br /><asp:HiddenField runat="server" ID="hdf_q1" />
                                          <input type="radio" name="q1" id="q1" value="Si" onclick="javascript: q1function(this.value)"/> Si<br>
                                          <input type="radio" name="q1" id="q1" value="No" onclick="javascript: q1function(this.value)"/> No<br />
                                          <input type="radio" name="q1" id="q1" value="Llamar despues" onclick="javascript: q1function(this.value)"/> Llamar despu&eacute;s
                                    <br /><div id="reasonq1div" style="display:none;">
                                        <select id='reasonq1' name='reasonq1' class='form-control' required>
                                            <option value='Se corto llamada'>Se cort&oacute; llamada</option>
                                            <option value='Buzon'>Buzon</option>
                                            <option value='Problema de marcacion'>Problema de marcacion</option>                                            
                                            <option value='No contesta'>No contesta</option>
                                            <option value='Tono de ocupado'>Tono de ocupado</option>
                                        </select><asp:HiddenField runat="server" ID="hdf_reasonq1" />
                                    </div>
                                    <div id="reasonq1div2" style="display:none;">
                                        <input  type="date" id="preg_1_Dia" required /><asp:HiddenField runat="server" ID="hdf_preg_1_Dia" />
                                        <input  type="time" id ="preg_1_Hora" required /><asp:HiddenField runat="server" ID="hdf_preg_1_Hora" />
                                        <br />
                                    </div>       
                                </div>
                                <div id="reasonq1divYes" style="display:none;">
                                    <br /><label for="phone">      Buenos dias/tardes/noches mi nombre es _________ hablo de Movistar para contarle de los beneficios de una mejor oferta ilimitada que supera  la que usted tiene actualmente.
 
                                                  <br />Me puede confirmar por favor si usted es el titular del numero celular al que me estoy comunicando <asp:Label ID="lblDn" runat="server"></asp:Label> y puede tomar decisiones sobre la misma?. (Esperar a la confirmacion del cliente.)
                                            </label><br />                         
                                    <br /><label for="myusr">3. Con quien tengo el gusto? (Solicitar nombre completo, para personalizacion del plan actual)</label><br />
                                    <table>
                                            <tr>
                                                <td><input type="text" id="myaddname" class="form-control" placeholder="Nombre Completo" required style="width: 400px"/>
                                                    <asp:HiddenField runat="server" ID="hdf_myaddname" /></td>
                                                <td><p id="demo" class="text-danger"></p></tr></td>
                                        </table>
                                    <br /><label class="">Sr. / Srita es usted mayor de 18 años?</label><br />
                                          <input type="radio" name="q3" id="q3" value="Si" onclick="javascript: q3function(this.value)"/> Si<br>
                                          <input type="radio" name="q3" id="q3" value="No" onclick="javascript: q3function(this.value)" /> No<br /><asp:HiddenField runat="server" ID="hdf_q3" />
                                    <div id="ageDiv" style="display:none;">
                                        <label>Me puede indicar su edad por favor?</label><br />
                                        <input  type="number" id="age" class="form-control" placeholder="Edad" required /><asp:HiddenField runat="server" ID="hdf_age" /></td><br />
                                        <label class="alert-danger">
                                            Sr./Srita () le comento que la oferta que estamos manejando es solamente para personas mayores de 25 años y menores o iguales a 70 años, por lo cual en esta ocasion no podemos continuar con el proceso, sin embargo nos estaremos comunicando posteriormente para ofrecerle mas beneficios que apliquen a su linea, por lo que en su caso la mejor opcion es continuar disfrutando de nuestras promociones de prepago. A nombre de Movistar agradecemos su tiempo. Le recordamos que estamos a sus ordenes las 24 hrs. de los 365 dias del año en *611.
                                            </label>
                                    </div>
                                    <div id="deviceDiv" style="display:none;">
                                        <br /><label class="">¿Cuenta usted con Equipo marca Black Berry u otra marca?</label><br />
                                          <input type="radio" name="qDevice" id="qDevice" value="Si" onclick="javascript: qDevicefunction(this.value)"/> Si<br>
                                          <input type="radio" name="qDevice" id="qDevice" value="No" onclick="javascript: qDevicefunction(this.value)" /> No<br />
                                          <asp:HiddenField runat="server" ID="hdf_qDevice" />
                                    </div>
                                    <div id="planDiv" style="display:none;">
                                        <br /><label>Lista de planes disponibles</label><br />
                                        <select id='planSelect' name='planSelect' class='form-control' onchange="javascript: planselectFunction()">
                                        <option value='KEM'>Vas a Volar 0.3 Canal</option>
                                        <option value='KEL'>Vas a Volar 0.5 Canal</option>
                                        <option value='KEF'>Vas a Volar 1 Canal</option>
                                        <option value='KEG'>Vas a Volar 1.5 Canal</option>
                                    </select><asp:HiddenField runat="server" ID="hdf_planSelect" /><br />
                                        <div id="planKEMDiv" style="display:block;">
                                            <br>
                                            <table >
                                                <tbody><tr>
                                                    <td style="text-align: justify">
                                                        <font color="#4C71A6" size="2"><b>Oferta y Beneficios</b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify"><font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        Movistar tiene el nuevo plan
                                                        <span id="lblPlan" style="color:Green;">Vas a Volar 0.3 Canal</span>
                                                        y como brevemente le comente le ofrece:
                                                    </b></font>

                                                        
                                                        
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left">
                                                        <span id="lblScript1"><font color="#777777" size="2"><b><ul><li>
                                                            Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                            <li>1 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                            <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                            <li>Tarifa Excedente de $0.70</li>
                                                            <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                            </ul>
                                                            Este Plan tiene una Renta mensual de $149 que deberan ser cubiertos antes de la fecha limite de pago que se mencione en su factura para seguir contando con sus beneficios.
                                                            <br>
                                                            <br>
                                                            Ahora, si lo que a usted le interesa es tener su plan con un Smartphone, lo unico que debe hacer es: 
                                                            <br>
                                                            <br>
                                                            a) Acudir a cualquiera de nuestros Centros de Atencion
                                                            <br>
                                                            b) Presentar su TDC o bien pagar en efectivo un deposito que ahi mismo le indicaran el monto.
                                                            <br>
                                                            c) Y solicitar cualquiera de los equipos que tenemos disponibles en este plan, usted podra escoger entre otros equipos de las mejores marcas como:
                                                            <br>
                                                            <ul>
                                                            <li>Samsung</li>
                                                            <li>Sony</li>
                                                            <li>Motorola</li>
                                                            <li>E incluso cambiando a un plan de renta mayor, podria obtener hasta un iPhone</li>
                                                            </ul>
                                                            </b></font></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comparativa de
                                                            minutos vs Prepago:</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="text-align: justify">
                                                        <br>
                                                        
                                                        
                                                        <img id="ImgOferta" src="Content/img/PLAN_03.png" style="border-width:0px;">
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Este plan es
                                                            una de las mejores ofertas vigentes dentro del mercado, ya que es un plan a cero
                                                            meses por lo que usted decide la permanencia del mismo.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La oferta que
                                                            le brindamos es un plan control, por lo que no le generara cargos adicionales a la
                                                            factura que siempre sera por el mismo monto.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            Todos estos beneficios por una renta mensual
                                                            de
                                                            <span id="lblCostoPlan" style="color:Green;">$149</span>;
                                                            el pago del plan es muy sencillo, ya que lo puede realizar en efectivo en cualquiera
                                                            de los centros autorizados como: (Mencionar 5 centros autorizados al cliente) 
                                                            <a href="#" onclick="window.open('http://intranetclientes.movistar.com.mx/icl/public/page.jsp?url=general/detalle_general.jsp&amp;action=edit&amp;cveGeneral=22&amp;cvep=0','mywindow');">
                                                                <span id="Label5" style="color:Green;">(Ver medios de pago en Intranet)</span></a>
                                                            o para mayor comodidad con cargo a su tarjeta de debito
                                                            o credito.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            El pago sera en una sola exhibicion, las recargas no aplicarian como medio de pago,
                                                            usted recibira sus beneficios los dias
                                                            <span id="lblFechaAsignacion2" style="color:Green;">24</span>
                                                            de cada mes y como fecha limite de pago
                                                            sera
                                                            <span id="lbl_fecha_limite" style="color:Green;">15</span>
                                                            de cada mes.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table><br />
                                        </div>
                                        <div id="planKELDiv" style="display:none;">
                                            <br>
                                            <table >
                                                <tbody><tr>
                                                    <td style="text-align: justify">
                                                        <font color="#4C71A6" size="2"><b>Oferta y Beneficios</b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify"><font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        Movistar tiene el nuevo plan
                                                        <span id="lblPlan" style="color:Green;">Vas a Volar 0.5 Canal</span>
                                                        y como brevemente le comente le ofrece:
                                                    </b></font>

                                                        
                                                        
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left">
                                                        <span id="lblScript1"><font color="#777777" size="2"><b><ul><li>
                                                            Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                            <li>2 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                            <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                            <li>Tarifa Excedente de $0.70</li>
                                                            </ul>
                                                            Este Plan tiene una Renta mensual de $219 que deberan ser cubiertos antes de la fecha limite de pago que se mencione en su factura para seguir contando con sus beneficios.
                                                            <br>
                                                            <br>
                                                            Ahora, si lo que a usted le interesa es tener su plan con un Smartphone, lo unico que debe hacer es: 
                                                            <br>
                                                            <br>
                                                            a) Acudir a cualquiera de nuestros Centros de Atencion
                                                            <br>
                                                            b) Presentar su TDC o bien pagar en efectivo un deposito que ahi mismo le indicaran el monto.
                                                            <br>
                                                            c) Y solicitar cualquiera de los equipos que tenemos disponibles en este plan, usted podra escoger entre otros equipos de las mejores marcas como:
                                                            <br>
                                                            <ul>
                                                            <li>Samsung</li>
                                                            <li>Sony</li>
                                                            <li>Motorola</li>
                                                            <li>E incluso cambiando a un plan de renta mayor, podria obtener hasta un iPhone</li>
                                                            </ul>
                                                            </b></font></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comparativa de
                                                            minutos vs Prepago:</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="text-align: justify">
                                                        <br>
                                                        
                                                        
                                                        <img id="ImgOferta" src="Content/img/PLAN_05.png" style="border-width:0px;" width="812px" height="512px">
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Este plan es
                                                            una de las mejores ofertas vigentes dentro del mercado, ya que es un plan a cero
                                                            meses por lo que usted decide la permanencia del mismo.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La oferta que
                                                            le brindamos es un plan control, por lo que no le generara cargos adicionales a la
                                                            factura que siempre sera por el mismo monto.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            Todos estos beneficios por una renta mensual
                                                            de
                                                            <span id="lblCostoPlan" style="color:Green;">$219</span>;
                                                            el pago del plan es muy sencillo, ya que lo puede realizar en efectivo en cualquiera
                                                            de los centros autorizados como: (Mencionar 5 centros autorizados al cliente) 
                                                            <a href="#" onclick="window.open('http://intranetclientes.movistar.com.mx/icl/public/page.jsp?url=general/detalle_general.jsp&amp;action=edit&amp;cveGeneral=22&amp;cvep=0','mywindow');">
                                                                <span id="Label5" style="color:Green;">(Ver medios de pago en Intranet)</span></a>
                                                            o para mayor comodidad con cargo a su tarjeta de debito
                                                            o credito.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            El pago sera en una sola exhibicion, las recargas no aplicarian como medio de pago,
                                                            usted recibira sus beneficios los dias
                                                            <span id="lblFechaAsignacion2" style="color:Green;">XX</span>
                                                            de cada mes y como fecha limite de pago
                                                            sera
                                                            <span id="lbl_fecha_limite" style="color:Green;">XX</span>
                                                            de cada mes.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <br>
                                            </div>
                                        <div id="planKEFDiv" style="display:none;">
                                            <br>
                                            <table >
                                                <tbody><tr>
                                                    <td style="text-align: justify">
                                                        <font color="#4C71A6" size="2"><b>Oferta y Beneficios</b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify"><font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        Movistar tiene el nuevo plan
                                                        <span id="lblPlan" style="color:Green;">Vas a Volar 1 Canal</span>
                                                        y como brevemente le comente le ofrece:
                                                    </b></font>

                                                        
                                                        
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left">
                                                        <span id="lblScript1"><font color="#777777" size="2"><b><ul><li>
                                                            Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                            <li>4 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                            <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                            <li>Tarifa Excedente de $0.70</li>
                                                            <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                            </ul>
                                                            Este Plan tiene una Renta mensual de $349 que deberan ser cubiertos antes de la fecha limite de pago que se mencione en su factura para seguir contando con sus beneficios.
                                                            <br>
                                                            <br>
                                                            Ahora, si lo que a usted le interesa es tener su plan con un Smartphone, lo unico que debe hacer es: 
                                                            <br>
                                                            <br>
                                                            a) Acudir a cualquiera de nuestros Centros de Atencion
                                                            <br>
                                                            b) Presentar su TDC o bien pagar en efectivo un deposito que ahi mismo le indicaran el monto.
                                                            <br>
                                                            c) Y solicitar cualquiera de los equipos que tenemos disponibles en este plan, usted podra escoger entre otros equipos de las mejores marcas como:
                                                            <br>
                                                            <ul>
                                                            <li>Samsung</li>
                                                            <li>Sony</li>
                                                            <li>Motorola</li>
                                                            <li>E incluso cambiando a un plan de renta mayor, podria obtener hasta un iPhone</li>
                                                            </ul>
                                                            </b></font></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comparativa de
                                                            minutos vs Prepago:</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="text-align: justify">
                                                        <br>
                                                        
                                                        
                                                        <img id="ImgOferta" src="Content/img/PLAN_1.png" style="border-width:0px;">
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Este plan es
                                                            una de las mejores ofertas vigentes dentro del mercado, ya que es un plan a cero
                                                            meses por lo que usted decide la permanencia del mismo.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La oferta que
                                                            le brindamos es un plan control, por lo que no le generara cargos adicionales a la
                                                            factura que siempre sera por el mismo monto.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            Todos estos beneficios por una renta mensual
                                                            de
                                                            <span id="lblCostoPlan" style="color:Green;">$349</span>;
                                                            el pago del plan es muy sencillo, ya que lo puede realizar en efectivo en cualquiera
                                                            de los centros autorizados como: (Mencionar 5 centros autorizados al cliente) 
                                                            <a href="#" onclick="window.open('http://intranetclientes.movistar.com.mx/icl/public/page.jsp?url=general/detalle_general.jsp&amp;action=edit&amp;cveGeneral=22&amp;cvep=0','mywindow');">
                                                                <span id="Label5" style="color:Green;">(Ver medios de pago en Intranet)</span></a>
                                                            o para mayor comodidad con cargo a su tarjeta de debito
                                                            o credito.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            El pago sera en una sola exhibicion, las recargas no aplicarian como medio de pago,
                                                            usted recibira sus beneficios los dias
                                                            <span id="lblFechaAsignacion2" style="color:Green;">24</span>
                                                            de cada mes y como fecha limite de pago
                                                            sera
                                                            <span id="lbl_fecha_limite" style="color:Green;">15</span>
                                                            de cada mes.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <br>
                                           </div>
                                        <div id="planKEGDiv" style="display:none;">
                                            <br>
                                            <table >
                                                <tbody><tr>
                                                    <td style="text-align: justify">
                                                        <font color="#4C71A6" size="2"><b>Oferta y Beneficios</b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify"><font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        Movistar tiene el nuevo plan
                                                        <span id="lblPlan" style="color:Green;">Vas a Volar 1.5 Canal</span>
                                                        y como brevemente le comente le ofrece:
                                                    </b></font>

                                                        
                                                        
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left">
                                                        <span id="lblScript1"><font color="#777777" size="2"><b><ul><li>
                                                            Llamadas y SMS ilimitados para que hable sin restricciones a cualquier numero fijo o movil estando en Mexico, EUA, Canada y Puerto Rico, sin importar de que compañia sea.</li>
                                                            <li>5.5 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.</li>
                                                            <li>Ademas puede utilizar todos estos beneficios estando en Mexico, EUA, Canada y Puerto Rico.</li>
                                                            <li>Tarifa Excedente de $0.70</li>
                                                            <li>Tambien puede adquirir una Licencia de Spotify Premium , que le permite escuchar y descargar su musica favorita, si usted contratara directamente esta licencia tendria que pagar en $69 mensuales.</li>
                                                            </ul>
                                                            Este Plan tiene una Renta mensual de $449 que deberan ser cubiertos antes de la fecha limite de pago que se mencione en su factura para seguir contando con sus beneficios.
                                                            <br>
                                                            <br>
                                                            Ahora, si lo que a usted le interesa es tener su plan con un Smartphone, lo unico que debe hacer es: 
                                                            <br>
                                                            <br>
                                                            a) Acudir a cualquiera de nuestros Centros de Atencion
                                                            <br>
                                                            b) Presentar su TDC o bien pagar en efectivo un deposito que ahi mismo le indicaran el monto.
                                                            <br>
                                                            c) Y solicitar cualquiera de los equipos que tenemos disponibles en este plan, usted podra escoger entre otros equipos de las mejores marcas como:
                                                            <br>
                                                            <ul>
                                                            <li>Samsung</li>
                                                            <li>Sony</li>
                                                            <li>Motorola</li>
                                                            <li>E incluso cambiando a un plan de renta mayor, podria obtener hasta un iPhone</li>
                                                            </ul>
                                                            </b></font></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comparativa de
                                                            minutos vs Prepago:</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="text-align: justify">
                                                        <br>
                                                        
                                                        
                                                        <img id="ImgOferta" src="Content/img/PLAN_15.png" style="border-width:0px;">
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Este plan es
                                                            una de las mejores ofertas vigentes dentro del mercado, ya que es un plan a cero
                                                            meses por lo que usted decide la permanencia del mismo.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La oferta que
                                                            le brindamos es un plan control, por lo que no le generara cargos adicionales a la
                                                            factura que siempre sera por el mismo monto.</b></font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            Todos estos beneficios por una renta mensual
                                                            de
                                                            <span id="lblCostoPlan" style="color:Green;">$449</span>;
                                                            el pago del plan es muy sencillo, ya que lo puede realizar en efectivo en cualquiera
                                                            de los centros autorizados como: (Mencionar 5 centros autorizados al cliente) 
                                                            <a href="#" onclick="window.open('http://intranetclientes.movistar.com.mx/icl/public/page.jsp?url=general/detalle_general.jsp&amp;action=edit&amp;cveGeneral=22&amp;cvep=0','mywindow');">
                                                                <span id="Label5" style="color:Green;">(Ver medios de pago en Intranet)</span></a>
                                                            o para mayor comodidad con cargo a su tarjeta de debito
                                                            o credito.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table >
                                                <tbody><tr>
                                                    <td align="left" style="text-align: justify">
                                                        <font color="#777777" size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            El pago sera en una sola exhibicion, las recargas no aplicarian como medio de pago,
                                                            usted recibira sus beneficios los dias
                                                            <span id="lblFechaAsignacion2" style="color:Green;">24</span>
                                                            de cada mes y como fecha limite de pago
                                                            sera
                                                            <span id="lbl_fecha_limite" style="color:Green;">15</span>
                                                            de cada mes.
                                                        </b></font>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <br>
                                    </div>
                                        
                                        <label for="myname" class="">6. ¿Sr. / Srita le gustaria contar con los beneficios del nuevo plan postpago? <label id="planLbl2">Vas a Volar 0.3 Canal</label></label><br />
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Si" onclick="javascript: approvePlanfunction(this.value)" autofocus/> Si<br>
                                              <input type="radio" name="approvePlan" id="approvePlan" value="No" onclick="javascript: approvePlanfunction(this.value)" /> No<br />
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Llamar despues" onclick="javascript: approvePlanfunction(this.value)"/> Llamar despu&eacute;s
                                        <br /><asp:HiddenField runat="server" ID="hdf_approvePlan" />                                     
                                        <div id="acceptPlanDiv" style="display:none;">
                                             <label for="myname" class="">7. Le informo que esta llamada esta siendo grabada y monitoreada para efectos de
                                                calidad y mejora del servicio, su autorizacion tiene una validez juridica equivalente
                                                a la firma de un contrato, por lo cual usted se obliga a pagar puntualmente cada
                                                mes la renta de $<span id="lbl_renta_ini2" style="color:Green;">149</span>
                                                correspondiente a su plan
                                                <span id="lbl_plan_suegerido2" style="color:Green;"><label id="planLbl">Vas a Volar 0.3 Canal</label></span><br /></label><br />
                                              <input type="radio" name="approvePlan2" id="approvePlan2" value="Si" onclick="javascript: approvePlanfunction2(this.value)" /> Si<br>
                                              <input type="radio" name="approvePlan2" id="approvePlan2" value="No" onclick="javascript: approvePlanfunction2(this.value)" /> No<br />
                                              <input type="radio" name="approvePlan2" id="approvePlan2" value="Llamar despues" onclick="javascript: approvePlanfunction2(this.value)"/> Llamar despu&eacute;s
                                        <br /><asp:HiddenField runat="server" ID="hdf_approvePlan2" />                                   
                                        </div>
                                        <div id="objectionDiv" style="display:none;" class="bg-primary">
                                            Manejo de Objeciones:<br />
                                            
                                            <div id="objection1Header" class="bg-info" onclick="javascript: showObjection(1)">
		
                                            <a>No tengo dinero:</a>
                                                            
	                                        </div>
                                            <div id="objection1Content" class="bg-warning" style="display:none;">
		
                                            <div style="text-align: justify; color: #666; font-size: 10pt;">
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 1:</b> Este plan
                                                    que le ofrecemos es uno de los mas economicos que existen en el mercado y completamente
                                                    controlado por lo que le permite un rendimiento a su bolsillo. 
                                                </p>
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 2:</b> Con esta oferta todas sus llamadas y mensajes son ilimitados por lo que no tendra excedentes en su factura.
                                                </p>
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 3:</b> Sr. / Srita.
                                                    en este momento no es necesario que realice un pago, lo podra realizar hasta el
                                                    dia
                                                    <span id="AccordionPane2_content_lbl_fecha_limite2" style="color:Green;">15</span>
                                                    por lo que no vera afectada su economia. 
                                                </p>
                                                <p>
                                                    Dese la oportunidad de contar con este magnifico plan.<br>
                                                    Le gustaria que dieramos de alta el plan? Pasamos a la captura de sus datos?, De
                                                    acuerdo?
                                                </p>
                                            </div>
                                                            
	                                    </div>
                                        <div id="objection2Header" class="bg-info" onclick="javascript: showObjection(2)">
		
                                            <a>No quiero un compromiso (factura) mensual:</a>
                                                            
	                                    </div>
                                            <div id="objection2Content" class="bg-warning" style="display:none;">
		
                                            <div style="text-align: justify; color: #666; font-size: 10pt;">
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 1:</b> No lo vea
                                                    como un compromiso mensual al contrario estos beneficios son exclusivos para los
                                                    clientes seleccionados como usted, ya que le brindamos este plan por un costo mucho
                                                    menor a diferencia de lo que se tiene actualmente en el mercado.
                                                </p>
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 2:</b> El plan
                                                    le ofrece beneficios unicos para su linea  como llamadas y sms ilimitados, redes sociales ilimitadas 
                                                    y una bolsa de datos para navegar en Internet, no tiene un plazo forzoso
                                                    a diferencia de los demas planes comerciales, usted podra regresar a la modalidad
                                                    de prepago vigente en el momento que usted decida, siempre y cuando este al dia
                                                    con el pago de su plan. La factura es informativa ya que la renta de su plan siempre
                                                    sera el mismo monto mes con mes.
                                                </p>
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 3:</b> No lo vea
                                                    como un compromiso ya que no se le exige una permanencia minima con lo cual usted
                                                    puede volver a prepago en cualquier momento siempre que este al dia en el pago de
                                                    sus facturas. 
                                                </p>
                                                <p>
                                                    Dese la oportunidad de contar con este magnifico plan.<br>
                                                    Le gustaria que dieramos de alta el plan? Pasamos a la captura de sus datos?, De
                                                    acuerdo?
                                                </p>
                                            </div>
                                                            
	                                    </div>
                                            <div id="objection3Header" class="bg-info" onclick="javascript: showObjection(3)">
		
                                            <a>No quiero perder mis beneficios del plan prepago / No quiero perder mis numeros gratis:</a>
                                                            
	                                    </div>
                                            <div id="objection3Content" class="bg-warning" style="display:none;">
		
                                                                <div style="text-align: justify; color: #666; font-size: 10pt;">
                                                                    <p>
                                                                        <b style="color: darkblue; text-decoration: underline;">Objecion 1:</b> Usted no
                                                                        pierde beneficios, por el contrario los incrementa, ya que
                                                                        por el mismo consumo usted contara con una bolsa de minutos ilimitados que le permite hablar
                                                                        mas.
                                                                    </p>
                                                                    <p>
                                                                        <b style="color: darkblue; text-decoration: underline;">Objecion 2:</b> Usted no
                                                                        pierde beneficios ya que por ser un cliente preferente, Movistar
                                                                        le seguira  informando sobre las promociones especiales para
                                                                        los cuales aplica su linea, estas promociones son adicionales  a los beneficios
                                                                        que le ofrecemos en este plan, estos pueden ser a traves de SMS o bien puede validarlos
                                                                        en nuestra pagina de Internet www.movistar.com.mx
                                                                    </p>
                                                                    <p>
                                                                        <b style="color: darkblue; text-decoration: underline;">Objecion 3:</b> Sr. / Srita.
                                                                        <span id="AccordionPane8_content_lbl_nombre_cliente8" style="color:Green;"></span>
                                                                        usted puede comprar modulos adicionales de megas  <a target="_blank" href="http://intranetclientes.movistar.com.mx/icl/public/page.jsp?url=plan/detalle_plan.jsp&amp;action=edit&amp;back=true&amp;cvePlan=3133&amp;urlAdmin=plan/planes_generales.jsp&amp;indiceCar=2&amp;cveCaractVar=10151&amp;destino=M&amp;cveEntidad=3133&amp;cvePlantilla=&amp;search=&amp;frase=&amp;descEntidad=&amp;descPlantilla=&amp;typeSearch=">(mencionar
                                                                        los modulos vigentes, consultar intranet)</a> Este modulo tiene un costo adicional
                                                                        a la renta mensual de su plan.
                                                                    </p>
                                                                    <p>
                                                                        Dese la oportunidad de contar con este magnifico plan.<br>
                                                                        Le gustaria que dieramos de alta el plan?,  Pasamos a la captura de sus datos? De
                                                                        acuerdo?
                                                                    </p>
                                                                </div>
                                                            
	                                        </div>
                                            
                                            <div id="objection4Header" class="bg-info" onclick="javascript: showObjection(4)">
		
                                            <a>Las facturas siempre son mas altas de lo que me dicen</a>
                                                            
	                                    </div>
                                            <div id="objection4Content" class="bg-warning" style="display:none;">
		
                                            <div style="text-align: justify; color: #666; font-size: 10pt;">
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 1:</b> Como se
                                                    lo mencionamos anteriormente el plan es complemente controlado, las facturas no
                                                    sobrepasaran el costo del plan, si usted se termina las bosas, podra realizar recargas
                                                    para continuar con su servicio para continuar comunicado y con tarifas exclusivas
                                                    hasta que se le asigne sus nuevas bolsas, lo cual le asegura que siempre pagara
                                                    el mismo monto mes con mes.
                                                </p>
                                                <p>
                                                    <b style="color: darkblue; text-decoration: underline;">Objecion 2:</b> Por esta
                                                    misma razon Movistar creo este plan ya que al ser controlado usted no pagara costos
                                                    adicionales mas que la renta del plan de 
                                                                       
                                                    <span id="AccordionPane9_content_lbl_Renta7" style="color:Green;">199</span>. Permitiendole
                                                    gozar de una mayor
                                                    comunicacion con un costo completamente a su alcance.
                                                </p>
                                                <p>
                                                    Dese la oportunidad de contar con este magnifico plan.<br>
                                                    Le gustaria que dieramos de alta el plan? Pasamos a la captura de sus datos?, De
                                                    acuerdo?

                                                                        
                                                </p>
                                            </div>
                                                            
	                                    </div>
                                             <br />
                                            
                                            <select id='approvePlanSelect' name='approvePlanSelect' class='form-control' onchange="javascript: approvePlanSelectFunction()" required>
                                                <option value=''>Selecciona</option>
                                                <option value='Rechazo la oferta'>Rechazo la oferta</option>
                                                <option value='Lo pensara'>Lo pensara</option>
                                            </select><asp:HiddenField runat="server" ID="hdf_approvePlanSelect" /><br />
                                            <div id="motivosDiv" class="bg-warning" style="display:none;">
                                                <select name="ddl_Motivos" id="ddl_Motivos" class='form-control' required>
	                                                <option selected="selected" value=''>[Motivos de no aceptacion]</option>
	                                                <option value="La renta del plan es alta">La renta del plan es alta</option>
	                                                <option value="No quiere un compromiso mensual">No quiere un compromiso mensual</option>
	                                                <option value="No quiero perder mis beneficios en prepago">No quiero perder mis beneficios en prepago</option>
	                                                <option value="Desconfia de la llamada">Desconfia de la llamada</option>
	                                                <option value="No tengo ese consumo promedio">No tengo ese consumo promedio</option>
	                                                <option value="Utiliza otra linea">Utiliza otra linea</option>
                                                </select><asp:HiddenField runat="server" ID="hdf_ddl_Motivos" /><br />

                                                <select name="ddl_SubMotivos" id="ddl_SubMotivos" class='form-control'>
	                                                <option selected="selected" value=''>[Seleccione SubMotivo]</option>
	                                                <option value="Aplicaciones Ilimitadas">Aplicaciones Ilimitadas</option>
	                                                <option value="LDI">LDI</option>
	                                                <option value="Doble tiempo aire en todas las recargas">Doble tiempo aire en todas las recargas</option>
	                                                <option value="Numeros Gratis">Numeros Gratis</option>
                                                </select><asp:HiddenField runat="server" ID="hdf_ddl_SubMotivos" />
                                            </div>
                                                <br />
                                            <label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label><br /><br />
                                        </div>
                                        <div id="callLater2Div" style="display:none;">
                                            <input  type="date" id="preg_2_Dia" required /><asp:HiddenField runat="server" ID="hdf_preg_2_Dia" />
                                            <input  type="time" id ="preg_2_Hora" required /><asp:HiddenField runat="server" ID="hdf_preg_2_hora" /><br />
                                            <label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label>
                                            <br />
                                        </div> 
                                        <div id="acceptDiv" style="display:none;">
                                         <label for="myname" class="">Sr. / Srita () a continuacion tomaremos sus datos para llevar a cabo el registro de la aceptacion de su plan</label><br />
                                            Cualquier duda en el trato y/o uso de sus datos personales le pedimos que consulte nuestro aviso de privacidad en <a href="http://www.movistar.com.mx/Legales-Aviso-de-privacidad"></a><br />
                                            <br />
                                            <button id="captureBtn" onclick="javascript: capture();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Capturar">
                                                <span aria-hidden="true" class="glyphicon glyphicon-briefcase"></span>Capturar
                                            </button> 
                                        <div id="captureDiv" style="display:none;">                                           
                                            <div id="Captura_Datos" class="css_captura" style="background-color: rgb(255, 255, 255); width: 80%; border-style: inset; border-color: black; position: fixed; z-index: 100001; left: 200px; top: 10px;">
	
                                        <div align="center" id="divCaptura">
                                            <br>
                                            <table width="85%">
                                                <tbody><tr>
                                                    <td>
                                                        <b><font color="#666666">Apellido Paterno: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Apellido Materno: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Nombres: </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <center>
                                                            <span id="Label19" style="color:Green;font-size:Large;"></span></center>
                                                        <input required name="Ap_Paterno" type="text" id="Ap_Paterno" size="25" style="text-transform: uppercase" />
                                                        <asp:HiddenField runat="server" ID="hdf_Ap_Paterno" />
                                                    </td>
                                                    <td>
                                                        <center>
                                                            <span id="Label20" style="color:Green;font-size:Large;"></span></center>
                                                        <input required name="Ap_Materno" type="text" id="Ap_Materno" size="25" style="text-transform: uppercase">
                                                        <asp:HiddenField runat="server" ID="hdf_Ap_Materno" />
                                                    </td>
                                                    <td>
                                                        <center>
                                                            <span id="lbl_Nombre_Comp" style="color:Green;font-size:Large;"></span></center>
                                                        <input required name="txt_Nombre_Completo" type="text" id="txt_Nombre_Completo" size="35" style="text-transform: uppercase">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Nombre_Completo" />
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <table width="85%">
                                                <tbody><tr>
                                                    <td align="left">
                                                        <center>
                                                            <span id="lbl_RFC_Captura" style="color:Green;font-size:Large;"></span></center>
                                                        <div id="UP_2">
                                                                <br>
                                                                <select name="ddl_dia_2" id="ddl_dia_2" required>
	                                                                <option selected="selected" value="">[dia]</option>
	                                                                <option value="01">01</option>
	                                                                <option value="02">02</option>
	                                                                <option value="03">03</option>
	                                                                <option value="04">04</option>
	                                                                <option value="05">05</option>
	                                                                <option value="06">06</option>
	                                                                <option value="07">07</option>
	                                                                <option value="08">08</option>
	                                                                <option value="09">09</option>
	                                                                <option value="10">10</option>
	                                                                <option value="11">11</option>
	                                                                <option value="12">12</option>
	                                                                <option value="13">13</option>
	                                                                <option value="14">14</option>
	                                                                <option value="15">15</option>
	                                                                <option value="16">16</option>
	                                                                <option value="17">17</option>
	                                                                <option value="18">18</option>
	                                                                <option value="19">19</option>
	                                                                <option value="20">20</option>
	                                                                <option value="21">21</option>
	                                                                <option value="22">22</option>
	                                                                <option value="23">23</option>
	                                                                <option value="24">24</option>
	                                                                <option value="25">25</option>
	                                                                <option value="26">26</option>
	                                                                <option value="27">27</option>
	                                                                <option value="28">28</option>
	                                                                <option value="29">29</option>
	                                                                <option value="30">30</option>
	                                                                <option value="31">31</option>

                                                                </select>
                                                                <select name="ddl_mes_2" id="ddl_mes_2" required>
	                                                                <option selected="selected" value="">[mes]</option>
	                                                                <option value="01">01</option>
	                                                                <option value="02">02</option>
	                                                                <option value="03">03</option>
	                                                                <option value="04">04</option>
	                                                                <option value="05">05</option>
	                                                                <option value="06">06</option>
	                                                                <option value="07">07</option>
	                                                                <option value="08">08</option>
	                                                                <option value="09">09</option>
	                                                                <option value="10">10</option>
	                                                                <option value="11">11</option>
	                                                                <option value="12">12</option>

                                                                </select>
                                                                <select name="ddl_ano_2" id="ddl_ano_2" required>
	                                                                <option selected="selected" value="">[año]</option>
	                                                                <option value="1920">1920</option>
	                                                                <option value="1921">1921</option>
	                                                                <option value="1922">1922</option>
	                                                                <option value="1923">1923</option>
	                                                                <option value="1924">1924</option>
	                                                                <option value="1925">1925</option>
	                                                                <option value="1926">1926</option>
	                                                                <option value="1927">1927</option>
	                                                                <option value="1928">1928</option>
	                                                                <option value="1929">1929</option>
	                                                                <option value="1930">1930</option>
	                                                                <option value="1931">1931</option>
	                                                                <option value="1932">1932</option>
	                                                                <option value="1933">1933</option>
	                                                                <option value="1934">1934</option>
	                                                                <option value="1935">1935</option>
	                                                                <option value="1936">1936</option>
	                                                                <option value="1937">1937</option>
	                                                                <option value="1938">1938</option>
	                                                                <option value="1939">1939</option>
	                                                                <option value="1940">1940</option>
	                                                                <option value="1941">1941</option>
	                                                                <option value="1942">1942</option>
	                                                                <option value="1943">1943</option>
	                                                                <option value="1944">1944</option>
	                                                                <option value="1945">1945</option>
	                                                                <option value="1946">1946</option>
	                                                                <option value="1947">1947</option>
	                                                                <option value="1948">1948</option>
	                                                                <option value="1949">1949</option>
	                                                                <option value="1950">1950</option>
	                                                                <option value="1951">1951</option>
	                                                                <option value="1952">1952</option>
	                                                                <option value="1953">1953</option>
	                                                                <option value="1954">1954</option>
	                                                                <option value="1955">1955</option>
	                                                                <option value="1956">1956</option>
	                                                                <option value="1957">1957</option>
	                                                                <option value="1958">1958</option>
	                                                                <option value="1959">1959</option>
	                                                                <option value="1960">1960</option>
	                                                                <option value="1961">1961</option>
	                                                                <option value="1962">1962</option>
	                                                                <option value="1963">1963</option>
	                                                                <option value="1964">1964</option>
	                                                                <option value="1965">1965</option>
	                                                                <option value="1966">1966</option>
	                                                                <option value="1967">1967</option>
	                                                                <option value="1968">1968</option>
	                                                                <option value="1969">1969</option>
	                                                                <option value="1970">1970</option>
	                                                                <option value="1971">1971</option>
	                                                                <option value="1972">1972</option>
	                                                                <option value="1973">1973</option>
	                                                                <option value="1974">1974</option>
	                                                                <option value="1975">1975</option>
	                                                                <option value="1976">1976</option>
	                                                                <option value="1977">1977</option>
	                                                                <option value="1978">1978</option>
	                                                                <option value="1979">1979</option>
	                                                                <option value="1980">1980</option>
	                                                                <option value="1981">1981</option>
	                                                                <option value="1982">1982</option>
	                                                                <option value="1983">1983</option>
	                                                                <option value="1984">1984</option>
	                                                                <option value="1985">1985</option>
	                                                                <option value="1986">1986</option>
	                                                                <option value="1987">1987</option>
	                                                                <option value="1988">1988</option>
	                                                                <option value="1989">1989</option>
	                                                                <option value="1990">1990</option>
	                                                                <option value="1991">1991</option>
	                                                                <option value="1992">1992</option>
	                                                                <option value="1993">1993</option>
	                                                                <option value="1994">1994</option>
	                                                                <option value="1995">1995</option>
	                                                                <option value="1996">1996</option>
	                                                                <option value="1997">1997</option>
	                                                                <option value="1998">1998</option>
	                                                                <option value="1999">1999</option>
	                                                                <option value="2000">2000</option>
	                                                                <option value="2001">2001</option>
	                                                                <option value="2002">2002</option>
	                                                                <option value="2003">2003</option>
	                                                                <option value="2004">2004</option>
	                                                                <option value="2005">2005</option>
	                                                                <option value="2006">2006</option>
	                                                                <option value="2007">2007</option>
	                                                                <option value="2008">2008</option>
	                                                                <option value="2009">2009</option>
	                                                                <option value="2010">2010</option>
	                                                                <option value="2011">2011</option>
	                                                                <option value="2012">2012</option>
	                                                                <option value="2013">2013</option>

                                                                </select>
                                                                <asp:HiddenField runat="server" ID="hdf_fech_nac" />
                                                                &nbsp;
                                                                <button id="btn_Canlcular" onclick="javascript: Calcular();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Calcular Edad">
                                                                    <span aria-hidden="true" class="glyphicon glyphicon-barcode"></span>Calcular Edad
                                                                </button>
                                                                <span id="lbl_Edad_2" style="color:Green;"></span></b>
                                                            </div>
                                                    </td>
                                                    <td style="width: 250px;">
                                                        <b><font color="#666666">RFC: </font></b>
                                                        <br>
                                                    
                                                        <input required name="txt_RFC" type="text" maxlength="13" id="txt_RFC" size="13" style="text-transform: uppercase">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_RFC" />
                                                        <br>
                                                        <span id="re6" style="color:Red;visibility:hidden;">RFC Incompleto</span>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                            <%--<br>
                                            <table width="85%">
                                                <tbody><tr>
                                                    <td align="left">4. Cual es su ocupacion actualmente?
                                                        <span id="Label3" style="color:Green;">(Nota: si el cliente desconfia de la llamada, se le mencionara que es para seguridad de su linea).</span><br>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <select name="ddl_p4" id="ddl_p4" required>
		                                                    <option value="">[Selecionar]</option>
		                                                    <option value="Estudiante">Estudiante</option>
		                                                    <option value="Hogar">Hogar</option>
		                                                    <option value="Empleado">Empleado</option>
		                                                    <option value="Desempleado">Desempleado</option>
		                                                    <option value="Negocio propio">Negocio propio</option>
		                                                    <option value="Comerciante">Comerciante</option>

	                                                    </select>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                                        <%--<asp:HiddenField runat="server" ID="hdf_ddl_p4" />--%>
                                                    <%--</td>
                                                </tr>
                                            </tbody></table>--%>
                                            <table width="85%">
                                                <tbody><tr>
                                                
                                                    <td>
                                                        <b><font color="#666666">Sexo: </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                
                                                    <td>
                                                        <select name="ddl_Sexo" id="ddl_Sexo"  required>
		                                                    <option value="">[Sexo]</option>
		                                                    <option value="Femenino">Femenino</option>
		                                                    <option value="Masculino">Masculino</option>

	                                                    </select>
                                                        <asp:HiddenField runat="server" ID="hdf_ddl_Sexo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <font color="#4C71A6">Al generar el RFC es necesario copiar y pegarlo en el SAR para
                                                            descartar vetos en SCL o Morosidad, en caso de que sea moroso o tenga un veto en
                                                            <br>
                                                            SCL no es posible continuar con la encuesta</font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b><font color="#666666">Calle: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Numero externo: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Numero interno: </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input name="txt_Calle" type="text" maxlength="50" id="txt_Calle" size="26" style="text-transform: uppercase" required>
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Calle" />
                                                    
                                                    </td>
                                                    <td>
                                                        <input  name="txt_Num_Externo" type="number" maxlength="10" id="txt_Num_Externo" size="10"  required>
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Num_Externo" />
                                                    
                                                    </td>
                                                    <td>
                                                        <input  name="txt_Num_Interno" type="number" maxlength="10" id="txt_Num_Interno" size="10">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Num_Interno" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b><font color="#666666">CP: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Ciudad: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Estado: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Colonia: </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input  name="txt_CP" type="number" maxlength="5" id="txt_CP" size="5" required>
                                                        <asp:HiddenField runat="server" ID="hdf_txt_CP" />
                                                        <br>                                                    
                                                    </td>
                                                    <td>
                                                        <input  required name="txt_Ciudad" type="text" maxlength="50" id="txt_Ciudad" size="26" style="text-transform: uppercase">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Ciudad" />
                                                    </td>
                                                    <td>
                                                        <input required name="txt_Estado" type="text" maxlength="50" id="txt_Estado" size="26" style="text-transform: uppercase">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Estado" />
                                                    
                                                    </td>
                                                    <td>
                                                        <input required name="txt_Colonia" type="text" maxlength="150" id="txt_Colonia" size="26">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Colonia" />                                                    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b><font color="#666666">Municipio: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Telefono de contacto fijo: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Telefono de contacto movil: </font></b>
                                                    </td>
                                                    <td>
                                                        <b><font color="#666666">Correo electronico: </font>
                                                            <select id="ddlMailSwitch" onchange="SwitchMailField(this.value);">
                                                                <option value="Si">Si</option>
                                                                <option value="No" selected="selected">No</option>
                                                            </select>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input required name="txt_Municipio" type="text" maxlength="150" id="txt_Municipio" size="26">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Municipio" />
                                                    
                                                    </td>
                                                    <td>
                                                        <input  required name="txt_Tel_Fijo" type="number" maxlength="10" id="txt_Tel_Fijo" size="10">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Tel_Fijo" />
                                                    </td>
                                                    <td>
                                                        <input  required name="txt_Tel_Movil" type="number" maxlength="10" id="txt_Tel_Movil" size="10">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Tel_Movil" />                                                    
                                                    </td>
                                                    <td>
                                                        <input name="txt_Mail" type="email" maxlength="50" id="txt_Mail" size="26" style="text-transform: uppercase; display: none;">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Mail" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">

                                                        <b><font color="#008000">Las prioridades del numero de contacto son: · Casa u Oficina
                                                            · Familiar · El numero al que mas llama (Fijo o Celular)</font></b>
                                                    </td>
                                                    <td colspan="2">

                                                        <b><font color="red">Para asegurar la correcta recepcion de su factura me podria repetir nuevamente su correo electronico por favor: 
                                                        </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <div id="txtDiv" style="width: 100%; filter: glow(color=#333333, strength=2, enabled=1)">
                                                            <h5>
                                                                <label id="lblMsjError" class="lblMsjError">
                                                                </label>
                                                            </h5>
                                                        </div>
                                                    </td>
                                                </tr>
                                            
                                            </tbody></table>
                                            <center>
                                                <button id="btn_Aceptar" onclick="javascript: Aceptar();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Capturar" type="submit">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-book"></span>Capturar
                                                </button>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button id="btn_Cancelar" onclick="javascript: Cancelar();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Cancelar">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-book"></span>Cancelar
                                                </button>
                                            </center>
                                        </div>
                                
                                        </div>
                                            </div><br /><br />
                                        <div id="scoringDiv" style="display:none;">
                                            <input type="radio" name="approveScoring" id="approveScoring" value="Acepta consulta scoring" onclick="javascript: approveScoringFunction(this.value)" /> Acepta consulta scoring<br>
                                            <input type="radio" name="approveScoring" id="approveScoring" value="No acepta consulta scoring" onclick="javascript: approveScoringFunction(this.value)" /> No acepta consulta scoring<br />
                                            <asp:HiddenField runat="server" ID="hdf_approveScoring" />
                                            <div id="rejectScoringDiv" style="display:none;"><br />
                                                <label class="alert-danger">
                                                Sr. / Srita. (), le comento que para que usted pueda contar con esta oferta debe realizarse la consulta de scoring crediticio de lo contrario no es posible asignarla a su linea, le agradecemos su preferencia y lo invitamos a seguir gozando de los beneficio que MoviStar tiene para Usted.
                                                </label><br />
                                            </div><br />
                                            <div id="acceptScoringDiv" style="display:none;">
                                                <label class="alert-info">
                                                Sr. / Srita. para realizar la activacion de su plan, le enviaremos un mensaje de texto al cual debe de contestar con la palabra "ACEPTO", de lo contrario no podra gozar de los beneficios antes mencionados, este mensaje no le genera ningun costo. 
                                                </label><br />
                                                <label class="text-danger">
                                                Nota: El envio del SMS debera realizarse a la marcacion 3000. 
                                                </label>
                                                <br />
                                                <br />
                                                <table>
                                                    <tr>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Moroso" onclick="javascript: customerTypeFunction(this.value)" /> Moroso</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Vetado" onclick="javascript: customerTypeFunction(this.value)" /> Vetado</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Menor de 18 años/Mayor 70 años" onclick="javascript: customerTypeFunction(this.value)" /> Menor de 18 años/Mayor 70 años</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Datos correctos" onclick="javascript: customerTypeFunction(this.value)" /> Datos correctos</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Direccion no valida" onclick="javascript: customerTypeFunction(this.value)" /> Direccion no valida</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="No Aprobo consulta de Scoring" onclick="javascript: customerTypeFunction(this.value)" /> No Aprobo consulta de Scoring</td>
                                                        <asp:HiddenField runat="server" ID="hdf_customerType" />
                                                    </tr>
                                                </table><br />
                                                <div id="customerTypeDivMoroso" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr./Srita () le comento que usted presenta un adeudo de $____; le invito a llamar al *611 para verificar la aclaracion del mismo. En nombre de MoviStar le agradezco su tiempo, le recuerdo que estamos a sus ordenes las 24 hrs. de los 365 dias en el *611. Le atendio _______.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivVetado" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr./Srita () le comento que usted presenta un veto le invito a llamar al *611 para verificar la aclaracion del mismo. En nombre de MoviStar le agradezco su tiempo, le recuerdo que estamos a sus ordenes las 24 hrs. de los 365 dias en el *611. Le atendio _______.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivMenor" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr./Srita () le comento que la oferta que estamos manejando es solamente para personas mayores de 25 años y menores o iguales a 70 años, por lo cual en esta ocasion no podemos continuar con el proceso, sin embargo nos estaremos comunicando posteriormente para ofrecerle mas beneficios que apliquen a su linea, por lo que en su caso la mejor opcion es continuar disfrutando de nuestras promociones de prepago. A nombre de Movistar agradecemos su tiempo. Le recordamos que estamos a sus ordenes las 24 hrs. de los 365 dias del año en *611.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivCorrecto" style="display:none;">
                                                    <label class="alert-info">
                                                        Le confirmo que los beneficios de su plan los recibira los dias xxx de cada mes y en caso de que consuma la bolsa de datos que incluye el plan podra realizar recargas para continuar su servicio.<br />
                                                        Me puede confirmar si tiene alguna consulta de sus beneficios o las formas de pago? (esperar respuesta de cliente y reforzar dato) <br />
                                                        Le recordamos que para cualquier duda  o consulta sobre su pago puede marcar el *PAGO (7246) SIN COSTO. Aca podra realizar las siguientes consultas.<br /><br />
                                                        Informacion sobre los establecimientos y bancos para efectuar sus pagos: Pago en linea, Puede solicitar Domiciliar los pagos de facturas.<br /><br />
                                                        Por ultimo le informo que de 3  a 24 Horas, nos estaremos comunicando nuevamente con usted para confirmarle la activacion de su plan.<br /><br />
                                                        En caso de no contactarle no podremos activarle su nuevo plan y por tanto no podra disfrutar de todos los beneficios mencionados.<br /><br />                                                        
                                                        </label><br />
                                                    ¿Cliente desea que se le marque en un horario en especifico para la activacion del plan?  <br />
                                                        <table>
                                                            <tr>
                                                                <td><input type="radio" name="callTime" id="callTime" value="Si" onclick="javascript: callTimeFunction(this.value)" /> Si</td>
                                                                <td><input type="radio" name="callTime" id="callTime" value="No" onclick="javascript: callTimeFunction(this.value)" /> No</td>
                                                                <asp:HiddenField runat="server" ID="hdf_callTime" />
                                                            </tr>
                                                        </table><br />
                                                        <div id="callTime3" style="display:none;">                                                            
                                                            <label class="alert-info">
                                                            En que horario le gustaria que nos comunicaramos para realizar la activacion de su plan?<br />
                                                            </label><br />     
                                                            <table>
                                                                <tr>
                                                                    <input  type="date" id="preg_3_Dia" required /><asp:HiddenField runat="server" ID="hdf_preg_3_Dia" />
                                                                    <input  type="time" id ="preg_3_Hora" required /><asp:HiddenField runat="server" ID="hdf_preg_3_Hora" />
                                                                </tr>
                                                            </table><br />   
                                                        </div>
                                                         <select id='acceptMigration' name='acceptMigration' class='form-control' required>
                                                            <option value=''>Selecciona</option>
                                                            <option value='Acepta Migracion'>Acepta Migracion</option>
                                                        </select><asp:HiddenField runat="server" ID="hdf_acceptMigration" />                                                                                               
                                                    </div>
                                                <div id="customerTypeDivDireccion" style="display:none;">
                                                    <label class="alert-danger">
                                                        Estimado cliente (), en este caso no puedo continuar con la activacion del plan por no contar con una direccion valida ni tampoco alterna. Le recuerdo que seguimos a sus ordenes en el *611 las 24h de los 365 dias. Mi nombre es ______________, que tenga un excelente dia/tarde/noche.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivScoring" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr. / Srita. (), le comento que de acuerdo a los resultados del scoring crediticio realizado, el sistema no me permite con continuar, le agradecemos su preferencia y posteriormente nos estaremos comunicando para brindarle nuevos y mejores beneficios que Movistar tiene para Usted.
                                                        </label><br />
                                                    </div>
                                            </div>
                                        </div>
                                      </div>
                                        <br />          
                                </div>                          
                                </div>          
                                    <asp:LinkButton runat="server" Visible="false" ID="newuser2" OnClick="submitRecord" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Guardar" OnClientClick="return validateFields();">
                                        <span aria-hidden="true" class="glyphicon glyphicon-check"></span>Guardar
                                    </asp:LinkButton><p id="validForm" class="text-danger"></p>                                              
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
            var valid = true;
            if (phone.value == "")
            {
                document.getElementById("validForm1").innerHTML = "Captura un DN valido.";
                valid = false;
            }            
            if (Divq1.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_q1.ClientID %>').value == "")
            {
                valid = false;
            }
            if (reasonq1divYes.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_q3.ClientID %>').value == "")
            {
                valid = false;
            }
            if (deviceDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_qDevice.ClientID %>').value == "")
            {
                valid = false;
            }
            if (planDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_approvePlan.ClientID %>').value == "")
            {
                valid = false;
            }
            if (acceptPlanDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_approvePlan2.ClientID %>').value == "")
            {
                valid = false;
            }
            if (scoringDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_approveScoring.ClientID %>').value == "")
            {
                valid = false;
            }
            if (acceptScoringDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_customerType.ClientID %>').value == "")
            {
                valid = false;
            }
            if (customerTypeDivCorrecto.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_callTime.ClientID %>').value == "")
            {
                valid = false;
            }

            if (!valid)
            {
                document.getElementById("validForm").innerHTML = "Selecciona todas las opciones visibles";
                return valid;
            }

            if (age.value == "")
            {
                if (ddl_dia_2.value != "" && ddl_mes_2.value != "" && ddl_ano_2.value != "") {
                    var birthday = ddl_mes_2.value + "/" + ddl_dia_2.value + "/" + ddl_ano_2.value;
                    var ageDifMs = Date.now() - new Date(birthday).getTime();
                    var ageDate = new Date(ageDifMs); // miliseconds from epoch
                    age.value = Math.abs(ageDate.getUTCFullYear() - 1970);
                }
            }
            document.getElementById('<%= hdf_reasonq1.ClientID %>').value = reasonq1.value;
            document.getElementById('<%= hdf_phone.ClientID %>').value = phone.value;
            document.getElementById('<%= hdf_preg_1_Dia.ClientID %>').value = preg_1_Dia.value;
            document.getElementById('<%= hdf_preg_1_Hora.ClientID %>').value = preg_1_Hora.value;
            document.getElementById('<%= hdf_myaddname.ClientID %>').value = myaddname.value;
            document.getElementById('<%= hdf_age.ClientID %>').value = age.value;
            document.getElementById('<%= hdf_planSelect.ClientID %>').value = planSelect.value;
            document.getElementById('<%= hdf_preg_2_Dia.ClientID %>').value = preg_2_Dia.value;
            document.getElementById('<%= hdf_preg_2_hora.ClientID %>').value = preg_2_Hora.value;
            document.getElementById('<%= hdf_preg_3_Dia.ClientID %>').value = preg_3_Dia.value;
            document.getElementById('<%= hdf_preg_3_Hora.ClientID %>').value = preg_3_Hora.value;
            document.getElementById('<%= hdf_acceptMigration.ClientID %>').value = acceptMigration.value; 
            document.getElementById('<%= hdf_ddl_Motivos.ClientID %>').value = ddl_Motivos.value; 
            document.getElementById('<%= hdf_ddl_SubMotivos.ClientID %>').value = ddl_SubMotivos.value; 
            document.getElementById('<%= hdf_txt_RFC.ClientID %>').value = txt_RFC.value;
            document.getElementById('<%= hdf_approvePlanSelect.ClientID %>').value = approvePlanSelect.value; 
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
                                document.getElementById("validForm").innerHTML = "Selecciona todas las opciones visibles";
                                return false;                                
                            }
                        }
                        descendents = divs[i].getElementsByTagName("select");
                        for (var j = 0; j < descendents.length; ++j) {
                            e = descendents[j];
                            if (e.required && e.value == "") {
                                document.getElementById("validForm").innerHTML = "Selecciona todas las opciones visibles";
                                return false;
                            }
                        }
                    }
                }
            }
            return true;
        }

        function newreg() {

            __doPostBack("newreg", "dummy");
        }

        function capture()
        {            
            document.getElementById("captureDiv").style = "display:block;";
        }

        function showObjection(x) {
            switch (x) {
                case 1:
                    document.getElementById("objection1Content").style = "display:block;";
                    document.getElementById("objection2Content").style = "display:none;";
                    document.getElementById("objection3Content").style = "display:none;";
                    document.getElementById("objection4Content").style = "display:none;";
                    break;
                case 2:
                    document.getElementById("objection1Content").style = "display:none;";
                    document.getElementById("objection2Content").style = "display:block;";
                    document.getElementById("objection3Content").style = "display:none;";
                    document.getElementById("objection4Content").style = "display:none;";
                    break;
                case 3:
                    document.getElementById("objection1Content").style = "display:none;";
                    document.getElementById("objection2Content").style = "display:none;";
                    document.getElementById("objection3Content").style = "display:block;";
                    document.getElementById("objection4Content").style = "display:none;";
                    break;
                case 4:
                    document.getElementById("objection1Content").style = "display:none;";
                    document.getElementById("objection2Content").style = "display:none;";
                    document.getElementById("objection3Content").style = "display:none;";
                    document.getElementById("objection4Content").style = "display:block;";
                    break;
                default:
                    document.getElementById("objection1Content").style = "display:none;";
                    document.getElementById("objection2Content").style = "display:none;";
                    document.getElementById("objection3Content").style = "display:none;";
                    document.getElementById("objection4Content").style = "display:none;";
                    break;
            }
        }

        function planselectFunction() {
            var x = document.getElementById("planSelect").value;            
            var plan = document.getElementById("planSelect");
            document.getElementById("planLbl").innerHTML = plan.options[plan.selectedIndex].text;
            document.getElementById("planLbl2").innerHTML = plan.options[plan.selectedIndex].text;
            switch (x)
            {
                case "KEM":
                    document.getElementById("planKEMDiv").style = "display:block;";
                    document.getElementById("planKELDiv").style = "display:none;";
                    document.getElementById("planKEFDiv").style = "display:none;";
                    document.getElementById("planKEGDiv").style = "display:none;";
                    lbl_renta_ini2.innerHTML = "149";
                    break;
                case "KEL":
                    document.getElementById("planKEMDiv").style = "display:none;";
                    document.getElementById("planKELDiv").style = "display:block;";
                    document.getElementById("planKEFDiv").style = "display:none;";
                    document.getElementById("planKEGDiv").style = "display:none;";
                    lbl_renta_ini2.innerHTML = "219";
                    break;
                case "KEF":
                    document.getElementById("planKEMDiv").style = "display:none;";
                    document.getElementById("planKELDiv").style = "display:none;";
                    document.getElementById("planKEFDiv").style = "display:block;";
                    document.getElementById("planKEGDiv").style = "display:none;";
                    lbl_renta_ini2.innerHTML = "349";
                    break;
                case "KEG":
                    document.getElementById("planKEMDiv").style = "display:none;";
                    document.getElementById("planKELDiv").style = "display:none;";
                    document.getElementById("planKEFDiv").style = "display:none;";
                    document.getElementById("planKEGDiv").style = "display:block;";
                    lbl_renta_ini2.innerHTML = "449";
                    break;
                default:
                    document.getElementById("planKEMDiv").style = "display:none;";
                    document.getElementById("planKELDiv").style = "display:none;";
                    document.getElementById("planKEFDiv").style = "display:none;";
                    document.getElementById("planKEGDiv").style = "display:none;";
                    break;
            }
        }

        function q1function(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No")
            {
                document.getElementById("reasonq1div").style = "display:block;";
                document.getElementById("reasonq1div2").style = "display:none;";
                document.getElementById("reasonq1divYes").style = "display:none;";
            }
            else if (answer == "Llamar despues")
            {
                document.getElementById("reasonq1div").style = "display:none;";
                document.getElementById("reasonq1div2").style = "display:block;";
                document.getElementById("reasonq1divYes").style = "display:none;";
            }
            else
            {
                document.getElementById("reasonq1divYes").style = "display:block;";
                document.getElementById("reasonq1div").style = "display:none;";
                document.getElementById("reasonq1div2").style = "display:none;";
            }
            document.getElementById('<%= hdf_q1.ClientID %>').value = answer;
        }

        function q3function(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No") {
                document.getElementById("ageDiv").style = "display:block;";
                document.getElementById("deviceDiv").style = "display:none;";
                document.getElementById("planDiv").style = "display:none;";
            }
            else 
            {
                var inpObj = document.getElementById("myaddname");
                if (inpObj.checkValidity() == false) 
                {
                    document.getElementById("demo").innerHTML = inpObj.validationMessage;
                    document.getElementById('q3').checked = false;
                }
                else
                {
                    document.getElementById("demo").innerHTML ="";
                    document.getElementById("ageDiv").style = "display:none;";
                    document.getElementById("deviceDiv").style = "display:block;";
                }
            }
            document.getElementById('<%= hdf_q3.ClientID %>').value = answer; 
        }

        function qDevicefunction(answer) {
            document.getElementById("validForm").innerHTML = "";
            //if (answer == "Si") {
                document.getElementById("planDiv").style = "display:block;";
            //}
            //else {
            //    document.getElementById("planDiv").style = "display:none;";
            //}
            document.getElementById('<%= hdf_qDevice.ClientID %>').value = answer; 
        }

        function searchDNfunction() {
            document.getElementById('<%= hdf_phone.ClientID %>').value = phone.value;  
            var inpObj = document.getElementById("phone");
            if (inpObj.checkValidity()) {
                
                document.getElementById("Divq1").style = "display:block;";
                document.getElementById("validForm").innerHTML = "";
            }
            else {
                document.getElementById("validForm1").innerHTML = "Captura un DN";
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
                document.getElementById("acceptPlanDiv").style = "display:none;";
            }
            else if (answer == "Llamar despues")
            {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:block;";
                document.getElementById("acceptPlanDiv").style = "display:none;";
                
            }
            else {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptPlanDiv").style = "display:block;";                
            }
            document.getElementById('<%= hdf_approvePlan.ClientID %>').value = answer;
        } 

        function approvePlanfunction2(answer) {
            document.getElementById('<%= hdf_approvePlan2.ClientID %>').value = answer; 
            document.getElementById("validForm").innerHTML = "";
            document.getElementById("captureDiv").style = "display:none;";
            if (answer == "No") {
                document.getElementById("objectionDiv").style = "display:block;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:none;";
            }
            else if (answer == "Llamar despues") {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:block;";
                document.getElementById("acceptDiv").style = "display:none;";

            }
            else {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:block;";
            }
        }

        function updatereg(id) {
            var myvalue = document.getElementById("savedata").value;
            if (myvalue != "") {
                __doPostBack("updatereg", id + "^" + myvalue);
            } else {
                alert("El campo es requerido");
            }
        }

        function recycle() {
            var reuse = window.confirm("¿Desea Reciclar los registros no capturados?\nNota: Solo si existen sin capturar");
            if (reuse == true) {
                __doPostBack("recycle", "dummy");
            }
        }


        function findreg() {
            var dn = document.getElementById("search").value;
            if (dn != "") {
                __doPostBack("findreg", dn);
            } else {
                alert("El campo es requerido");
            }
        }

        function Cancelar() {
            document.getElementById("captureDiv").style = "display:none;";

            var objs = divCaptura.getElementsByTagName("input");
            for (var j = 0; j < objs.length; ++j) {
                e = objs[j];
                e.value = "";
            }
            objs = divCaptura.getElementsByTagName("select");
            for (var j = 0; j < objs.length; ++j) {
                e = objs[j];
                e.value = "";
            }            
        }

        function Aceptar() 
        {
            
            var inpObj = document.getElementById("txt_Mail");
            document.getElementById('<%= hdf_fech_nac.ClientID %>').value = ddl_dia_2.value + "/" + ddl_mes_2.value + "/"  + ddl_ano_2.value;
            if (inpObj.checkValidity() == false) 
            {
                document.getElementById("captureDiv").style = "display:block;";
            }
            else
            {
                document.getElementById("captureDiv").style = "display:none;";
                document.getElementById("scoringDiv").style = "display:block;";
            }
            var objs = divCaptura.getElementsByTagName("input");
            for (i = 0; i < objs.length; i++) {
                e = objs[i];
                if (e.type == "hidden") {
                    if (e.id != "body_hdf_fech_nac")
                    {
                        e.value = document.getElementById(e.id.replace("body_hdf_", "")).value;
                    }
                }
            }
        }


        $('#savedata').keypress(function (e) {
            var id = document.getElementById("rowid").value
            var myvalue = document.getElementById("savedata").value;

            if (e.which == 13) {
                if (myvalue != "") {
                    __doPostBack("updatereg", id + "^" + myvalue);
                } else {
                    alert("El campo es requerido");
                }
            }

        });

        function SwitchMailField(answer) {
            if (answer == "Si") {
                txt_Mail.required = true;
                document.getElementById("txt_Mail").style = "display:block;";
            }
            else {
                document.getElementById("txt_Mail").style = "display:none;";
                txt_Mail.required = false;
            }

        }

        function Calcular()
        {
            if (ddl_dia_2.value != "" && ddl_mes_2.value != "" && ddl_ano_2.value != "") {
                var birthday = ddl_mes_2.value + "/" + ddl_dia_2.value + "/" + ddl_ano_2.value;
                var ageDifMs = Date.now() - new Date(birthday).getTime();
                var ageDate = new Date(ageDifMs); // miliseconds from epoch
                lbl_Edad_2.innerHTML = Math.abs(ageDate.getUTCFullYear() - 1970);
            }
        }

        function approveScoringFunction(answer)
        {
            document.getElementById('<%= hdf_approveScoring.ClientID %>').value = answer; 
            if (answer == "Acepta consulta scoring") {
                document.getElementById("acceptScoringDiv").style = "display:block;";
                document.getElementById("rejectScoringDiv").style = "display:none;";
            }
            else {
                document.getElementById("acceptScoringDiv").style = "display:none;";
                document.getElementById("rejectScoringDiv").style = "display:block;";
            }
        }

        function customerTypeFunction(x) {
            document.getElementById('<%= hdf_customerType.ClientID %>').value = x; 
            document.getElementById("validForm").innerHTML = "";
            switch (x) {
                case "Moroso":
                    document.getElementById("customerTypeDivMoroso").style = "display:block;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
                case "Vetado":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:block;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
                case "Menor 25 años / Mayor 70 años":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:block;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
                case "Datos correctos":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:block;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
                case "Direccion no valida":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:block;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
                case "No Aprobo consulta de Scoring":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:block;";
                    break;
                default:
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivMenor").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    document.getElementById("customerTypeDivDireccion").style = "display:none;";
                    document.getElementById("customerTypeDivScoring").style = "display:none;";
                    break;
            }
        }

        function callTimeFunction(answer)
        {
            document.getElementById('<%= hdf_callTime.ClientID %>').value = answer; 
            document.getElementById("validForm").innerHTML = "";
            if (answer == "Si") {
                document.getElementById("callTime3").style = "display:block;";
            }
            else {
                document.getElementById("callTime3").style = "display:none;";
            }
        }

        function approvePlanSelectFunction()
        {
            ddl_Motivos.required = true;
            var x = document.getElementById("approvePlanSelect").value;
            if (x == "Rechazo la oferta") {
                document.getElementById("motivosDiv").style = "display:block;";
            }
            else {
                document.getElementById("motivosDiv").style = "display:none;";
            }
        }
        //]]>
    </script>


</asp:Content>

