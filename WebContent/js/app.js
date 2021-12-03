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
var eatCount = {"시골집":0,"우마이":0,"닥터로빈":0,"전주식당":0,"부대통령뚝배기":0,"고척돈까스":0}
var vi = name.substring(1,name.length-1);
var vis = vi.split(',');
var sh = []
var visitC = []
for (var i in vis){	
	if(vis[i].trim() in eatCount){
		eatCount[vis[i].trim()] +=1
	}
}
for (var key in eatCount) {
  sh.push(key)
  visitC.push(eatCount[key])
}

var ctx = document.getElementById('myChart').getContext('2d'); 
	var chart = new Chart(ctx, {  type: 'bar', // 
		data: { 
			labels: sh, 
			datasets: [{ label: '식당 방문수', 
			backgroundColor: 'rgb(255, 99, 132)', 
			borderColor: 'rgb(255, 99, 132)', 
			data: visitC}] }, 
			});


    function insertEat()
    {
        var eat = $('#eat').val();
        location.href='visit_control.jsp?action=insert&eat='+eat;
    }
