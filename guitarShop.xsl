<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:strip-space elements="price"/>

<xsl:template match="/">
    <html>
        <body>
            <div class="container">
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
            </div>
        </body>
    </html>
</xsl:template>

<xsl:template match="guitar">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p><xsl:apply-templates select="./pickups"/></p>
        </div>
        <div class="card-price-info">
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="bass">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p><xsl:apply-templates select="./pickups"/></p>
        </div>
        <div class="card-price-info">
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="amplifier">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p><xsl:apply-templates select="./speakers"/></p>
        </div>
        <div class="card-price-info">
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="pick">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p>Width: <xsl:apply-templates select="./@width"/></p>
        </div>
        <div class="card-price-info">
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="stringPack">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
        </div>
        <div class="card-detailed-info">
            <p>size: <xsl:value-of select="concat(./@sizeFrom, concat('-', ./@sizeTo))"/></p>
        </div>
        <div class="card-price-info">
            <p>price: <xsl:value-of select="./price"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="effect">
    <div class="product-card">
        <div class="card-title-info">
            <p>brand: <xsl:value-of select="./brand"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p>Type of effect: <xsl:value-of select="./@effectType"/></p>
            <p>Voltage required: <xsl:value-of select="./@voltage"/></p>
        </div>
        <div class="card-price-info">
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
    <div class="order">
        <xsl:apply-templates select="orderedItems"/>
        <xsl:apply-templates select="address"/>
        <xsl:apply-templates select="person"/>
    </div>
</xsl:template>

<xsl:template match="orderedItem">
    <!-- <xsl:value-of select="./@idref"/> -->
</xsl:template>

<xsl:template match="address">
    <div class="address">
        Address: <xsl:value-of select="concat(./street, ' ')"/>
        <xsl:choose>
            <xsl:when test="boolean(./flat)">
                <xsl:value-of select="concat(./building, concat('/', concat(./flat, ' ')))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(./building, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="concat(./postcode, concat(' ', ./city))"/>
    </div>
</xsl:template>

<xsl:template match="person">
    <div class="personal-info">
        <xsl:value-of select="concat(./name, concat(' ', ./surname))"/>
        <xsl:value-of select="concat(' (', concat(./phoneNumber, ')'))"/>
    </div>
</xsl:template>
    
</xsl:stylesheet>