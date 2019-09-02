import "bootstrap";
import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../plugins/init_select2';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css'
import { initSweetalert } from '../plugins/init_sweetalert';

flatpickr("#ticket_expiry_date", { defaultDate: "today", altInput: true, altFormat: "F j, Y", dateFormat: "Y-m-d", });
flatpickr("#flat-time", { altInput: true, time_24hr: true, enableTime: true, altFormat: "F j, Y", dateFormat: "Y-m-dTH:i", defaultDate: "today", defaultHour: 3, defaultMinute: 0,});


previewImageOnFileSelect()
initSelect2();


// ticket selector on claim show page
const ticket = document.querySelector('#claim_ticket_id')
if (ticket) {
  document.querySelector('#claim-ticket-select').addEventListener('change', (e) => {
    ticket.value = e.currentTarget.value
  })
}

// submission button on claim show page
const terms = document.querySelector('#terms')
const submission = document.querySelector('#submission')
if (terms) {
  document.querySelector('#terms').addEventListener('change', (e) => {
    if (submission.disabled) {
      submission.disabled = false
    } else {
      submission.disabled = true
    }
  })
}

// initiating submission on claim show page
initSweetalert('#sweet-alert-demo', {
  title: "Claim Submitted",
  text: "We will keep you updated via email",
  icon: "success",
  buttons: false
});

// homage page initiate search
initSweetalert('#my-btn', {
  icon: "https://media.giphy.com/media/11l5hkwH1zcsBG/giphy.gif",
  buttons: false,
  customClass: 'sweet-gif',
  width: '100px'
});
