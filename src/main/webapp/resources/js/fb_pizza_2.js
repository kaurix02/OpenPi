/**
 * Created by Anna on 28.03.2016.
 */
window.fbAsyncInit = function() {
    FB.init({
        appId      : '1761793507390965',
        xfbml      : true,
        version    : 'v2.5'
    });

    // ADD ADDITIONAL FACEBOOK CODE HERE
};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


var getFact = function(getNextId) {
	if(navigator.onLine){
    var nextId = null
    if (getNextId) {
        var nextId = parseInt(window.location.hash.replace("#", "")) + 1;
    }else
    {
        var nextId = window.location.hash.replace("#", "")
    }
    var url = window.location.origin  + "/OpenPi/funpizzafacts/iwantsomefact?id=" + nextId;
    
    $.ajax({
        type: "GET",
        url: url,
        success: function (response) {
            var url = window.location.origin  + "/OpenPi/funpizzafacts#" + response.id;
            history.pushState(response, null, url);
            document.getElementById("fun-fact").innerHTML = response.fact;
            
        },
        error: function (response) {
            console.log(response);
        },
        dataType: "json",
        contentType: 'application/json; charset=utf-8'
    });
    }
	else{
		document.getElementById("fun-fact").innerHTML = "You only need the 'net to order a pizza. We hope you are enjoying a delicious pizza right now!";
	}
};
var getFactWait = function(){
	setInterval(function(){
		getFact(true);},10000);
};
var currentState = history.state;
if (!history.state){
    window.location = '#';
}
//getFact(false);
getFactWait();
window.addEventListener('popstate', function(event)
{
    if(history.state){
        document.getElementById("fun-fact").innerHTML = history.state.fact;
    }
});
window.addEventListener('pushstate', function(event)
{
    if(history.state){
        document.getElementById("fun-fact").innerHTML = history.state.fact;
    }
});


$('[data-toggle="tooltip"]').tooltip();