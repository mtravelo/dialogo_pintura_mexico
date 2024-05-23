<?xml version="1.0" encoding="UTF-8"?>
            <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="xs"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml">
                
                <xsl:template match="/">
                    <xsl:variable name="doc_id" select="//title[1]/@n"/> 
                    <!-- Recuperamos el id del documento en una variable para nombrar el archivo de salida -->
                    <!-- Redirigir el resultado hacia un archivo -->        
                    <xsl:result-document method="html" encoding="utf-8"
                        href="_pages/dialogo{$doc_id}.html" omit-xml-declaration="yes">---
        layout: default
        title: Diálogo<xsl:apply-templates select="$doc_id"/>
        permalink: dialogo<xsl:apply-templates select="$doc_id"/>
       ---
  
<div>
<a href="../imgs/dialogo{$doc_id}.jpg"><img src="../imgs/dialogo(/{$doc_id}.jpg"></img></a>
</div>
<div>
<a href="../imgs/dialogo{$doc_id}.jpg"><img src="../imgs/dialogo{$doc_id}.jpg"></img></a>
</div>
Gabriel Calarco
9:40
<div>
<xsl:apply-templates select="//body/div"/>
</div>


        </xsl:result-document>
    </xsl:template>

<!-- Transfomaciones -->

    <xsl:template match="//p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

</xsl:stylesheet> 