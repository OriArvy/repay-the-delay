import "bootstrap";
import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../plugins/init_select2';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css'
import { initSweetalert } from '../plugins/init_sweetalert';

flatpickr("#ticket_expiry_date", { defaultDate: "today", altInput: true, altFormat: "F j, Y", dateFormat: "Y-m-d", });
flatpickr("#flat-time", { altInput: true, time_24hr: true, enableTime: true, altFormat: "F j, Y H:i", dateFormat: "Y-m-dTH:i", defaultDate: "today", defaultHour: 12, defaultMinute: 0, placeholder: "xxx"});


previewImageOnFileSelect()
initSelect2();

$('.carousel').carousel({
  interval: false
})


// ticket selector on claim show page
const ticket = document.querySelector('#claim_ticket_id')
if (ticket) {
  document.querySelector('#claim-ticket-select').addEventListener('change', (e) => {
    ticket.value = e.currentTarget.value
  })
}

// submission button on claim show page
const terms = document.querySelector('#terms')
const submission = document.querySelector('#sweet-alert-demo')
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
  text: "We will keep you updated via email.",
  icon: "success",
  buttons: false
});


// home page switch button
const fromStation = document.getElementById('from_station');
const toStation = document.getElementById('to_station');
const switchStation = document.getElementById('switch');

switchStation.addEventListener('click', () => {
    const fromVal = fromStation.value
    const toVal = toStation.value
    const fromText = fromStation.parentNode.querySelector('.select2-selection__rendered').innerText
    const toText = toStation.parentNode.querySelector('.select2-selection__rendered').innerText
    fromStation.value = toVal
    toStation.value = fromVal
    fromStation.parentNode.querySelector('.select2-selection__rendered').innerText = toText
    toStation.parentNode.querySelector('.select2-selection__rendered').innerText = fromText
  }
)

const fromStation1 = document.getElementById('from_station');
const toStation1 = document.getElementById('to_station');
const switchStation1 = document.getElementById('switch');
switchStation1.addEventListener('touchstart click', () => {
    const fromVal1 = fromStation1.value
    const toVal1 = toStation1.value
    const fromText1 = fromStation1.parentNode.querySelector('.select2-selection__rendered').innerText
    const toText1 = toStation1.parentNode.querySelector('.select2-selection__rendered').innerText
    fromStation1.value = toVal1
    toStation1.value = fromVal1
    fromStation1.parentNode.querySelector('.select2-selection__rendered').innerText = toText1
    toStation1.parentNode.querySelector('.select2-selection__rendered').innerText = fromText1
  }
)


// // homage page initiate search

let repayGif = document.querySelector(".transition").style.visibility = 'hidden';
const homeBtn = document.getElementById("my-btn");

homeBtn.addEventListener('click', () => {
  let repayGif = document.querySelector(".transition").style.visibility = 'visible';
})

homeBtn.addEventListener('touchstart click', () => {
  let repayGif = document.querySelector(".transition").style.visibility = 'visible';
})




