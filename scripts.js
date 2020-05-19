function searchBrands() {
    var input = document.getElementById("search-brand");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('brand-search-target');
    
    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
            nodes[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodes[i].parentElement.parentElement.style.display = "none";
        }
    }
}

function searchModels() {
    var input = document.getElementById("search-model");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('model-search-target');
    
    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
            nodes[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodes[i].parentElement.parentElement.style.display = "none";
        }
    }
}

function searchDetailed() {
    var input = document.getElementById("search-detailed");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('detailed-search-target');
    
    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
            nodes[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodes[i].parentElement.parentElement.style.display = "none";
        }
    }
}

