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
<a href="../imgs/dialogo{$doc_id}.jpg"><img src="../imgs/dialogo{$doc_id}.jpg"></img></a>
</div>

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

    <xsl:template match="//speaker">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="//persName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">blank</xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="//placeName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">blank</xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>  
    

    <xsl:template match="//orgName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">blank</xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>  

    <xsl:template match="//lg//l">
        <p class="tercetos_encadenados">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="//head">
    <table>
            <xsl:apply-templates/>
    </table>
    </xsl:template>

    <xsl:template match="//row">
    <table>
        <tr>
        <td><xsl:value-of select="label"/></td>
        <td><xsl:value-of select="data"/></td>
            <xsl:apply-templates/>
        </tr>    
    </table>
    </xsl:template>

    
    <xsl:template match="//note[@type='editorial']">
        <note>
         <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">blank
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@subtype"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
        </note>
    </xsl:template>

     <xsl:template match="//note[@type='autor']">
        <note>
         <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">blank
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@subtype"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
        </note>
    </xsl:template>

    <xsl:template match="//hi[rend='italic']">
        <span class="italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="//hi[rend='superscript']">
        <span class="italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


</xsl:stylesheet> 