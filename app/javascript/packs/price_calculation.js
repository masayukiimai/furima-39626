document.addEventListener('DOMContentLoaded', function(){
  const priceInput = document.getElementById('item-price');
  const addTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value;

    const fee = Math.floor(inputValue * 0.1); // 10%の手数料
    const gains = inputValue - fee;

    addTax.textContent = fee;
    profit.textContent = gains;
  });
});
