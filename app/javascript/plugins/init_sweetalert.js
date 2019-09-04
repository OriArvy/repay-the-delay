import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
    swalButton.addEventListener('touchstart click', () => {
      swal(options);
    });
    swalButton.addEventListener('submit', () => {
      swal(options);
    });
  }
}





export { initSweetalert };
