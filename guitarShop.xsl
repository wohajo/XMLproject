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
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <head>
            <title>Guitar Shop</title>
        </head>
        <body>
            <div class="container">
                    <h1 class="main-header">Guitar Shop</h1>
                <div>
                    <h2 class="sub-main-header">Products</h2>
                    <div class="search-boxes-wrapper">
                        <h4>Filters</h4>
                        <div class="filter-field">ID: <input type="text" id="search-product-id" placeholder="Provide a product's id" title="search in products"/></div>
                        <div class="filter-field">BRAND: <input type="text" id="search-brand" placeholder="Provide a brand's name" title="search in products"/></div>
                        <div class="filter-field">MODEL: <input type="text" id="search-model" placeholder="Provide a model's name" title="search in products"/></div>
                        <div class="filter-field">DETAILS: <input type="text" id="search-detailed" placeholder="Provide a detailed information" title="search in products"/></div>
                        <div class="search-button-wrapper"><button type="button" class="search-button" id="clear-products-filter-button">Clear filters</button></div>
                    </div>
                    <h3 class="sub-header">Guitars</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-guitar-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="guitars">
                        <xsl:for-each select="guitarShop/products/guitars">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Basses</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-bass-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="basses">
                        <xsl:for-each select="guitarShop/products/basses">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Amplifiers</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-amplifier-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="amplifiers">
                        <xsl:for-each select="guitarShop/products/amplifiers">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Strings</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-strings-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="strings">
                        <xsl:for-each select="guitarShop/products/stringPacks">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Picks</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-picks-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="picks">
                        <xsl:for-each select="guitarShop/products/picks">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                    <h3 class="sub-header">Effects</h3>
                    <div class="add-button-wrapper">
                        <button class="add-button" id="add-effects-button">
                            <img src="https://img.icons8.com/android/48/000000/plus.png"/>
                        </button>
                    </div>
                    <div class="products" id="effects">
                        <xsl:for-each select="guitarShop/products/effects">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                </div>
                <div>
                    <h2 class="sub-main-header">Orders</h2>
                    <div class="search-boxes-wrapper">
                        <h4>Filters</h4>
                        <div class="filter-field">ID: <input type="text" id="search-order-id" placeholder="Provide an orders's id" title="search orders"/></div>
                        <div class="filter-field">ITEMS: <input type="text" id="search-ordered-item" placeholder="Provide an item's name" title="search products"/></div>
                        <div class="filter-field">ADDRESS: <input type="text" id="search-address" placeholder="Provide a address" title="search address"/></div>
                        <div class="filter-field">PERSON: <input type="text" id="search-person" placeholder="Provide a personal information" title="search person"/></div>
                        <div class="search-button-wrapper"><button type="button" class="search-button" id="clear-addresses-filter-button">Clear filters</button></div>
                    </div>
                    <div id="orders">
                        <xsl:for-each select="guitarShop/orders">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </div>
                </div>
            </div>
            <div class="footer">
                <a href="https://icons8.com/icon/86374/edit">Edit icon by Icons8</a><br/>
                <a href="https://icons8.com/icon/85194/trash">Trash icon by Icons8</a><br/>
                <a href="https://icons8.com/icon/3220/plus">Plus icon by Icons8</a>
            </div>
            <script src="scripts.js"><br/>
            </script>
        </body>
    </html>
</xsl:template>

<xsl:template match="guitar">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <xsl:choose>
            <xsl:when test="boolean(./pickups)">
                <div class="card-detailed-info">
                    <xsl:apply-templates select="./pickups"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card-detailed-info">
                    <p class="detailed-search-target">Acoustic</p>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-guitar"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="bass">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <xsl:choose>
            <xsl:when test="boolean(./pickups)">
                <div class="card-detailed-info">
                    <xsl:apply-templates select="./pickups"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="card-detailed-info">
                    <p class="detailed-search-target">Acoustic</p>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-bass"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="amplifier">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <xsl:apply-templates select="./speakers"/>
        </div>
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-amplifier"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="pick">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            Width: <p class="detailed-search-target"><xsl:apply-templates select="./@width"/></p>
        </div>
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-pick"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="stringPack">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            size: <p class="detailed-search-target"><xsl:value-of select="concat(./@sizeFrom, concat('-', ./@sizeTo))"/></p>
        </div>
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-strings"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="effect">
    <div class="product-card">
        <div class="card-id">
            <p class="product-id-search-target"><xsl:value-of select="./@id"/></p>
        </div>
        <div class="card-title-info">
            brand: <p class="brand-search-target"><xsl:value-of select="./brand"/></p>
            model: <p class="model-search-target"><xsl:value-of select="./model"/></p>
        </div>
        <div class="card-detailed-info">
            <p class="detailed-search-target">Type of effect: <xsl:value-of select="./@effectType"/><br/>
                Voltage required: <xsl:value-of select="./@voltage"/>
            </p>
        </div>
        <div class="card-price-info">
            price:<p>
                <input readonly="true" class="price-input" type="number" value="{./price}"/>
            </p>
        </div>
        <div class="product-buttons">
            <p class="img-paragraph"><button class="product-button update-button update-button-effect"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p>
            <p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="pickups">
    <p class="detailed-search-target">pickups: <xsl:value-of select="./brand"/> (<xsl:value-of select="./type"/>)</p>
</xsl:template>

<xsl:template match="speakers">
    <p class="detailed-search-target">speakers: <xsl:value-of select="./@quantity"/>x<xsl:value-of select="concat(./brand, ' ')"/><xsl:value-of select="./model"/> (<xsl:value-of select="./@radius"/>")</p>
</xsl:template>

<xsl:template match="order">
    <div class="order">
        <div class="order-id">
            <p class="order-id-search-target"><xsl:value-of select="./@orderId"/></p>
        </div>

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

        <h5 class="total_price"> Total price: <p><xsl:value-of select="concat(sum(exsl:node-set($totalPrice)/number), ' pln')"/></p></h5>
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
        <xsl:value-of select="concat(./street, ' ')"/>
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