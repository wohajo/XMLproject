<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>


<xsl:template match="/">
    <html>
        <body>
            <div>
                <h1>Guitar Shop</h1>
            </div>
            <div>
                <h2>Products</h2>
                <h3>Guitars</h3>
                <xsl:for-each select="guitarShop/products/guitar">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Basses</h3>
                <xsl:for-each select="guitarShop/products/bass">
                    <xsl:apply-templates/>
                </xsl:for-each>
            </div>
            <div>
                <h2>Orders</h2>
                <xsl:for-each select="guitarShop/orders">
                    <xsl:apply-templates/>
                </xsl:for-each>
            </div>
        </body>
    </html>
</xsl:template>

<xsl:template match="guitar">
                <div>
                    <div>
                        <p>brand: <xsl:value-of select="./brand"/></p>
                        <p>model: <xsl:value-of select="./model"/></p>
                        <p><xsl:apply-templates select="./pickups"/></p>
                    </div>
                    <div>
                        price: <xsl:value-of select="./price"/>
                    </div>
                </div>
</xsl:template>

<xsl:template match="bass">
                <div>
                    <div>
                        <p>brand: <xsl:value-of select="./brand"/></p>
                        <p>model: <xsl:value-of select="./model"/></p>
                        <p><xsl:apply-templates select="./pickups"/></p>
                    </div>
                    <div>
                        price: <xsl:value-of select="./price"/>
                    </div>
                </div>
</xsl:template>

<xsl:template match="amplifier">
</xsl:template>

<xsl:template match="stringPack">
</xsl:template>

<xsl:template match="pick">
</xsl:template>

<xsl:template match="effect">
</xsl:template>

<xsl:template match="pickups">
</xsl:template>

<xsl:template match="order">
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