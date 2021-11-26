window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.getElementById("navbar");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

var maxIndex = $("li.graph-bar").length;

for(var i=0; i<maxIndex; i++){
  var val = $("li.graph-bar").eq(i).attr('graph-val');
  $("li.graph-bar").eq(i).css({
    "left": (i+1)*80+"px"
  }).animate({
    "height":val+"%"
  },800);
}