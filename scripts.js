document.getElementById("search-brand").addEventListener("keyup", filterProducts)
document.getElementById("search-product-id").addEventListener("keyup", filterProducts)
document.getElementById("search-model").addEventListener("keyup", filterProducts)
document.getElementById("search-detailed").addEventListener("keyup", filterProducts)
document.getElementById("clear-products-filter-button").addEventListener("click", clearProductsFilters)
document.getElementById("clear-products-filter-button").addEventListener("click", clearProductsFilters)

var removeProductButtons = document.getElementsByClassName("delete-button");
for (var i = 0; i < removeProductButtons.length; i++) {
    removeProductButtons[i].addEventListener("click", removeProduct, false)
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

var updateGuitarButtons = document.getElementsByClassName("update-button");
for (var i = 0; i < updateGuitarButtons.length; i++) {
    updateGuitarButtons[i].addEventListener("click", updateProduct, false)
}

function updateProduct() {
    var button = event.currentTarget;
    var brands = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("brand-search-target");
    var models = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("model-search-target");
    var detailedElement = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("detailed-search-target");

    brand = brands[0];
    model = models[0];
    detailed = detailedElement[0];

    if (brand.contentEditable == "true") {
        brand.contentEditable = "false";
        model.contentEditable = "false";
        detailed.contentEditable = "false";
        button.style.backgroundColor = "#ffad42";
    } else {
        brand.contentEditable = "true";
        model.contentEditable = "true";
        detailed.contentEditable = "true";
        button.style.backgroundColor = "red";
    }
}