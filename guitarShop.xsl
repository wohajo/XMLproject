<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>


<xsl:template match="/guitarShop">
    <html>
        <body>
            <div><h2>Guitar Shop</h2></div>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>

<xsl:template match="products">
	<div>
            <xsl:apply-templates/>
	</div>    
</xsl:template>

    <xsl:template match="orders">
        <div>
            <xsl:apply-templates/>
        </div>    
    </xsl:template>

</xsl:stylesheet>

<!-- TODO guitar card div 
                <xsl:for-each select="guitarShop/products/guitar">
                <div>
                    <div>
                        <p>brand: <xsl:value-of select="brand"/></p>
                        <p>model: <xsl:value-of select="model"/></p>
                        <p>&lt;pickups&gt;</p>
                    </div>
                    <div>
                        price: <xsl:value-of select="price"/>
                    </div>
                </div>
                </xsl:for-each> -->