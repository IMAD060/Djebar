
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>Connexion</title>
<link rel="stylesheet" href="Login.css">

</head>
<body>
	<header>
		<a href="index.html"><img
			src="depositphotos_61243733-stock-illustration-business-company-logo.jpg"
			width="200" alt=""></a> <span class="masq" onclick="toggleMenu()"><i
			class="fa-solid fa-bars"></i></span>
		<ul class="menu-list">
			<li>Accueil</li>
			<li>Ouvrages</li>
			<li>Memoires</li>
			<li>A propos de nous</li>
		</ul>
	</header>
	
	<div class="container">
		<section id="content">
			<form action="app" method="post">
				<h1>Connexion</h1>
				<div>
					<input type="text" placeholder="Nom utilisateur"
						required="required" id="username" name="username" />
				</div>
				<div>
					<input type="password" placeholder="Mot de passe"
						required="required" id="password" name="password" />
				</div>
				<div>
					<input type="submit" value="Se connecter" /> <a href="#">Mot
						de passe oublié?</a> <a href="#">S'inscrire</a>
				</div>
			</form>
			<!-- form -->

		</section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>
