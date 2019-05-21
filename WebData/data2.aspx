<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="True" CodeFile="data2.aspx.cs" Inherits="WebData.Data2" %>

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
                                        </asp:LinkButton><asp:HiddenField ID="activacionExistente" runat="server" />                                             
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
                                    <br /><div id="reasonq1div" style="display:none;">
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
                                    <br /><label for="phone">
                                                Buenos días/ tardes/noches tengo el gusto de comunicarme con <asp:Label ID="lblName" runat="server"></asp:Label><br />
                                                (pausa hasta la confirmación del cliente)<br />
                                                Mi nombre es __________ y le llamo de Movistar para confirmar sus datos y activar su nuevo plan. 
                                            </label><br />   
                                            <label class="alert-info">
                                                VALIDACIÓN
                                            </label> <br />     
                                            <label>
                                                • Le recuerdo que esta llamada está siendo grabada para efectos de calidad en el servicio y que tiene la misma validez jurídica que la firma de un contrato. <br />
                                                3. Según nuestros registros Usted aceptó el <asp:Label ID="lblFechaVenta" runat="server"></asp:Label> un cambio a un <asp:Label ID="lblPlan" runat="server"></asp:Label> con renta mensual de $<asp:Label ID="lblPrecio" runat="server"></asp:Label>
                                            </label><br />    
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Si" onclick="javascript: approvePlanfunction(this.value)" autofocus/> Si<br>
                                              <input type="radio" name="approvePlan" id="approvePlan" value="No" onclick="javascript: approvePlanfunction(this.value)" /> No<br />
                                              <input type="radio" name="approvePlan" id="approvePlan" value="Llamar despues" onclick="javascript: approvePlanfunction(this.value)"/> Llamar despu&eacute;s
                                        <br /><asp:HiddenField runat="server" ID="hdf_approvePlan" />                                     

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
                                                                       
                                                    <span id="AccordionPane9_content_lbl_Renta7" style="color:Green;"><asp:Label ID="lblPrecio2" runat="server"></asp:Label></span>. Permitiendole
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
                                                <option value='Venta Caida'>Venta Caída</option>
                                                <option value='Mala venta'>Mala venta</option>
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
                                                <br />
                                            <label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label><br /><br />
                                            </div>
                                        </div>
                                        <div id="callLater2Div" style="display:none;">
                                            <input  type="date" id="preg_2_Dia" required /><asp:HiddenField runat="server" ID="hdf_preg_2_Dia" />
                                            <input  type="time" id ="preg_2_Hora" required /><asp:HiddenField runat="server" ID="hdf_preg_2_hora" /><br />
                                            <label class="alert-danger">
                                            Sr./Srita () agradezco su atencion, le recuerdo que en MoviStar estamos a su disposicion las 24 hrs. de los 365 dias del año en el *611, le reitero mi nombre_________ que tenga buen dia.<br /></label>
                                            <br />
                                        </div> 
                                        <div id="acceptDiv" style="display:none;">
                                            <label for="myname" class="alert-info">ACTIVACIÓN</label><br /><br />
                                            <label for="myname" class="">
                                                Cualquier duda en el trato y/o uso de sus datos personales le pedimos que consulte nuestro aviso de privacidad en <a href="http://www.movistar.com.mx/Legales-Aviso-de-privacidad">http://www.movistar.com.mx/Legales-Aviso-de-privacidad</a>. <br /><br />
                                                Sr. / Srita <asp:Label ID="lblName2" runat="server"></asp:Label> necesito que me confirme mediante un "SI" sus datos, para la activación de su plan? 
                                            </label><br /><br />
                                            <button id="captureBtn" onclick="javascript: capture();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Capturar">
                                                <span aria-hidden="true" class="glyphicon glyphicon-briefcase"></span>Validar datos
                                            </button> 
                                        <div id="captureDiv" style="display:none;">                                           
                                            <div id="Captura_Datos" class="css_captura" style="background-color: rgb(255, 255, 255); width: 80%; border-style: inset; border-color: black; position: fixed; z-index: 100001; left: 200px; top: 10px;">
	
                                        <div align="center" id="divCaptura">
                                            <br>
                                            <table width="85%">
                                                <tbody><tr>
                                                    <td>
                                                        <b><font color="#666666">Nombre Completo: </font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <center>
                                                            <span id="Label19" style="color:Green;font-size:Large;"></span></center>
                                                        <input required name="NombreCompleto" type="text" id="NombreCompleto" size="25" style="text-transform: uppercase"/>
                                                        <asp:HiddenField runat="server" ID="hdf_NombreCompleto" />
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
                                                            </div>
                                                    </td>
                                                    <tr>
                                                    <td colspan="4">
                                                        <font color="#4C71A6">Al generar el RFC es necesario copiar y pegarlo en el SAR para
                                                            descartar vetos en SCL o Morosidad, en caso de que sea moroso o tenga un veto en
                                                            <br>
                                                            SCL no es posible continuar con la encuesta</font>
                                                    </td>
                                                </tr>
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
                                            <br>
                                            <table width="85%">
                                                <tbody><tr>
                                                    <td align="left">Equipo:
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <select name="ddl_equipo" id="ddl_equipo" required>
		                                                    <option value="Si">Si</option>
		                                                    <option value="No">No</option>

	                                                    </select>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HiddenField runat="server" ID="hdf_ddl_equipo" />
                                                    </td>
                                                </tr>
                                            </tbody></table>
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
                                                        <input name="txt_Mail" type="email" maxlength="50" id="txt_Mail" size="26" style="text-transform: uppercase;">
                                                        <asp:HiddenField runat="server" ID="hdf_txt_Mail" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">

                                                        <b><font color="#008000">Las prioridades del numero de contacto son: · Casa u Oficina
                                                            · Familiar · El numero al que mas llama (Fijo o Celular)</font></b>
                                                    </td>
                                                    <td colspan="2">

                                                        <b><font color="red">Le informamos que es necesario que nos brinde una cuenta de correo electrónico para que reciba su factura electrónica por este medio, de lo contrario únicamente la recibirá via SMS. 
                                                        </font></b>
                                                    </td>
                                                </tr>                                            
                                            </tbody></table>
                                            <center>
                                                <button id="btn_Aceptar" onclick="javascript: Aceptar();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Capturar" type="submit">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-book"></span>Capturar
                                                </button><asp:HiddenField runat="server" ID="hdf_cambio" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button id="btn_Cancelar" onclick="javascript: Cancelar();" class="btn  btn-success" data-toggle="tooltip" data-placement="bottom" title="Cancelar">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-book"></span>Cancelar
                                                </button>
                                            </center>
                                        </div>
                                
                                        </div>
                                            
                                    </div><br /><br />
                                        <div id="scoringDiv" style="display:none;">
                                                <label>
                                                A continuación procederé con la activación de su nuevo plan, permítame 2 minutos por favor.<br /><br />

                                                - Realizar la activación por SAR/SIGA <br />
                                                - Verificar morosidad, si el cliente presenta morosidad y/o veto, pasar a cierre cliente moroso 

                                                </label><br />
                                                <label>
                                                6. Tipo de cliente?
                                                </label>
                                                <br />
                                                <br />
                                                <table>
                                                    <tr>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Moroso" onclick="javascript: customerTypeFunction(this.value)" /> Moroso</td>
                                                        <td><input type="radio" name="customerType" id="customerType" value="Vetado" onclick="javascript: customerTypeFunction(this.value)" /> Vetado</td>                                                        
                                                        <td><input type="radio" name="customerType" id="customerType" value="Cliente cumple requisitos" onclick="javascript: customerTypeFunction(this.value)" /> Cliente cumple requisitos</td>                                                        
                                                        <asp:HiddenField runat="server" ID="hdf_customerType" />
                                                    </tr>
                                                </table><br />
                                                <div id="customerTypeDivMoroso" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr./Srita <asp:Label ID="lblName3" runat="server"></asp:Label> le comento que usted presenta un adeudo de $____; le invito a llamar al *611 para verificar la aclaracion del mismo. En nombre de MoviStar le agradezco su tiempo, le recuerdo que estamos a sus ordenes las 24 hrs. de los 365 dias en el *611. Le atendio _______.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivVetado" style="display:none;">
                                                    <label class="alert-danger">
                                                        Sr./Srita <asp:Label ID="lblName4" runat="server"></asp:Label> le comento que usted presenta un veto le invito a llamar al *611 para verificar la aclaracion del mismo. En nombre de MoviStar le agradezco su tiempo, le recuerdo que estamos a sus ordenes las 24 hrs. de los 365 dias en el *611. Le atendio _______.
                                                        </label><br />
                                                    </div>
                                                <div id="customerTypeDivCorrecto" style="display:none;">
                                                        7. Tipo de Activación?  <br />
                                                        <table>
                                                            <tr>
                                                                <td><input type="radio" name="callTime" id="tipoActivacion" value="Exitosa por SAR" onclick="javascript: tipoActivacionFunction(this.value)" /> Exitosa por SAR</td>
                                                                <td><input type="radio" name="callTime" id="tipoActivacion" value="No exitosa, SAR arroja error" onclick="javascript: tipoActivacionFunction(this.value)" /> No exitosa, SAR arroja error</td>
                                                                <asp:HiddenField runat="server" ID="hdf_tipoActivacion" />
                                                            </tr>
                                                        </table><br />
                                                        <div id="erroSarDiv" style="display:none;">
                                                            <div id="erroSarDivPlan3" style="display:none;">
                                                                <label>
                                                                    Error en SAR: <br /><br />
                                                                    Le confirmo que su plan Plan Movistar 3 ha sido activado exitosamente y se verá reflejado dentro de las 48 hrs. <br />
                                                                </label><br />     
                                                                <label class="alert-info">BIENVENIDA: </label>   <br /><br />
                                                                <label>
                                                                    <label class="alert-info">Le recuerdo los principales beneficios con los que cuenta su plan:</label> <br />

                                                                    •	Llamadas y SMS ilimitados para que hable sin restricciones a cualquier número fijo o móvil estando en México, EUA, Canadá y Puerto Rico, sin importar de que compañía sea.<br />
                                                                    •	4 GB para navegar en internet.<br />
                                                                    •	2 GB para Netflix.<br />
                                                                    •	Redes Sociales ilimitadas como lo son Facebook. Twiter, WhatsApp, Instagram, Snapchat y Uber.<br />
                                                                    •	Movistar PLAY incluido (se cobran de los 4GB)<br />
                                                                    •	Además puede utilizar todos estos beneficios estando en México, EUA, Canadá y Puerto Rico.<br />
                                                                    •	Tarifa Excedente de $0.70<br />
                                                                    <br />

                                                                    Solo por esta ocasión se le otorgaran sus beneficios el día de hoy y a partir del siguiente mes los días xxx de cada mes recibirá sus bolsas de minutos, sms y MB. <br /><br />
                                                                    En caso de consumir su bolsa podrá realizar recargas para continuar realizando llamadas, sms o navegar en Internet. <br /><br />
                                                                    Es importante recordarle que las recargas no pagan la renta del plan. Solamente mediante un pago bancario, con cargo a TDC o Debito o en alguno de los centros autorizados <a href="http://intranetclientes.movistar.com.mx/icl/login.html"></a> se podrá realizar el pago. <br /><br />
                                                                </label><br />     
                                                            </div>
                                                            <div id="erroSarDivPlan5" style="display:none;">
                                                                <label>
	                                                                Error en SAR: <br /><br />
	                                                                Le confirmo que su Vas a Volar 0.5 Canal ha sido activado exitosamente y se verá reflejado dentro de las 48 hrs. <br />
                                                                </label><br />     
                                                                <label class="alert-info">BIENVENIDA: </label>   <br /><br />
                                                                <label>
	                                                                <label class="alert-info">Le recuerdo los principales beneficios con los que cuenta su plan:</label> <br />

	                                                                •	Llamadas y SMS ilimitados para que hable sin restricciones a cualquier número fijo o móvil estando en México, EUA, Canadá y Puerto Rico, sin importar de que compañía sea.<br />
	                                                                •	2 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.<br />
	                                                                •	Además puede utilizar todos estos beneficios estando en México, EUA, Canadá y Puerto Rico.<br /><br />

	                                                                Solo por esta ocasión se le otorgaran sus beneficios el día de hoy y a partir del siguiente mes los días xxx de cada mes recibirá sus bolsas de minutos, sms y MB. <br /><br />
	                                                                En caso de consumir su bolsa podrá realizar recargas para continuar realizando llamadas, sms o navegar en Internet. <br /><br />
	                                                                Es importante recordarle que las recargas no pagan la renta del plan. Solamente mediante un pago bancario, con cargo a TDC o Debito o en alguno de los centros autorizados <a href="http://intranetclientes.movistar.com.mx/icl/login.html"></a> se podrá realizar el pago. <br /><br />
                                                                </label><br />
                                                            </div>
                                                            <label class="alert-info">BIENVENIDA: </label>   <br /><br />                                                                     
                                                             <select id='acceptMigration' name='acceptMigration' class='form-control' required>
                                                                <option value=''>Selecciona</option>
                                                                <option value='Activación con error en SAR SIGA /Seguimiento Citrix'>Activación con error en SAR SIGA /Seguimiento Citrix</option>    
                                                             </select>                                                                
                                                            </div>                                                            
                                                        <div id="correctoSarDiv" style="display:none;">                                                            
                                                            <div id="correctoSarDivPlan3" style="display:none;">
                                                                <label>
                                                                    Activación Exitosa: <br /><br />
                                                                    Le confirmo que su plan Movistar 3 ha sido activado exitosamente a partir de este momento. Le pedimos que en un lapso de 3 horas apague/prenda su celular para que comience a gozar de sus beneficios. <br />
                                                                </label><br />     
                                                                <label class="alert-info">BIENVENIDA: </label>   <br /><br />
                                                                <label>
                                                                    <label class="alert-info">Le recuerdo los principales beneficios con los que cuenta su plan:</label> <br /><br />

                                                                    •	Llamadas y SMS ilimitados para que hable sin restricciones a cualquier número fijo o móvil estando en México, EUA, Canadá y Puerto Rico, sin importar de que compañía sea.<br />
                                                                    •	4 GB para navegar en internet.<br />
                                                                    •	2 GB para Netflix.<br />
                                                                    •	Redes Sociales ilimitadas como lo son Facebook. Twiter, WhatsApp, Instagram, Snapchat y Uber.<br />
                                                                    •	Movistar PLAY incluido (se cobran de los 4GB)<br />
                                                                    •	Además puede utilizar todos estos beneficios estando en México, EUA, Canadá y Puerto Rico.<br />
                                                                    •	Tarifa Excedente de $0.70<br />
                                                                    <br />

                                                                    Solo por esta ocasión se le otorgaran sus beneficios el día de hoy y a partir del siguiente mes los días xxx de cada mes recibirá sus bolsas de minutos, sms y MB. <br /><br />
                                                                    En caso de consumir su bolsa podrá realizar recargas para continuar realizando llamadas, sms o navegar en Internet. <br /><br />
                                                                    Es importante recordarle que las recargas no pagan la renta del plan. Solamente mediante un pago bancario, con cargo a TDC o Debito o en alguno de los centros autorizados <a href="http://intranetclientes.movistar.com.mx/icl/login.html"></a> se podrá realizar el pago. <br /><br />
                                                                </label><br /> 
                                                            </div>
                                                            <div id="correctoSarDivPlan5" style="display:none;">
                                                                <label>
	                                                                Activación Exitosa: <br /><br />
	                                                                Le confirmo que su plan Vas a Volar 0.5 Canal ha sido activado exitosamente a partir de este momento. Le pedimos que en un lapso de 3 horas apague/prenda su celular para que comience a gozar de sus beneficios. <br />
                                                                </label><br />     
                                                                <label class="alert-info">BIENVENIDA: </label>   <br /><br />
                                                                <label>
	                                                                <label class="alert-info">Le recuerdo los principales beneficios con los que cuenta su plan:</label> <br /><br />

	                                                                •	Llamadas y SMS ilimitados para que hable sin restricciones a cualquier número fijo o móvil estando en México, EUA, Canadá y Puerto Rico, sin importar de que compañía sea.<br />
	                                                                •	2 GB para navegar en internet y 2GB para utilizar Redes Sociales como lo son Facebook. Twiter y WhatsApp.<br />
	                                                                •	Además puede utilizar todos estos beneficios estando en México, EUA, Canadá y Puerto Rico.<br /><br />

	                                                                Solo por esta ocasión se le otorgaran sus beneficios el día de hoy y a partir del siguiente mes los días xxx de cada mes recibirá sus bolsas de minutos, sms y MB. <br /><br />
	                                                                En caso de consumir su bolsa podrá realizar recargas para continuar realizando llamadas, sms o navegar en Internet. <br /><br />
	                                                                Es importante recordarle que las recargas no pagan la renta del plan. Solamente mediante un pago bancario, con cargo a TDC o Debito o en alguno de los centros autorizados <a href="http://intranetclientes.movistar.com.mx/icl/login.html"></a> se podrá realizar el pago. <br /><br />
                                                                </label><br />
                                                            </div>
                                                            <label class="alert-info">BIENVENIDA: </label>   <br /><br />                                                                     
                                                             <select id='acceptMigration2' name='acceptMigration2' class='form-control' required>
                                                                <option value=''>Selecciona</option>
                                                                <option value='Activacion exitosa en SAR SIGA (llamada cortada sin bienvenida)'>Activación exitosa en SAR SIGA (llamada cortada sin bienvenida)</option>
                                                                 <option value='Validacion, Activacion y Bienvenida (cliente exitoso)'>Validacion, Activacion y Bienvenida (cliente exitoso)</option>     
                                                            </select>
                                                        </div>      
                                                        <asp:HiddenField runat="server" ID="hdf_estadoMigration" />                                                                               
                                                    </div>
                                        </div>
                                      </div>
                                        <br />          
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
            var valid = true;
            if (phone.value == "") {
                valid = false;
            }
            if (Divq1.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_q1.ClientID %>').value == "") {
                valid = false;
            }
            if (scoringDiv.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_customerType.ClientID %>').value == "") {
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
            document.getElementById('<%= hdf_txt_RFC.ClientID %>').value = txt_RFC.value;
            document.getElementById('<%= hdf_approvePlanSelect.ClientID %>').value = approvePlanSelect.value; 
            if (document.getElementById('<%= hdf_tipoActivacion.ClientID %>').value == "Exitosa por SAR")
                document.getElementById('<%= hdf_estadoMigration.ClientID %>').value = acceptMigration2.value;
            else
                document.getElementById('<%= hdf_estadoMigration.ClientID %>').value = acceptMigration.value;
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
            }
            document.getElementById('<%= hdf_q1.ClientID %>').value = answer;
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
            }
            else if (answer == "Llamar despues")
            {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:block;";
                document.getElementById("acceptDiv").style = "display:none;";
                
            }
            else {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("callLater2Div").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:block;";
            }
            document.getElementById('<%= hdf_approvePlan.ClientID %>').value = answer;
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
                    if (e.id == "body_hdf_NombreCompleto" && e.value != document.getElementById(e.id.replace("body_hdf_", "")).value) {
                        document.getElementById('<%= hdf_cambio.ClientID %>').value = "Nombre";
                    }
                    else if (e.id == "body_hdf_txt_RFC" && e.value != document.getElementById(e.id.replace("body_hdf_", "")).value)
                        document.getElementById('<%= hdf_cambio.ClientID %>').value = "RFC";
                    else if (e.id == "body_hdf_fech_nac") {
                        if (e.value.substr(0, 2) != ddl_dia_2.value || e.value.substr(3, 2) != ddl_mes_2.value || e.value.substr(3, 2) != ddl_ano_2.value)
                            document.getElementById('<%= hdf_cambio.ClientID %>').value = "Fecha de nacimiento";
                    }
                    else if (e.id == "body_hdf_txt_Mail" && e.value != document.getElementById(e.id.replace("body_hdf_", "")).value)
                        document.getElementById('<%= hdf_cambio.ClientID %>').value = "Correo Electronico";
                    else if ((e.id == "body_hdf_txt_Tel_Fijo" && e.value != document.getElementById(e.id.replace("body_hdf_", "")).value) || (e.id == "hdf_txt_Tel_Movil" && e.value != document.getElementById(e.id.replace("body_hdf_", "")).value))
                        document.getElementById('<%= hdf_cambio.ClientID %>').value = "Telefonos";
                    else if (e.value != document.getElementById(e.id.replace("body_hdf_", "")).value) {
                        document.getElementById('<%= hdf_cambio.ClientID %>').value = "Domicilio ";
                    }
                    if (e.id != "body_hdf_fech_nac") {
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
        
        function tipoActivacionFunction(answer)
        {
            document.getElementById('<%= hdf_tipoActivacion.ClientID %>').value = answer; 
            if (answer == "Exitosa por SAR") {
                document.getElementById("erroSarDiv").style = "display:none;";
                document.getElementById("correctoSarDiv").style = "display:block;";
                if (document.getElementById('<%= lblPlan.ClientID %>').innerText == "Plan Movistar 3") {
                    document.getElementById("correctoSarDivPlan3").style = "display:block;";
                    document.getElementById("correctoSarDivPlan5").style = "display:none;";
                }
                else if (document.getElementById('<%= lblPlan.ClientID %>').innerText == "Vas a Volar 0.5 Canal") {
                    document.getElementById("correctoSarDivPlan3").style = "display:none;";
                    document.getElementById("correctoSarDivPlan5").style = "display:block;";
                }
                else
                {
                    document.getElementById("correctoSarDivPlan3").style = "display:none;";
                    document.getElementById("correctoSarDivPlan5").style = "display:none;";
                }
            }
            else {
                document.getElementById("erroSarDiv").style = "display:block;";
                document.getElementById("correctoSarDiv").style = "display:none;";
                if (document.getElementById('<%= lblPlan.ClientID %>').innerText == "Plan Movistar 3") {
                    document.getElementById("erroSarDivPlan3").style = "display:block;";
                    document.getElementById("erroSarDivPlan5").style = "display:none;";
                }
                else if (document.getElementById('<%= lblPlan.ClientID %>').innerText == "Vas a Volar 0.5 Canal") {
                    document.getElementById("erroSarDivPlan3").style = "display:none;";
                    document.getElementById("erroSarDivPlan5").style = "display:block;";
                }
                else
                {
                    document.getElementById("erroSarDivPlan3").style = "display:none;";
                    document.getElementById("erroSarDivPlan5").style = "display:none;";
                }
            }
        }

        function customerTypeFunction(x) {
            document.getElementById('<%= hdf_customerType.ClientID %>').value = x; 
            document.getElementById("validForm").innerHTML = "";
            switch (x) {
                case "Moroso":
                    document.getElementById("customerTypeDivMoroso").style = "display:block;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    break;
                case "Vetado":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:block;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    break;
                case "Cliente cumple requisitos":
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:block;";
                    break;                
                default:
                    document.getElementById("customerTypeDivMoroso").style = "display:none;";
                    document.getElementById("customerTypeDivVetado").style = "display:none;";
                    document.getElementById("customerTypeDivCorrecto").style = "display:none;";
                    break;
            }
        }

        function approvePlanSelectFunction()
        {
            ddl_Motivos.required = true;
            var x = document.getElementById("approvePlanSelect").value;
            if (x != "") {
                document.getElementById("motivosDiv").style = "display:block;";
            }
            else {
                document.getElementById("motivosDiv").style = "display:none;";
            }
        }
        //]]>
    </script>


</asp:Content>

