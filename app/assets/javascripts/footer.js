
var ready = function() {

    $(".news-item").hover(function () {
        $(this).toggleClass("news-hover");
    });

};







$(document).ready(ready);
$(document).on('page:load', ready);