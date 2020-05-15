<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="exsl"
                version="1.0">
<xsl:output method="html"/>

<xsl:key name="orderedItemKey" match="guitarShop/products/guitars/guitar | guitarShop/products/basses/bass | guitarShop/products/amplifiers/amplifier | guitarShop/products/picks/pick | guitarShop/products/stringPacks/stringPack | guitarShop/products/effects/effect" use="@id"/>

<xsl:template match="/">
    <html>
        <link rel="stylesheet" type="text/css" href="styles.css"/>
        <head>
            <title>Guitar Shop</title>
        </head>
        <body>
            <div class="container">
                    <h1 class="main-header">Guitar Shop</h1>
                <div>
                    <h2 class="sub-main-header">Products</h2>
                    <h3 class="sub-header">Guitars</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/guitars">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Basses</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/basses">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Amplifiers</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/amplifiers">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Strings</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/stringPacks">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Picks</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/picks">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Effects</h3>
                    <div class="products">
                        <xsl:for-each select="guitarShop/products/effects">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                </div>
                <div>
                    <h2 class="sub-main-header">Orders</h2>
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
        <xsl:choose>
            <xsl:when test="boolean(./pickups)">
                <div class="card-detailed-info">
                    <p><xsl:apply-templates select="./pickups"/></p>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card-detailed-info">
                    <p>Acoustic</p>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        
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
        <xsl:choose>
            <xsl:when test="boolean(./pickups)">
                <div class="card-detailed-info">
                    <p><xsl:apply-templates select="./pickups"/></p>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card-detailed-info">
                    <p>Acoustic</p>
                </div>
            </xsl:otherwise>
        </xsl:choose>
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
            <p>model: <xsl:value-of select="./model"/></p>
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
        <div class="orderedItems">
            <table>
                <xsl:apply-templates select="orderedItems"/>
            </table>
        </div>

        <xsl:apply-templates select="address"/>
        <xsl:apply-templates select="person"/>

        <xsl:variable name="totalPrice">
            <xsl:for-each select="./orderedItems/orderedItem">
                <number>
                    <xsl:value-of select="key('orderedItemKey',@idref)/price"/>
                </number>
            </xsl:for-each>
        </xsl:variable>

        <h5 class="total_price"> Total price: <xsl:value-of select="concat(sum(exsl:node-set($totalPrice)/number), ' pln')"/></h5>
    </div>
</xsl:template>

<xsl:template match="orderedItem">
        <xsl:for-each select="key('orderedItemKey',@idref)">
            <tr>
                <td><xsl:value-of select="./brand"/></td>
                <td><xsl:value-of select="./model"/></td>
                <td><xsl:value-of select="./price"/></td>
            </tr>
        </xsl:for-each>
</xsl:template>

<xsl:template match="address">
    <div class="address">
        Address: <xsl:value-of select="concat(./street, ' ')"/>
        <xsl:choose>
            <xsl:when test="boolean(./flat)">
                <xsl:value-of select="concat(./building, '/', ./flat, ' ')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(./building, ', ')"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="concat(./postcode, ' ', ./city)"/>
    </div>
</xsl:template>

<xsl:template match="person">
    <div class="personal-info">
        <xsl:value-of select="concat(./name, ' ', ./surname)"/>
        <xsl:value-of select="concat(' (', ./phoneNumber, ')')"/>
    </div>
</xsl:template>
    
</xsl:stylesheet>