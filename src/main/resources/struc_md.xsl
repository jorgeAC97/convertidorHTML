<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<html>
        <body>
        
	
	<xsl:for-each select="Informacion_Tarifas_Titulos">  <!--- abrir nodo: Informacion_Tarifas_Titulos -->
	
	 <xsl:variable name="tlvtipo" select="@TipoTLV"/>
	 <xsl:variable name="tlvversion" select="@VersionTLV"/>
	 <xsl:variable name="contenidoversion" select="@VersionContenido"/>
	 <xsl:variable name="tlvfecha" select="@fecha"/>
	 
		 <h1>Tarifas - TLV <xsl:value-of select="$tlvtipo"/></h1>
		 <h3> Version TLV <xsl:value-of select="$tlvversion"/>,  Version Contenido <xsl:value-of select="$contenidoversion"/> <br/>
		  Fecha de creacion: <xsl:value-of select="$tlvfecha"/></h3>

         
         <xsl:for-each select="Tipo_Tarjeta"> <!--- abrir nodo: Tipo_tarjeta -->
         
         
         
         <table border="1" width="820">
	         <tr>
	           <td width="620" colspan="4" bgcolor="#C0C0C0" align="center">
	           <b>TARJETA COMERCIAL:  
	              <xsl:variable name="codigotarjeta" select="@Codigo"/>
		      <xsl:variable name="nombretarjeta" select="@Descripcion"/>
		      
		      
		      <xsl:value-of select="$nombretarjeta"/> (<xsl:value-of select="$codigotarjeta"/>)
	   
	   
	
	           
	           </b></td>
	         </tr>
         </table>
         
         
         <xsl:for-each select="Familia">  <!--- abrir nodo: Categoria -->
        	<xsl:variable name="codfamilia" select="@idfamilia"/>
	  	<xsl:variable name="familia" select="@TipoTitulo"/>
     	        <b>FAMILIA: <xsl:value-of select="$familia"/> (cod: <xsl:value-of select="$codfamilia"/>)</b>
        
         <xsl:for-each select="Titulo">  <!--- abrir nodo: Titulo -->
		  	  <p></p>
		  	  <table border="1" width="820">
       
		  	  <xsl:variable name="codigotitulo" select="@Codigo"/>
		  	  <xsl:variable name="nombretitulo" select="@Descripcion"/>
		  	  <xsl:variable name="fechainicio" select="Fecha_Inicio_Venta"/>
		  	  <xsl:variable name="fechacambio1" select="Fecha_Cambio_Venta1"/>
		  	  <xsl:variable name="fechacambio2" select="Fecha_Cambio_Venta2"/>
		  	  
		  	 
	                  <tr bgcolor="#FFFF99">
                              <td width="300">Titulo</td>
                              <td width="320"><i><xsl:value-of select="$nombretitulo"/></i> (<xsl:value-of select="$codigotitulo"/>)</td>
                          </tr>
 
                          <tr bgcolor="#FFFFFF">
							<td width="300"><b>Perfil</b></td>
							<td width="300"><b>Colectivo</b></td>
							<td width="10"><b>Fecha 1</b></td>
							<td width="10"><b>Precio 1</b></td>
							<td width="10"><b>Fecha 2</b></td>
							<td width="10"><b>Base 2</b></td>
							<td width="10"><b>Iva 2</b></td>
							<td width="10"><b>Precio 2</b></td>
							<td width="10"><b>Fecha 3</b></td>
							<td width="10"><b>Precio 3</b></td>
                         </tr>  	  
		   	 
		   	<!--- abrir nodo: Colectivo -->
			<xsl:for-each select="Colectivo">
	  	             <xsl:variable name="codigocolectivo" select="@Codigo"/>
		  	     <xsl:variable name="nombrecolectivo" select="@Descripcion"/>
		  	
		  	     <!--- abrir nodo: Perfil -->
		  	     <xsl:for-each select="Perfil">
	  	      	            <xsl:variable name="codigoperfil" select="@Codigo"/>
                                    <xsl:variable name="nombreperfil" select="Perfil_Nombre"/>
 	  	                    <tr bgcolor="#FFFFFF">

		  	  	      <xsl:for-each select="Tarifa_Venta_1">
		  	  	         <xsl:variable name="precio1" select="Unidades"/>
                         <td width="250"><xsl:value-of select="$nombreperfil"/> (<xsl:value-of select="$codigoperfil"/>) </td>
                         <td width="250"><xsl:value-of select="$nombrecolectivo"/> (<xsl:value-of select="$codigocolectivo"/>) </td>
                         <td width="190"><xsl:value-of select="$fechainicio"/></td>
		  	  	      	 <td width="100" align="right" bgcolor="C0C0C0"><xsl:value-of select="$precio1"/></td>
                     </xsl:for-each> 
                                     
                                     
		  	  	     <xsl:for-each select="Tarifa_Venta_2" >
		  	  	        <xsl:variable name="precio2" select="Unidades"/>
		  	  	     	<xsl:variable name="ImporteIVA2" select="ImporteIVA"/>
		  	  	     	<xsl:variable name="BaseImponible2" select="BaseImponible"/>
						<td width="190"><xsl:value-of select="$fechacambio1"/></td>
		  	  	     	<td width="100" align="right"><xsl:value-of select="$BaseImponible2"/></td>
		  	  	     	<td width="100" align="right"><xsl:value-of select="$ImporteIVA2"/></td>
		  	  	     	<td width="100" align="right" bgcolor="C0C0C0"><xsl:value-of select="$precio2"/></td>
	  	             </xsl:for-each>  
		  	             
		  	             
	  	             <xsl:for-each select="Tarifa_Venta_3">
				          <xsl:variable name="precio3" select="Unidades"/>
	  	             	<td width="190"><xsl:value-of select="$fechacambio2"/></td>
	  	             	<td width="100" align="right" bgcolor="C0C0C0"><xsl:value-of select="$precio3"/></td>
	  	             </xsl:for-each>  
		  	             
		  	             
                                   </tr>
                             <!--- cerrar nodo: Perfil -->      
		  	     </xsl:for-each>   

                        <!--- cerrar nodo: Colectivo -->
		        </xsl:for-each>	 
		    </table>
		    
	
	</xsl:for-each> <!--- cerrar nodo: Titulo -->
		  	
	 	
	</xsl:for-each>	<!--- cerrar nodo: Categoria -->	 
		  	
	  	
	</xsl:for-each> <!--- cerrar nodo: Tipo_Tarjeta -->	
	</xsl:for-each>  <!--- cerrar nodo: Informacion_Tarifas_Titulos -->
					
         
 
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>