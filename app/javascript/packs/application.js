import "bootstrap";

import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../plugins/init_select2';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css'

flatpickr("#ticket_expiry_date", { defaultDate: "today", altInput: true, altFormat: "F j, Y", dateFormat: "Y-m-d", });
previewImageOnFileSelect()
initSelect2();

const ticket = document.querySelector('#claim_ticket_id')

if (ticket) {
  document.querySelector('#claim-ticket-select').addEventListener('change', (e) => {
    ticket.value = e.currentTarget.value
  })
}

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

