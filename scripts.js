document.getElementById("search-brand").addEventListener("keyup", filterProducts)
document.getElementById("search-product-id").addEventListener("keyup", filterProducts)
document.getElementById("search-model").addEventListener("keyup", filterProducts)
document.getElementById("search-detailed").addEventListener("keyup", filterProducts)
document.getElementById("clear-products-filter-button").addEventListener("click", clearProductsFilters)
initializeButtons()

function initializeButtons() {
    var updateProductsButtons = document.getElementsByClassName("update-button");
    for (var i = 0; i < updateProductsButtons.length; i++) {
        updateProductsButtons[i].addEventListener("click", updateProduct, false)
    }

    var removeProductButtons = document.getElementsByClassName("delete-button");
    for (var i = 0; i < removeProductButtons.length; i++) {
        removeProductButtons[i].addEventListener("click", removeProduct, false)
    }
}

var addProductsButtons = document.getElementsByClassName("add-button");
for (var i = 0; i < addProductsButtons.length; i++) {
    addProductsButtons[i].addEventListener("click", addProduct, false)
}

function filterProducts() {
    var inputId = document.getElementById("search-product-id");
    var inputBrand = document.getElementById("search-brand");
    var inputModel = document.getElementById("search-model");
    var inputDetails = document.getElementById("search-detailed");

    var filterId = inputId.value.toLowerCase();
    var filterBrand = inputBrand.value.toLowerCase();
    var filterModel = inputModel.value.toLowerCase();
    var filterDetails = inputDetails.value.toLowerCase();

    var nodesId = document.getElementsByClassName('product-id-search-target');
    var nodesBrand = document.getElementsByClassName('brand-search-target');
    var nodesModel = document.getElementsByClassName('model-search-target');
    var nodesDetails = document.getElementsByClassName('detailed-search-target');

    for (i = 0; i < nodesBrand.length; i++) {
        if (nodesId[i].innerText.toLowerCase().includes(filterId)
            && nodesBrand[i].innerText.toLowerCase().includes(filterBrand)
            && nodesModel[i].innerText.toLowerCase().includes(filterModel)
            && nodesDetails[i].innerText.toLowerCase().includes(filterDetails)) {
            nodesBrand[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodesBrand[i].parentElement.parentElement.style.display = "none";
        }
    }
}

function clearProductsFilters() {
    document.getElementById("search-product-id").value = "";
    document.getElementById("search-brand").value = "";
    document.getElementById("search-model").value = "";
    document.getElementById("search-detailed").value = "";
    filterProducts();
}

function removeProduct() {
    event.currentTarget.parentElement.parentElement.parentElement.remove();
}

function updateProduct() {
    var button = event.currentTarget;
    var brands = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("brand-search-target");
    var models = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("model-search-target");
    var detailedElement = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("detailed-search-target");
    var prices = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("card-price-info");

    brand = brands[0];
    model = models[0];
    detailed = detailedElement[0];
    var price = prices[0].firstElementChild.firstElementChild;

    if (brand.contentEditable == "true") {
        brand.contentEditable = "false";
        model.contentEditable = "false";
        detailed.contentEditable = "false";
        price.setAttribute("readOnly", "true");
        button.style.backgroundColor = "#ffad42";
    } else {
        brand.contentEditable = "true";
        model.contentEditable = "true";
        detailed.contentEditable = "true";
        price.removeAttribute("readOnly");
        button.style.backgroundColor = "red";
    }
}

function addProduct() {
    var buttonId = event.currentTarget.id;
    var detailedDiv
    var idPrefix
    var productsElement

    if(buttonId == "add-guitar-button") {
        detailedDiv = '<div class="card-detailed-info"><p class="detailed-search-target">pickups: </p></div>'
        idPrefix = "gui-"
        productsElement = "guitars"
    } else if(buttonId == "add-bass-button") {
        detailedDiv = '<div class="card-detailed-info"><p class="detailed-search-target">pickups: </p></div>'
        idPrefix = "bas-"
        productsElement = "basses"
    } else if (buttonId == "add-amplifier-button") {
        detailedDiv = '<div class="card-detailed-info">speakers: <p class="detailed-search-target"> </p></div>'
        idPrefix = "amp-"
        productsElement = "amplifiers"
    } else if (buttonId == "add-strings-button") {
        detailedDiv = '<div class="card-detailed-info">size: <p class="detailed-search-target"> </p></div>'
        idPrefix = "spk-"
        productsElement = "strings"
    } else if (buttonId == "add-picks-button") {
        detailedDiv = '<div class="card-detailed-info">width: <p class="detailed-search-target"> </p></div>'
        idPrefix = "pic-"
        productsElement = "picks"
    } else {
        detailedDiv = '<div class="card-detailed-info"><p class="detailed-search-target">Type of effect: <br/>Voltage required: </p></div>'
        idPrefix = "efc-"
        productsElement = "effects"
    }

    // product card
    var productCardDiv = document.createElement("div")
    productCardDiv.classList.add("product-card")

    // id div
    var cardIdDiv = document.createElement("div")
    productCardDiv.appendChild(cardIdDiv)
    cardIdDiv.classList.add("card-id")
    
    var cardIdP = document.createElement("p")
    cardIdDiv.appendChild(cardIdP)
    cardIdP.classList.add("product-id-search-target")
    var newIdNumber = document.getElementById(productsElement).childElementCount + 1
    cardIdP.innerText = idPrefix + newIdNumber
    // title div  
    productCardDiv.innerHTML += '<div class="card-title-info"> brand: <p class="brand-search-target">New item</p> model: <p class="model-search-target">New model</p></div>'
    // detailed info
    productCardDiv.innerHTML += detailedDiv
    // price
    productCardDiv.innerHTML += '<div class="card-price-info">price: <p><input readonly="true" class="price-input" type="number" value="0" oninput="validity.valid||(value=\'\');"/></p></div>'
    // buttons 
    productCardDiv.innerHTML += '<div class="product-buttons"><p class="img-paragraph"><button class="product-button update-button update-button-guitar"><img src="https://img.icons8.com/material-rounded/24/000000/edit.png"/></button></p><p class="img-paragraph"><button class="product-button delete-button"><img src="https://img.icons8.com/material-rounded/24/000000/trash.png"/></button></p></div>'

    var products = document.getElementById(productsElement);
    products.appendChild(productCardDiv);

    // buttons to update
    var children = productCardDiv.childNodes
    var buttonsP = children[children.length - 1].childNodes
    var imgDiv1 = buttonsP[0].childNodes
    var imgDiv2 = buttonsP[1].childNodes
    imgDiv1[0].addEventListener("click", updateProduct, false)
    imgDiv2[0].addEventListener("click", removeProduct, false)
}