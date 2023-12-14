const pay = () => {
  const payjp = Payjp('pk_test_28e1eaae6bd3fb121abc6906'); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  let tokenCreated = false; // トークンが生成されたかどうかを追跡するフラグ

  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルトのフォーム送信を防止

    if (!tokenCreated) {
      payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
          // トークン生成エラーのハンドリング
        } else {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);

          tokenCreated = true; // トークンが生成されたことを記録
          form.submit(); // トークンが生成された後にフォームを送信
        }
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
      });
    }
  });
};

window.addEventListener("turbo:load", pay);
