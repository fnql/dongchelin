const images = [
    "place303su.jpg",
    "홍콩반점.jpg",
];

const backgroundImage = images[Math.floor(Math.random()*images.length)];

const background = document.getElementById('main-header');

background.style.background-image : `linear-gradient( rgba(0,0,0, 0.5), rgba(0,0,0, 0.5) ), url('img/${backgroundImage}')`;