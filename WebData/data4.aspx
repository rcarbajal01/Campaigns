<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="True" CodeFile="data4.aspx.cs" Inherits="WebData.Data4" %>
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
                                        </asp:LinkButton><asp:HiddenField ID="cobranzaExistente" runat="server" /><asp:HiddenField ID="hdf_plan" runat="server" />                                      
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
                                            <option value='Buzon/Tono'>Buzon/Tono</option>
                                        </select><asp:HiddenField runat="server" ID="hdf_reasonq1" />
                                    </div>    
                                </div>
                                <div id="reasonq1divYes" style="display:none;">
                                    <br /><label>
                                        Buen día (noche/tarde,) tengo el gusto con el (Titular de la línea del DN:<asp:Label ID="lblDn" runat="server"></asp:Label>) Sr., Sra., Srita. <asp:Label ID="lblNombre" runat="server"></asp:Label> habla (Nombre del Ejecutivo)de  Telefónica Movistar <br />
                                        <br />El motivo de  mi  llamada  es para  validar   si ha  presentado algún inconveniente para  realizar  su pago. El cual tiene una  fecha de vencimiento el día (dd/ mm/ aaaa), por un monto de $XXXX.XX<br /><br />                                             
                                        </label>
                                        <input type="radio" name="confirmaPago" id="confirmaPago" value="Si" onclick="javascript: confirmaPagofunction(this.value)" autofocus/> a) El cliente menciona que SI ya pagó<br />
                                        <input type="radio" name="confirmaPago" id="confirmaPago" value="No" onclick="javascript: confirmaPagofunction(this.value)" autofocus/> b) El cliente menciona que NO ha pagado: Nos gustaría saber ¿Hay algún  motivo por el que no ha realizados pago?<br />
                                        <br /><asp:HiddenField runat="server" ID="hdf_confirmaPago" /> 
                                    <div id="yaPago" style="display:none;">
                                        (validar en Front End que aparezca el pago reflejado)<br />
                                        <input type="radio" name="approvePago" id="approvePago" value="Si" onclick="javascript: approvePagofunction(this.value)" autofocus/> Si<br>
                                        <input type="radio" name="approvePago" id="approvePago" value="No" onclick="javascript: approvePagofunction(this.value)" /> No<br />
                                    <br /><asp:HiddenField runat="server" ID="hdf_approvePago" />                                     
                                        <div id="objectionDiv" style="display:none;">
                                            <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">El pago <b>SI está reflejado en FE</b>: 
                                            </span></p>
                                            <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> </span></p>
                                            <p style="MARGIN-LEFT:0.5in"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>-<span style="FONT:7pt &#39;Times New Roman&#39;">          
                                            </span></span></span><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">“Efectivamente el pago 
                                            ya nos aparece reflejado en sistema.</span></b></p>
                                            <p style="MARGIN-LEFT:0.5in"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>-<span style="FONT:7pt &#39;Times New Roman&#39;">          
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Tiene alguna duda 
                                            referente<span>  </span>a su fecha<span>  </span>de pago</span></p>
                                            <p style="MARGIN-LEFT:0.5in"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>-<span style="FONT:7pt &#39;Times New Roman&#39;">          
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Desea alguna otra 
                                            referencia bancaria para<span>  </span>realizar 
                                            su próximo pago.</span></p>
                                            <p style="MARGIN-LEFT:0.5in"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>-<span style="FONT:7pt &#39;Times New Roman&#39;">          
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Alguna<span>  </span>duda<span>  </span>con los<span>  </span>beneficios de su plan. 
                                            </span></p>
                                            <p style="MARGIN-LEFT:0.5in"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>-<span style="FONT:7pt &#39;Times New Roman&#39;">          
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span> </span>Agradezco que haya atendido mi llamada. 
                                            Que tenga una<span>  </span>excelente<span>  </span>día/tarde/noche”</span></p>
                                            <ul type="disc">
                                                <ul type="circle">
                                                <ul type="square">
                                                    <ul type="square">
                                                    <li style="LINE-HEIGHT:normal;COLOR:#333333"><span style="FONT-FAMILY:MovistarTextRegular;COLOR:windowtext">Codificar en 
                                                    Front End. </span><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;FONT-SIZE:10pt">Codifica: 
                                                    </span><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;COLOR:#279980;FONT-SIZE:10pt">Consulta 
                                                    / Productos y Servicios / Información de Recaudación</span><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;FONT-SIZE:10pt"></span> 
                                                    </li></ul></ul></ul></ul>
                                        </div>
                                        <div id="acceptDiv" style="display:none;">
                                            <label>                                                
                                                El pago no aparece  Reflejado.<br /><br />
                                                Han pasado 24 hrs?
                                            </label><br />    
                                                <input type="radio" name="approveSms" id="approveReflejo" value="Si" onclick="javascript: approveReflejofunction(this.value)" /> Si<br>
                                                <input type="radio" name="approveSms" id="approveReflejo" value="No" onclick="javascript: approveReflejofunction(this.value)" /> No
                                            <br /><asp:HiddenField runat="server" ID="hdf_approveReflejo" />
                                            <div id="rechazaReflejo" style="display:none;">
                                                <label>                                                
                                                    Me puede indicar el medio por el cual realizó el pago de su factura?
                                                    En línea (revisar en sistema que se haya aplicado el pago) pasar a punto A)
                                                    Pago en dentro de los tiempos de aplicación : Sr/Srita____ esperaremos a que pasen  24 horas para ver su pago reflejado en el sistema, en caso de que no sea así nos comunicamos de nuevo con usted. (Termina llamada y se realiza seguimiento)
                                                </label><br />                             
                                            </div>
                                            <div id="aceptaReflejo" style="display:none;">
                                                <label>                                                
                                                    Cliente  realizo  su pago y no aparece  reflejado pasaron  más de  24 hrs.<br /><br />
                                                    A)	¿Cuenta usted con su comprobante de pago?
                                                </label><br />    
                                                    <input type="radio" name="comprobanteApprove" id="comprobanteApprove" value="Si" onclick="javascript: comprobanteApprovefunction(this.value)" /> Si<br>
                                                    <input type="radio" name="comprobanteApprove" id="comprobanteApprove" value="No" onclick="javascript: comprobanteApprovefunction(this.value)" /> No
                                                <br /><asp:HiddenField runat="server" ID="hdf_comprobanteApprove" />                                                                                                                                                                         
                                            <div id="aceptaComprobante" style="display:none;">       
                                                <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">El cliente 
                                                indica que <b>SÍ</b> cuenta con el 
                                                comprobante; indicarle al cliente que es necesario que envíe su comprobante de 
                                                pago a </span><a href="mailto:aclaracionescobranza.mx@telefonica.com" target="_blank"><span style="FONT-FAMILY:&#39;Telefonica Text&#39;;FONT-SIZE:11pt">aclaracionescobranza.mx@<wbr>telefonica.com</span></a><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">con su número 
                                                telefónico a 10 dígitos para proceder con la aclaración.</span></p>
                                                <p style="MARGIN-LEFT:71.4pt"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                                </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Dictaminar como 
                                                cliente en aclaración por pago no reflejado cliente con comprobante (solicitar 
                                                prorroga de 6 días por requerimiento)</span></p>
                                                <ul type="disc">
                                                    <ul type="circle">
                                                    <li style="LINE-HEIGHT:normal"><span style="FONT-FAMILY:MovistarTextRegular">Levantar 
                                                    requerimiento ya pago y no está reflejado/</span><b><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;COLOR:#333333;FONT-SIZE:10pt">No</span></b><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;COLOR:#333333;FONT-SIZE:10pt"> 
                                                    está reflejado correctamente: Levanta el requerimiento: </span><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;COLOR:red;FONT-SIZE:10pt">Queja 
                                                    / Facturación, saldos y pagos / Ya pago y no está reflejado / Opción que 
                                                    corresponda</span><span style="FONT-FAMILY:&#39;Arial&#39;,&#39;sans-serif&#39;;COLOR:#333333;FONT-SIZE:10pt"> 
                                                    </span><span style="FONT-FAMILY:&#39;Times New Roman&#39;,&#39;serif&#39;;FONT-SIZE:12pt"></span></li></ul></ul>
                                                <p style="MARGIN-LEFT:71.4pt"><span style="FONT-FAMILY:MovistarTextRegular;COLOR:#548dd4;FONT-SIZE:11pt"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                                </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Enviar la dirección de 
                                                correo electrónico vía SMS<span style="COLOR:#548dd4"> (Estimado cliente envié 
                                                su comprobante de pago al correo <a href="mailto:aclaracionescobranza.mx@telefonica.com" target="_blank">aclaracionescobranza.mx@<wbr>telefonica.com</a> con su 
                                                número Telefónico a 10 dígitos.)</span></span></p>
                                            </div>   
                                            <div id="rechazaComprobante" style="display:none;"> 
                                                <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">El cliente 
                                                indica que <b>NO</b> cuenta con el 
                                                comprobante, indicar al cliente que es necesario que lo consiga con su banco/ 
                                                punto de venta/ para proceder con la aclaración ya que de lo contrario tendrá 
                                                que realizar nuevamente su pago.</span></p>
                                                <p style="MARGIN-LEFT:71.4pt"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                                </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Dictaminar como 
                                                cliente en aclaración por pago no reflejado cliente sin 
                                                comprobante</span></p>
                                                <p style="MARGIN-LEFT:71.4pt"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                                </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Indicar al cliente que 
                                                debe enviar su comprobante a</span><a href="mailto:aclaracionescobranza.mx@telefonica.com" target="_blank"><span style="FONT-FAMILY:&#39;Telefonica Text&#39;;FONT-SIZE:11pt">aclaracionescobranza.mx@<wbr>telefonica.com</span></a><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> lo antes posible para 
                                                que no pierda los beneficios de su plan</span></p>
                                                <p style="MARGIN-LEFT:71.4pt"><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                                </span></span></span><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Enviar la dirección de 
                                                correo electrónico vía SMS<span style="COLOR:#548dd4"> (Estimado cliente envié 
                                                su comprobante de pago al correo <a href="mailto:aclaracionescobranza.mx@telefonica.com" target="_blank">aclaracionescobranza.mx@<wbr>telefonica.com</a> con su 
                                                número Telefónico a 10 dígitos.)</span></span></p>                                  
                                            </div>
                                        </div> 
                                    </div>
                                    </div>
                                    <div id="noPago" style="display:none;">
                                        <span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"><br></span><span style="FONT-FAMILY:MovistarTextRegular">
                                            <select name="ddlMotivoAdeudo" id="ddlMotivoAdeudo" class='form-control' required>
	                                                <option selected="selected" value=''>[Motivos de no aceptacion]</option>
	                                                <option value="Extravie numeros de referencia">Extravie numeros de referencia</option>
	                                                <option value="Lugares de pago lejanos">Lugares de pago lejanos</option>
	                                                <option value="No tengo dinero">No tengo dinero</option>
	                                                <option value="No tengo tiempo">No tengo tiempo</option>
	                                                <option value="Olvide la fecha limite de pago">Olvide la fecha limite de pago</option>
	                                                <option value="Problemas de uso de datos moviles">Problemas de uso de datos moviles</option>
                                                    <option value="Problemas personales">Problemas personales</option>                                                    
                                                </select></span>
                                            <asp:HiddenField runat="server" ID="hdf_ddlMotivoAdeudo" /> 
                                        <p style="MARGIN-LEFT:0.5in"><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> </span></b></p>
                                        <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> </span></p>
                                        <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Cuando<span>  </span>podremos<span>  </span>contar con su pago (Que<b> no exceda<span>  </span>el lapso de 3 
                                        días)</b></span></p>
                                        <p><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> </span></b></p>
                                        <p style="TEXT-ALIGN:left" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:13pt">Opciones 
                                        vs Objeciones</span></b></p>
                                        <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">El manejo de objeciones será una a la 
                                        vez tratando de incitar al cliente a que tome la opción con prioridad 
                                        jerárquica, totalmente prohibido ofrecer todas las opciones a la vez o<span>  </span>fuera de 
                                        prioridad.</span></p>
                                        <div id="objection1Header" class="bg-info" onclick="javascript: showObjection(1)">
		                                    <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"> </span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.25pt" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">Objeción 1: Falta de Dinero 
                                            </span></b></p>             
	                                    </div>                                            
                                        <div id="obj1" style="display:none;">                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">línea Ofrecer cargo en a 
                                            TDC,</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer 
                                            domiciliación</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer promesa de pago (3 días) con 
                                            prorroga,</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer convenio ( pague 50% y el resto 
                                            en 7 días),</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>4.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si 
                                            el cliente refiere un tiempo distinto anotar cual es la posibilidad del cliente 
                                            para validación, se regresará respuesta vía call back, no prometer cosas que no 
                                            se pueden cumplir.</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Validar si cuenta con la Referencia 
                                            Bancaria bajo el siguiente flujo:</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">¿Cuenta usted con la referencia para 
                                            realizar su pago en Ventanilla Bancaria o Tienda de 
                                            Conveniencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si. ¿En qué Banco lo 
                                            realizaría?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:125.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>              
                                            </span>i.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">El 
                                            cliente informa banco</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Le 
                                            reenvió la referencia Vía SMS para que pueda presentarla en 
                                            ventanilla</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>b.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No. ¿Gusta que le informe las opciones 
                                            para que le envíe la referencia de su banco de preferencia para que realice su 
                                            pago?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:125.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>              
                                            </span>i.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si. Leer Bancos… ¿De qué banco o tienda 
                                            de conveniencia envío la referencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Enviar.</span></p>
                                        </div>
                                        <div id="objection2Header" class="bg-info" onclick="javascript: showObjection(2)">
		                                    <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.25pt" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">Objeción 2: Se me olvido la fecha 
                                            </span></b></p>            
	                                    </div>
                                        <div id="obj2" style="display:none;">                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer cargo en 
                                            línea</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Cliente acepta realizar cargo y ofrecer 
                                            domiciliación</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>b.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Cliente no acepta o Cargo no 
                                            exitoso:</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Validar si cuenta con la Referencia 
                                            flujo Bancaria bajo el siguiente:</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:125.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>            
                                            </span>ii.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">¿Cuenta usted con la referencia para 
                                            realizar su pago en Ventanilla Bancaria o Tienda de 
                                            Conveniencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si. ¿En qué Banco lo 
                                            realizaría?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:197.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">El 
                                            cliente informa banco</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:233.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>                              <wbr>                              <wbr>                          
                                            </span>i.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Le 
                                            reenvió la referencia Vía SMS para que pueda presentarla en 
                                            ventanilla</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:125.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>          
                                            </span>iii.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No. ¿Gusta que le informe las opciones 
                                            para que le envíe la referencia de su banco de preferencia para que realice su 
                                            pago?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si. Leer Bancos<span>…¿</span>De qué banco o tienda de conveniencia envío la 
                                            referencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:197.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Enviar.</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:71.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"> </span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Para cuando esperaríamos su 
                                            pago</span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>            
                                            </span>Pre cobranza: No aceptar más allá de la FLP</span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>            
                                            </span>Cobranza: No aceptar más de 3 días, si requiere más de 3 días ir 
                                            a</span><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> 
                                            Objeción 1: Falta de Dinero</span></b></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"> </span></p>
                                        </div>
                                        <div id="objection3Header" class="bg-info" onclick="javascript: showObjection(3)">
		                                    <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.25pt" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">Objeción 3: No me llego la 
                                            factura</span></b></p>           
	                                    </div>
                                        <div id="obj3" style="display:none;">                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Validar si tiene <span>paperless</span></span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Enviar factura en 
                                            línea</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer opciones de Mi Movistar,( poner 
                                            liga y manual de acceso para que sea informado en una sola línea) 
                                            </span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>4.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">En 
                                            caso de que el cliente refiera no tener correo electrónico, reenviar factura 
                                            física Levantar requerimiento.</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Objeción.- <i>Es muy importante que recuerde que su fecha 
                                            límite de pago es el día (<span>dd</span>) de cada mes, por lo que 
                                            aunque no reciba la factura debe realizar su pago en tiempo para evitar que 
                                            pierda los beneficios de su plan</i></span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.25pt" align="left"><i><span style="FONT-FAMILY:MovistarTextRegular"> </span></i></p>
                                        </div>
                                        <div id="objection4Header" class="bg-info" onclick="javascript: showObjection(4)">
		                                    <p style="TEXT-ALIGN:left;TEXT-INDENT:35.25pt" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">Objeción 4: No sé a donde tengo que ir 
                                            a pagar</span></b></p>            
	                                    </div>
                                        <div id="obj4" style="display:none;">                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer cargo en 
                                            línea</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:89.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer 
                                            domiciliación</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:35.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Validar si cuenta con la Referencia 
                                            Bancaria bajo el siguiente flujo:</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:134.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>              
                                            </span>i.<span style="FONT:7pt &#39;Times New Roman&#39;">            
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">¿Cuenta usted con la referencia para 
                                            realizar su pago en Ventanilla Bancaria o Tienda de 
                                            Conveniencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span><span style="FONT-FAMILY:MovistarTextRegular">Si<span>.¿</span>En</span></span><span style="FONT-FAMILY:MovistarTextRegular"> qué Banco lo 
                                            realizaría?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:197.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">El 
                                            cliente informa banco</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:233.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>                              <wbr>                              <wbr>                          
                                            </span>i.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Le 
                                            reenvió la referencia Vía SMS para que pueda presentarla en 
                                            ventanilla</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:134.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span><span style="FONT:7pt &#39;Times New Roman&#39;">                              <wbr>                              <wbr>            
                                            </span>ii.<span style="FONT:7pt &#39;Times New Roman&#39;">            
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No. ¿Gusta que le informe las opciones 
                                            para que le envíe la referencia de su banco de preferencia para que realice su 
                                            pago?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:161.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Si. Leer Bancos<span>…¿</span>De qué banco o tienda de conveniencia envío la 
                                            referencia?</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:197.4pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a.<span style="FONT:7pt &#39;Times New Roman&#39;">       
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Enviar.</span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Para cuando esperaríamos su 
                                            pago</span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>            
                                            </span>Pre cobranza: No aceptar más allá de la FLP</span></p>
                                            <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>            
                                            </span>Cobranza: No aceptar más de 3 días, si requiere más de 3 días ir a punto 
                                            </span><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Objeción 
                                            1: Falta de Dinero</span></b></p>
                                        </div>
                                        <div id="objection5Header" class="bg-info" onclick="javascript: showObjection(5)">
                                            <p style="TEXT-ALIGN:left" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">Objeción 4: Negativa de 
                                            Pago</span></b></p>           
	                                    </div>
                                        <div id="obj5" style="display:none;">                                                                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No 
                                            reconozco la compra del servicio</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No 
                                            es lo que me prometieron</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Me 
                                            gustaba más en Prepago</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>4.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No 
                                            quiero pagar</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>5.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Fallas de Servicio Técnico ( 
                                            Cobertura)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>6.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Fallas en la Oferta Comercial ( No se 
                                            aplicaron sus Bolsas o Bonos)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:71.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"> </span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:0.5in" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>a)<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Escuchar y codificarse/ dictaminarse la 
                                            queja del cliente <a name="0.1__GoBack"></a></span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:0.5in" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>b)<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Ofrecer al cliente una disculpa por los 
                                            inconvenientes ocasionados, </span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:0.5in" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>c)<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Destacar los Beneficios de estar en el 
                                            Plan (Ir a apartado <b>Beneficios</b>) e 
                                            indicar que respuesta nos contactaremos nuevamente con la solución. revisaremos 
                                            su queja, en cuanto tengamos</span></p>
                                        </div>
                                        <div id="objection6Header" class="bg-info" onclick="javascript: showObjection(6)">
                                            <p style="TEXT-ALIGN:left" align="left"><b><span style="FONT-FAMILY:MovistarTextRegular">BO 
                                            Pago</span></b></p>           
	                                    </div>
                                        <div id="obj6" style="display:none;">                                                                                                
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>1.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No 
                                            reconozco la compra del servicio (enviar casos Ventas Migración 
                                            AEE)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>2.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">No 
                                            es lo que me prometieron (Canalizar a VVG)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>3.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Me 
                                            gustaba más en Prepago (Canalizar a Retención)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>4.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Fallas de Servicio Técnico (Cobertura) 
                                            (Canalizar a VVG)</span></p>
                                            <p style="TEXT-ALIGN:left;MARGIN-LEFT:53.25pt" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>5.<span style="FONT:7pt &#39;Times New Roman&#39;">      
                                            </span></span></span><span style="FONT-FAMILY:MovistarTextRegular">Fallas en la Oferta Comercial ( No se 
                                            aplicaron sus Bolsas o Bonos) (Canalizar a FHM)</span></p>
                                        </div>
                                        <p><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt"> </span></p>
                                        <p><b><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:13pt">Beneficios</span></b></p>
                                        <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Le recordamos que es necesario que 
                                        realice su pago lo antes posible para que pueda seguir contando con los 
                                        beneficios que le otorga su plan <asp:Label ID="lblPlan" runat="server"></asp:Label> que 
                                        son:</span></p>
                                        <table style="WIDTH:100%;BORDER-COLLAPSE:collapse" border="0" cellspacing="0" cellpadding="0" width="100%">
                                            <tbody>
                                            <tr style="HEIGHT:8.9pt">
                                            <td style="PADDING-BOTTOM:0.75pt;PADDING-LEFT:0.75pt;PADDING-RIGHT:0.75pt;HEIGHT:8.9pt;PADDING-TOP:0.75pt">
                                                <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">      •<span>  </span>Llamadas<span>  </span>y mensajes ilimitados a cualquier 
                                                número fijo y móvil de cualquier compañía en México, E.U. Canadá y Puerto 
                                                Rico.</span></p></td></tr>
                                            <tr style="HEIGHT:5.6pt">
                                            <td style="PADDING-BOTTOM:0.75pt;PADDING-LEFT:0.75pt;PADDING-RIGHT:0.75pt;HEIGHT:5.6pt;PADDING-TOP:0.75pt">
                                                <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"><span>       
                                                </span><span>   </span></span><span style="FONT-FAMILY:MovistarTextRegular" lang="EN-US">2 GB <span>Redes<span>  </span>Sociales</span> (sin voz) 
                                                Facebook, twitter, Whatshapp.</span></p>
                                                <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular" lang="EN-US">      <span>   </span></span><span style="FONT-FAMILY:MovistarTextRegular">•2 GB para navegar<span>  </span>en internet.</span></p>
                                                <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular"> </span></p></td></tr>
                                            <tr style="HEIGHT:14pt">
                                            <td style="PADDING-BOTTOM:0.75pt;PADDING-LEFT:0.75pt;PADDING-RIGHT:0.75pt;HEIGHT:14pt;PADDING-TOP:0.75pt"></td></tr>
                                            <tr style="HEIGHT:31.05pt">
                                            <td style="PADDING-BOTTOM:0.75pt;PADDING-LEFT:0.75pt;PADDING-RIGHT:0.75pt;HEIGHT:31.05pt;PADDING-TOP:0.75pt">
                                                <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Con estos beneficios usted 
                                                está<span>  </span>hablando 5 veces más por 
                                                el mismo monto de recarga que usted tenía en su oferta de prepago. Además 
                                                este plan solamente se está ofreciendo a nuestros clientes preferentes 
                                                Movistar como usted para que tenga las tarifas más competitivas que hay en 
                                                el mercado.</span></p></td></tr></tbody></table>
                                        <label>                                                
                                            8.- ¿Tiene alguna duda?<br />
                                        </label><br />    
                                            <input type="radio" name="approveDuda" id="approveDuda" value="Si" onclick="javascript: approveDudafunction(this.value)" /> Si (aclarar)<br>
                                            <input type="radio" name="approveDuda" id="approveDuda" value="No" onclick="javascript: approveDudafunction(this.value)" /> No (pasar al cierre)
                                        <br /><asp:HiddenField runat="server" ID="hdf_approveDuda" /><br />
                                        Si posteriormente  tiene una consulta referente a su pago  puede marcar  el  * pago  *7246<br /><br />
                                        Si el cliente cuenta  con TDC o TDD  ofrecer la  Domiciliacion.<br /><br />
                                        <p><b><u><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">CIERRE:</span></u></b></p>
                                        <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Agradezco que haya atendido mi llamada 
                                        y contamos con que su pago sea realizado el día (dd/mm/aaaa<span>)en</span> (mencionar el lugar seleccionado por el cliente) para que 
                                        continúe con los beneficios de su plan Vas a Volar<span>  </span>(<b><asp:Label ID="lblPlan2" runat="server"></asp:Label></b>)que tiene por ser cliente preferente .</span></p>
                                        <p style="TEXT-ALIGN:left" align="left"><span style="FONT-FAMILY:MovistarTextRegular">Muchas gracias por su tiempo, le 
                                        deseamos tenga un buen día/tarde/ noche.</span></p>
                                        <p style="TEXT-ALIGN:center" align="center"><u><span style="FONT-FAMILY:MovistarTextRegular;COLOR:black;FONT-SIZE:11pt"><span style="TEXT-DECORATION:none"> </span></span></u></p>
                                        <p><span><u><span style="FONT-FAMILY:MovistarTextRegular;FONT-SIZE:11pt">Promesa de 
                                        Pago</span></u></span><u><span style="FONT-FAMILY:MovistarTextRegular;COLOR:#00517a;FONT-SIZE:11pt"></span></u></p>
                                        <p> </p>
                                        </div>     
                                    <select id='acceptMigration' name='acceptMigration' class='form-control' required>
                                        <option value=''>Selecciona</option>
                                        
                                    </select><asp:HiddenField runat="server" ID="hdf_acceptMigration" />                                                                                   
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
        
        function validateFields()
        {
            var valid = true;
            if (phone.value == "") {
                valid = false;
            }
            document.getElementById('<%= hdf_acceptMigration.ClientID %>').value = acceptMigration.value;
            if (Divq1.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_q1.ClientID %>').value == "") {
                valid = false;
            }
            if (reasonq1divYes.style.getPropertyValue("display") == "block" && document.getElementById('<%= hdf_acceptMigration.ClientID %>').value == "") {
                valid = false;
            }

            if (!valid)
            {
                document.getElementById("validForm2").innerHTML = "Selecciona todas las opciones visibles";
                return valid;
            }
            document.getElementById('<%= hdf_reasonq1.ClientID %>').value = reasonq1.value;
            document.getElementById('<%= hdf_phone.ClientID %>').value = phone.value;
            document.getElementById('<%= hdf_ddlMotivoAdeudo.ClientID %>').value = ddlMotivoAdeudo.value;             
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

        function q1function(answer) {
            document.getElementById("validForm").innerHTML = "";
            if (answer == "No") {
                document.getElementById("reasonq1div").style = "display:block;";
                document.getElementById("reasonq1divYes").style = "display:none;";
            }
            else {
                document.getElementById("reasonq1divYes").style = "display:block;";
                document.getElementById("reasonq1div").style = "display:none;";
            }
            document.getElementById('<%= hdf_q1.ClientID %>').value = answer;
        }

        function approvePagofunction(answer)
        {
            var x = document.getElementById("acceptMigration");
            if (x.length > 1) {
                x.remove(x.length - 1);
            }
            var option = document.createElement("option");
            if(answer=="Si")
            {
                document.getElementById("objectionDiv").style = "display:block;";
                document.getElementById("acceptDiv").style = "display:none;";                
                option.text = "Pago Realizado";
                option.value = "Pago Realizado";
                x.add(option);
            }
            else
            {
                document.getElementById("objectionDiv").style = "display:none;";
                document.getElementById("acceptDiv").style = "display:block;";
            }
            document.getElementById('<%= hdf_approvePago.ClientID %>').value = answer; 
        }

        function confirmaPagofunction(answer) {
            if (answer == "Si") {
                document.getElementById("yaPago").style = "display:block;";
                document.getElementById("noPago").style = "display:none;";
            }
            else
            {
                document.getElementById("yaPago").style = "display:none;";
                document.getElementById("noPago").style = "display:block;";
                var x = document.getElementById("acceptMigration");
                if (x.length > 1) {
                    x.remove(x.length - 1);
                }
                var x = document.getElementById("acceptMigration");
                if (x.length > 1) {
                    x.remove(x.length - 1);
                }
                var option = document.createElement("option");
                option.text = "Promesa de Pago";
                option.value = "Promesa de Pago";
                x.add(option);
                var option2 = document.createElement("option");
                option2.text = "Encuesta no efectiva";
                option2.value = "Encuesta no efectiva";
                x.add(option2);
            }
            document.getElementById('<%= hdf_confirmaPago.ClientID %>').value = answer;
        } 

        function approveReflejofunction(answer) {
            if (answer == "No") {
                document.getElementById("rechazaReflejo").style = "display:block;";
                document.getElementById("aceptaReflejo").style = "display:none;";
                var x = document.getElementById("acceptMigration");
                if (x.length > 1) {
                    x.remove(x.length - 1);
                }
                var option = document.createElement("option");
                option.text = "Seguimiento 24hrs";
                option.value = "Seguimiento 24hrs";
                x.add(option);
            }
            else {
                document.getElementById("rechazaReflejo").style = "display:none;";
                document.getElementById("aceptaReflejo").style = "display:block;";
            }
            document.getElementById('<%= hdf_approveReflejo.ClientID %>').value = answer;             
        }

        function comprobanteApprovefunction(answer) {
            var x = document.getElementById("acceptMigration");
            if (x.length > 1) {
                x.remove(x.length - 1);
            }
            var option = document.createElement("option");
            option.text = "Cliente en Aclaracion";
            option.value = "Cliente en Aclaracion";
            x.add(option);
            if (answer == "Si") {
                document.getElementById("aceptaComprobante").style = "display:block;";
                document.getElementById("rechazaComprobante").style = "display:none;";
            }
            else {
                document.getElementById("aceptaComprobante").style = "display:none;";
                document.getElementById("rechazaComprobante").style = "display:block;";
            }
            document.getElementById('<%= hdf_comprobanteApprove.ClientID %>').value = answer;
        }

        function approveDudafunction(answer) {
            document.getElementById('<%= hdf_approveDuda.ClientID %>').value = answer;
        } 

        function showObjection(x) {
            switch (x) {
                case 1:
                    document.getElementById("obj1").style.display == "none" ? document.getElementById("obj1").style = "display:block;" : document.getElementById("obj1").style = "display:none;"
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style = "display:none;";
                    break;
                case 2:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style.display == "none" ? document.getElementById("obj2").style = "display:block;" : document.getElementById("obj2").style = "display:none;"
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style = "display:none;";
                    break;
                case 3:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style.display == "none" ? document.getElementById("obj3").style = "display:block;" : document.getElementById("obj3").style = "display:none;"
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style = "display:none;";
                    break;
                case 4:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style.display == "none" ? document.getElementById("obj4").style = "display:block;" : document.getElementById("obj4").style = "display:none;"
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style = "display:none;";
                    break;
                case 5:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style.display == "none" ? document.getElementById("obj5").style = "display:block;" : document.getElementById("obj5").style = "display:none;"
                    document.getElementById("obj6").style = "display:none;";
                    break;
                case 6:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style.display == "none" ? document.getElementById("obj6").style = "display:block;" : document.getElementById("obj6").style = "display:none;"
                    break;
                default:
                    document.getElementById("obj1").style = "display:none;";
                    document.getElementById("obj2").style = "display:none;";
                    document.getElementById("obj3").style = "display:none;";
                    document.getElementById("obj4").style = "display:none;";
                    document.getElementById("obj5").style = "display:none;";
                    document.getElementById("obj6").style = "display:none;";
                    break;
            }
        }        

        //]]>
    </script>


</asp:Content>
