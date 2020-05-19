function searchProducts() {
    var input = document.getElementById("search-products");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName("product-search-target");
    
    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
            nodes[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            nodes[i].parentElement.parentElement.style.display = "none";
        }
    }
}
