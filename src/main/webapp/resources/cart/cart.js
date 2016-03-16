/*$("button").each(function(){
    this.click(function(event) {
        console.log(event.target.id);
        $.ajax({
            type: "POST",
            url: "addToCart",
            data: JSON.stringify({ id: event.target.id, naming: $("#pizzaNaming"+event.target.id).val(), description: $("#pizzaDescription"+event.target.id).val()}),
            contentType: 'application/json'
        });
    });
});*/

var buttons = document.getElementsByTagName("button");
for (i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", function(event) {
        //console.log(document.getElementById("pizzaNaming"+event.target.id).value);
        $.ajax({
            type: "POST",
            url: "../cart/addToCart",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            mimeType: 'application/json',
            //dataType: 'json',
            data: JSON.stringify({
                id: event.target.id,
                naming: document.getElementById("pizzaNaming"+event.target.id).innerHTML,
                description: document.getElementById("pizzaDescription"+event.target.id).innerHTML}),
            contentType: 'application/json',
            success: function(data) {
                alert(data.naming);
            }
        });

    });
}
/*
for (i = 0; i < elements.length; i++) {
    elements[i].addEventListener("click", function (event) {

    });
}*/

