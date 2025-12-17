<h2>Connexion</h2>

<form method="post" action="/login">
    <input type="text" name="loginUser" placeholder="Login" required>
    <input type="password" name="mdp" placeholder="Mot de passe" required>
    <button type="submit">Se connecter</button>
</form>

<?php if (isset($error)): ?>
    <p style="color:red"><?= $error ?></p>
<?php endif; ?>
