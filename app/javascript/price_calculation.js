function calculation () {
  const itemPrice = document.getElementById("item-price");
  const calcAddTaxPrice = document.getElementById("add-tax-price");
  const calcProfit = document.getElementById("profit");

  itemPrice.addEventListener("input", () => {
    const priceValue = itemPrice.value
    const taxPriceValue = Math.floor(priceValue * 0.1);
    calcAddTaxPrice.innerHTML = taxPriceValue;
    calcProfit.innerHTML = priceValue - taxPriceValue;
  });
};

window.addEventListener("load", calculation); 