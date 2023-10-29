function setupPriceCalculation() {
  const priceInput = document.getElementById('item-price');
  const addTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return; // 価格入力フィールドが存在しない場合は終了

  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value;

    const fee = Math.floor(inputValue * 0.1); // 10%の手数料
    const gains = inputValue - fee;

    addTax.textContent = fee;
    profit.textContent = gains;
  });
}


window.addEventListener('turbo:load', setupPriceCalculation);
export default setupPriceCalculation;

