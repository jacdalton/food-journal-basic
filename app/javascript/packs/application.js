/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { calcCalories } from '../components/calculator';

initUpdateNavbarOnScroll();
    
document.addEventListener('turbolinks:load', function() {
  const calculateBtn = document.getElementById('calculate');
  if(calculateBtn) {
    calculateBtn.addEventListener('click', calcCalories);
  }
});


initSweetalert('#delete-btn', {
  title: "Are you sure?",
  text: "This will delete the food and all remove it from all entries",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});