<?xml version="1.0" encoding="UTF-8"?>
            <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="xs"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml">
                
                <xsl:template match="/">
                    <xsl:variable name="doc_id" select="//title[@type='sub']/@xml:id"/> 
                    <!-- Recuperamos el id del documento en una variable para nombrar el archivo de salida -->
                    <!-- Redirigir el resultado hacia un archivo -->        
                    <xsl:result-document method="html" encoding="utf-8"
                        href="_pages/textosalex/{$doc_id}.html" omit-xml-declaration="yes">---
        layout: default
        title: <xsl:apply-templates select="$doc_id"/>
        permalink: <xsl:apply-templates select="$doc_id"/>
       ---
        
        <div>
            <ul>
                <li><a href="edicion">Volver</a></li>
                </ul>
            </div>

        <h1><xsl:apply-templates select="//title[2]"/>
        </h1>
        
        <body>  <br></br>
            <xsl:apply-templates select="//lg[@type='fragmento']"/>
        </body>
        </xsl:result-document>
    </xsl:template>


                <xsl:template match="//title[2]">
                    <a> 
                        <xsl:attribute name="href">
                            <xsl:value-of select="@ref"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <xsl:apply-templates/>
                    </a>
                </xsl:template>      
    
    <xsl:template match="//lg//lg">
        <div class="estrofa">
            <p class="nrodeestrofa">
                <xsl:value-of select="@n"/>
            </p>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
                
                
                <xsl:template match="//note[@type='motivo']">
                        <p class="motivo"> <a> 
                            <xsl:attribute name="href">
                            <xsl:value-of select="@target"/>
                            </xsl:attribute>
                            <xsl:attribute name="target">_blank</xsl:attribute>
                            <xsl:attribute name="class">
                                <xsl:value-of select="@subtype"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </a>
                        </p>
                    
                </xsl:template>
    
    
    
    <xsl:template match="//lg//l">
        <p class="verso">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="//caesura">
        <span class="caesura"></span>
    </xsl:template>    
    
    <xsl:template match="//term">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
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
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>  
    
    
    <xsl:template match="//persName">
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>