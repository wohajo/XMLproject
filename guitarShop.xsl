<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:strip-space elements="price"/>

<xsl:template match="/">
    <html>
        <body>
            <div>
                <h1>Guitar Shop</h1>
            </div>
            <div>
                <h2>Products</h2>
                <h3>Guitars</h3>
                <xsl:for-each select="guitarShop/products/guitars">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Basses</h3>
                <xsl:for-each select="guitarShop/products/basses">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Amplifiers</h3>
                <xsl:for-each select="guitarShop/products/amplifiers">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Strings</h3>
                <xsl:for-each select="guitarShop/products/stringPacks">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Picks</h3>
                <xsl:for-each select="guitarShop/products/picks">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <h3>Effects</h3>
                <xsl:for-each select="guitarShop/products/effects">
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
                        <p>price: <xsl:value-of select="./price"/></p>
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
                        <p>price: <xsl:value-of select="./price"/></p>
                    </div>
                </div>
</xsl:template>

<xsl:template match="amplifier">
    <div>
        <div>
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
            <p><xsl:apply-templates select="./speakers"/></p>
        </div>
        <div>
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="pick">
    <div>
        <div>
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div>
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="stringPack">
    <div>
        <div>
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>size: <xsl:value-of select="concat(./@sizeFrom, concat('-', ./@sizeTo))"/></p>
        </div>
        <div>
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="effect">
    <div>
        <div>
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div>
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="pickups">
    <p>pickups: <xsl:value-of select="./brand"/> (<xsl:value-of select="./type"/>)</p>
</xsl:template>

<xsl:template match="speakers">
    <p>speakers: <xsl:value-of select="./@quantity"/>x<xsl:value-of select="concat(./brand, ' ')"/><xsl:value-of select="./model"/> (<xsl:value-of select="./@radius"/>")</p>
</xsl:template>

<xsl:template match="order">

</xsl:template>
    <xsl:template match="address"/>
    <xsl:template match="person"/>
</xsl:stylesheet>