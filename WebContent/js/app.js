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
var vi = name.substring(1,name.length-1);
var vis = vi.split(',');
var ctx = document.getElementById('myChart').getContext('2d'); 
	var chart = new Chart(ctx, {  type: 'bar', // 
		data: { 
			labels: vis, 
			datasets: [{ label: '식당 방문수', 
			backgroundColor: 'rgb(255, 99, 132)', 
			borderColor: 'rgb(255, 99, 132)', 
			data: [2 ,10, 5,15] }] }, 
			});


    function insertEat()
    {
        var eat = $('#eat').val();
		console.log(eat)
        location.href='visit_control.jsp?action=insert&eat='+eat;
    }
    console.log(vis);