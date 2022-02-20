/*global $*/
$(document).on('turbolinks:load', function () {
    $('.header-icon').on('click',function () {
        $('.nav-card').toggleClass("d-none");
    });
});
