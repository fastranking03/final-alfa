 
// Handle size selection
const sizeButtons = document.querySelectorAll('.size-button');

sizeButtons.forEach(button => {

    button.addEventListener('click', function () {

        sizeButtons.forEach(btn => btn.setAttribute('data-selected', 'false'));
        sizeButtons.forEach(btn => btn.classList.remove('border-red-600', 'bg-red-100'));

        // Select the clicked size
        button.setAttribute('data-selected', 'true');
        button.classList.add('border-red-600', 'bg-red-100');

        // Update the selected size input
        document.getElementById('selected-size').value = button.getAttribute('data-size');
    });
});

document.getElementById('addToWishList').addEventListener('click', function (e) {
    e.preventDefault();
    alert('hii')

    const selectedSize = document.getElementById('selected-size').value;
    var message = document.getElementById("productAddedInCart");
    if (!selectedSize) {
        message.textContent = "Select product size.";
        message.style.display = "block";
            setTimeout(() => {
                message.style.display = "none"
            }, 4000)
        return;
    }

    let productData = {
        product_id: document.querySelector('input[name="product_id"]').value,
        product_name: document.querySelector('input[name="product_name"]').value,
        product_price: document.querySelector('input[name="product_price"]').value,
        quantity: document.querySelector('input[name="quantity"]').value,
        product_size: selectedSize,
        product_image: document.querySelector('input[name="product_image"]').value,
     };
   
    fetch('/add-to-wishlist', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(productData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href ='/my-wishlist'
        } else {
            alert('Failed to add product to cart.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

 
 


