document.getElementById("search-brand").addEventListener("keyup", filterProducts)
document.getElementById("search-model").addEventListener("keyup", filterProducts)
document.getElementById("search-detailed").addEventListener("keyup", filterProducts)
document.getElementById("clear-products-filter-button").addEventListener("click", clearProductsFilters)

var removeProductButtons = document.getElementsByClassName("delete-button");
for (var i = 0; i < removeProductButtons.length; i++) {
    removeProductButtons[i].addEventListener("click", removeProduct, false)
}

function filterProducts() {
    var inputBrand = document.getElementById("search-brand");
    var inputModel = document.getElementById("search-model");
    var inputDetails = document.getElementById("search-detailed");

    var filterBrand = inputBrand.value.toLowerCase();
    var filterModel = inputModel.value.toLowerCase();
    var filterDetails = inputDetails.value.toLowerCase();
    
    var nodesBrand = document.getElementsByClassName('brand-search-target');
    var nodesModel = document.getElementsByClassName('model-search-target');
    var nodesDetails = document.getElementsByClassName('detailed-search-target');
    
    for (i = 0; i < nodesBrand.length; i++) {
        if (nodesBrand[i].innerText.toLowerCase().includes(filterBrand) 
        && nodesModel[i].innerText.toLowerCase().includes(filterModel) 
        && nodesDetails[i].innerText.toLowerCase().includes(filterDetails)) {
            nodesBrand[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodesBrand[i].parentElement.parentElement.style.display = "none";
        }
    }
}

function clearProductsFilters() {
    document.getElementById("search-brand").value = "";
    document.getElementById("search-model").value = "";
    document.getElementById("search-detailed").value = "";
    filterProducts();
}

function removeProduct() {
    event.currentTarget.parentElement.parentElement.parentElement.remove();
}