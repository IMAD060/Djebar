const gauche = document.getElementById("gauche");
const droite = document.getElementById("droite");
const images = document.querySelectorAll(".image");
var contenue = document.getElementById("contenue");

let p = 0;

function avant(){
    p = (p+1)%images.length;
    miseajour();

}
function apres(){
    p = (p - 1 + images.length)%images.length;
    miseajour();
}
function miseajour(){
    var x = - p * 100;
    contenue.style.transform = `translateX(${x}vw)`;
}
gauche.addEventListener("click", avant);
droite.addEventListener("click", apres);

setInterval(avant, 4000); 

// 2 eme carousel

var g = document.getElementById("g");
var d = document.getElementById("d");
var content = document.getElementById("content");
var imags = document.querySelectorAll(".imag")


let Index = 0;

function nextSlide() {
    Index = (Index + 1) % imags.length;
    updateCarousel();
}

function prevSlide() {
    Index = (Index - 1 + imags.length) % imags.length;
    updateCarousel();
}

function updateCarousel() {
    var translateX = -Index * 200;
    content.style.transform = `translateX(${translateX}px)`;    
}

d.addEventListener('click', nextSlide);
g.addEventListener('click', prevSlide);

setInterval(nextSlide, 3000); 

function toggleMenu() {
    var menuList = document.querySelector('.menu-list');
    menuList.classList.toggle('active');

    var masq = document.querySelector('.masq');
    masq.classList.toggle('active');
}


var contenu = document.querySelector(".deuxieme");
var contenus = document.querySelector(".deuxiemes");
var choixicon = document.querySelector(".choixicon");

var hauteurpage = window.innerHeight;
// var windowHeight = window.innerHeight;

function checkScroll() {
    var contentTop = contenu.getBoundingClientRect().top;
    var contentTops = contenus.getBoundingClientRect().top;
    var DistanceHautDeElement = choixicon.getBoundingClientRect().top;

    if (contentTop < hauteurpage - 500) { // Réglez la valeur de déclenchement en fonction de votre disposition
        contenu.style.opacity = "1";
        contenu.style.transform = "translateY(-100px)";
    }
    if (contentTops < hauteurpage - 400) { // Réglez la valeur de déclenchement en fonction de votre disposition
        contenus.style.opacity = "1";
        contenus.style.transform = "translateY(-100px)";
    }
    if (DistanceHautDeElement < hauteurpage - 400) { // Réglez la valeur de déclenchement en fonction de votre disposition
        choixicon.style.opacity = "1";
        choixicon.style.transform = "translateY(-50px)";
    }
}

window.addEventListener("scroll", checkScroll);









