// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap";
import "../stylesheets/application"

// import and load opal ruby files
import init_app from 'opal_loader.rb';
init_app();
Opal.load('opal_loader');

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
 
require("jquery")

import CodeMirror from 'codemirror';
Rails.start()
Turbolinks.start()
ActiveStorage.start()
