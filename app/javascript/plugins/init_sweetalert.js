import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click' || 'touchstart', () => {
      swal(options);
    });
    swalButton.addEventListener('submit', () => {
      swal(options);
    });
  }
}

export { initSweetalert };
