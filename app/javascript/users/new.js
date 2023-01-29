document.addEventListener('DOMContentLoaded', () => {
  // csrf-tokenを取得
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const LIFF_ID = "1657853635-5P9JrXx3";

  liff.init({
    liffId: LIFF_ID
  })
  .then(() => {
    if (!liff.isLoggedIn()) {
      liff.login()
    }
  })
  .then(() => {
    const idToken = liff.getIDToken()
    console.log(idToken)
    const body =`idToken=${idToken}`
    const request = new Request('/users', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        'X-CSRF-Token': token
      },
      method: 'POST',
      body: body
    });

    fetch(request)
    .then(response => response.json())
    .then(data => {
      data_id = data
    })
  })
  .then(() => {
    if (!liff.isLoggedIn()) {
      liff.login();
    }
  })
})
