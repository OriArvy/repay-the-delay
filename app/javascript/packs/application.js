import "bootstrap";

import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSelect2 } from '../plugins/init_select2';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css'

flatpickr("#ticket_expiry_date", { defaultDate: "today", altInput: true, altFormat: "F j, Y", dateFormat: "Y-m-d", });
previewImageOnFileSelect()
initSelect2();
