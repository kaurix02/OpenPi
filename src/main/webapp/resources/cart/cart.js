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

var buttons = document.getElementsByClassName("addPizza");
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
                /*var str = "[";
                var i = 0
                for (key in data.shoppingCart) {
                    if (i < data.shoppingCart.length - 1) {
                        str += "["+key + ": " + data.shoppingCart[key] + "]" + ", ";
                    } else {
                        str += "["+key + ": " + data.shoppingCart[key] + "]";
                    }
                    i++;
                }
                str += "]";
                document.getElementById("shoppingCart").innerHTML = str;*/
                location.reload();
            }
        });
    });
}

var buttons2 = document.getElementsByClassName("removePizza");
for (i = 0; i < buttons2.length; i++) {
    buttons2[i].addEventListener("click", function(event) {
        //console.log(document.getElementById("pizzaNaming"+event.target.id).value);
        $.ajax({
            type: "POST",
            url: "../cart/removeFromCart",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            mimeType: 'application/json',
            //dataType: 'json',
            data: JSON.stringify({
                id: 0,
                naming: document.getElementById("pizza" + event.target.id).innerHTML.split(" :")[0],
                description: "any"}),
            contentType: 'application/json',
            success: function(data) {
                /*var str = "[";
                 var i = 0
                 for (key in data.shoppingCart) {
                 if (i < data.shoppingCart.length - 1) {
                 str += "["+key + ": " + data.shoppingCart[key] + "]" + ", ";
                 } else {
                 str += "["+key + ": " + data.shoppingCart[key] + "]";
                 }
                 i++;
                 }
                 str += "]";
                 document.getElementById("shoppingCart").innerHTML = str;*/
                location.reload();
            }
        });
    });
}
/*
for (i = 0; i < elements.length; i++) {
    elements[i].addEventListener("click", function (event) {

    });
}*/

