import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      setTimeout( function () {
        document.querySelector(".edit_claim").submit();
      }, 3000)
      swal(options);
    });
    // swalButton.addEventListener('touchstart click', () => {
    //   swal(options);
    // });
    swalButton.addEventListener('submit', () => {
      swal(options);
    });
  }
}

// homeBtn.addEventListener('click', (event) => {
//   event.preventDefault();
//   repayGif.style.display = 'inherit'
//   setTimeout( function () {
//     form.submit();
//   }, 3000)
// })





export { initSweetalert };
