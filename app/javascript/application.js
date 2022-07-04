// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs  
import "@hotwired/turbo-rails"
import "controllers"

const mobileMenu = document.getElementById("mobile-menu");
const menuButton = document.getElementById("menu-button");

menuButton.addEventListener("click", () => {
	mobileMenu.classList.toggle("hidden");
});