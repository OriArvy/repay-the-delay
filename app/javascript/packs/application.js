import "bootstrap";

import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../plugins/init_select2';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css'

import { initSweetalert } from '../plugins/init_sweetalert';

flatpickr("#ticket_expiry_date", { defaultDate: "today", altInput: true, altFormat: "F j, Y", dateFormat: "Y-m-d", });
previewImageOnFileSelect()
initSelect2();

initSweetalert('#sweet-alert-demo', {
  title: "Claim Submitted",
  text: "We will keep you updated via email",
  icon: "success"
});
