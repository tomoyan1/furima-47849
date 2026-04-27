
const price = () => {
  const priceInput = document.getElementById("item-price");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");

      const tax_fee =  Math.floor(inputValue * 0.1);
      addTaxPrice.innerHTML = tax_fee;
      profit.innerHTML = inputValue - tax_fee;

    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);