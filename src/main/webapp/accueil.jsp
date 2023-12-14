<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BiblioTech</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a23cd0ef5c.js" crossorigin="anonymous"></script>
</head>

    <header>
        <a href="index.html"><img src="logo.jpg" width="200" alt=""></a>
        <span class="masq" onclick="toggleMenu()"><i class="fa-solid fa-bars"></i></span>
        <ul class="menu-list">
            <li>Accueil</li>
            <li>Ouvrages</li>
          	<li>Memoires</li>
            <li>A propos de nous</li>
        </ul>
        <a class="contacte" href="Login.jsp">Se Connecter</a>
    </header>

    <section class="carousel">
        <div class="contenue" id="contenue">
            <img class="image" src="images/réussir son projet de portail web de bibliothèque.webp" alt="">
            <img class="image" src="images/carae-nantes-bibliotheque.jpg" alt="">
            <img class="image" src="images/depositphotos_9831262-stock-photo-young-woman-with-his-laptop.jpg" alt="">
        </div>
        <img id="gauche" src="images/1200px-Ic_chevron_left_48px.svg.png" alt="">
        <img id="droite" src="images/1200px-Ic_chevron_left_48px.svg.png" alt="">
        <div class="cover">
            <h1><span style="color: white;">Biblio</span><span style="color: orange;">Tech</span></h1>
            <p style="margin-bottom: 10px;">Une bibliothéque bien gérée </p>
            <p style="margin-top: 0;">pour une éducation bien menée.</p>
        </div>
    </section>

    <section class="deuxieme">
        <div class="pict">
            <div class="img">
                <img src="images(1).jpeg" alt="bateau">
            </div>
        </div>
        <div class="txt">
            <h1>A propos</h1>
            <p><span style="color: orange;">BiblioTech  </span>Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Voluptates veniam aspernatur soluta? Quo voluptatem odit, aspernatur distinctio mollitia laboriosam cum dolores doloremque 
             repudiandae facere nobis delectus corporis amet dolorem quia?
            </p>
            <a href="#">En Savoir Plus</a>
        </div>
    </section>

    <section class="deuxiemes">
        <div class="txts">
            <h1>Etudiant externe</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Voluptates veniam aspernatur soluta? Quo voluptatem odit, aspernatur distinctio mollitia laboriosam cum dolores doloremque 
             repudiandae facere nobis delectus corporis amet dolorem quia?
            </p>
            <a href="deminsci.jsp">S'inscrire</a>
        </div>
        <div class="picts">
            <div class="imgs">
                <img src="pexels-alexander-hamilton-18384464.jpg" alt="bateau">
            </div>
        </div>
    </section>

    <div class="choix">
        <div class="p">
            <img src="images/pexels-andrea-piacquadio-789822.jpg" alt="">
        </div>
        <div class="choisir">
            <h1 style="font-size: 3em;">Pourquoi choisir <span style="color:rgb(4, 167, 255);">BiblioTech ?</span></h1>
            <p style="font-size: 1.4em;">Lorsque vous choisissez BiblioTech comme une platforme de gestion de bibliotheque,<br> vous bénéficiez de nombreux
                avantages</p>
            <div class="choixicon">
                <div class="a" style="width: 20vw;">
                    <img src="images/qualite1-22.png" width="70" alt="">
                    <h3>Garantissant ainsi la conformité et la fiabilité</h3>
                </div>
                <div class="b" style=" width: 20vw;">
                    <img src="images/selectionner2-86.png" width="70" alt="">
                    <h3>Emprunter des ouvrages et memoires de fin de cycle en ligne</h3>
                </div>
                <div class="c" style=" width: 20vw;">
                    <img src="images/diplome1-61.png" width="70" alt="">
                    <h3>prolonger et restituer des ouvrages et memoires en ligne</h3>
                    
                </div>
                <div class="d" style="width: 20vw;">
                    <img src="images/bouclier1-35.png" width="70" alt="">
                    <h3>reservee des ouvrages et memoires en ligne</h3>
                </div>
            </div>
        </div>
    </div>

    <section>
        <div class="carou">
            <h1>Exemplaires</h1>
            <div class="content" id="content">
                <div> <img class="imag" src="images/183899_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/13550_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/339447_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/454590_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/472290_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/515472_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/677307_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/717834_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/724029_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/825653_05-09-2023.png" alt=""> </div>
                <div> <img class="imag" src="images/177033_05-09-2023.jpeg" alt=""> </div>
                <div> <img class="imag" src="images/612793_05-09-2023.jpg" alt=""> </div>
            </div>
            <img src="images/1200px-Ic_chevron_left_48px.svg.png" id="g" alt="">
            <img src="images/1200px-Ic_chevron_left_48px.svg.png" id="d" alt="">
        </div>
    </section>
    <footer>
        <div class="imagelogo">
            <img src="depositphotos_61243733-stock-illustration-business-company-logo.jpg" alt="logo-sila">
        </div>
        <div class="flxcol">
            <h1>Lien Rapide</h1>
            <a href="#">Accueil</a>
            <a href="#">Ouvrages</a>
            <a href="#">Memoires</a>
            <a href="#">A propos de nous</a>
        </div>
        <div class="rx">
            <h1>Reseaux Sociaux</h1>
            <div>
                <i class="fa-brands fa-facebook-f"></i>
                <a href="#">Facebook</a>
            </div>
            <div>
                <i class="fa-brands fa-instagram"></i>
                <a href="#">Instagram</a>
            </div>
        </div>
    </footer>

    <script src="script.js"></script>
</body>

</html>