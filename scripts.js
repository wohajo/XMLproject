document.getElementById("filter-button").addEventListener("click", filter)
document.getElementById("clear-button").addEventListener("click", clearFilters)

function filter() {
    var inputBrand = document.getElementById("search-brand");
    var inputModel = document.getElementById("search-model");
    var inputDetails = document.getElementById("search-detailed");

    var filterBrand = inputBrand.value.toLowerCase();
    var filterModel = inputModel.value.toLowerCase();
    var filterDetails = inputDetails.value.toLowerCase();
    
    var nodesBrand = document.getElementsByClassName('brand-search-target');
    var nodesModel = document.getElementsByClassName('model-search-target');
    var nodesDetails = document.getElementsByClassName('detailed-search-target');

    console.log("im working");
    
    for (i = 0; i < nodesBrand.length; i++) {
        if (nodesBrand[i].innerText.toLowerCase().includes(filterBrand) && nodesModel[i].innerText.toLowerCase().includes(filterModel) && nodesDetails[i].innerText.toLowerCase().includes(filterDetails)) {
            nodesBrand[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodesBrand[i].parentElement.parentElement.style.display = "none";
        }
    }
}

function clearFilters() {
    document.getElementById("search-brand").value = "";
    document.getElementById("search-model").value = "";
    document.getElementById("search-detailed").value = "";
    filter()
}