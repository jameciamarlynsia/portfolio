<?php
/***
 * Name: Jamecia M. Moore
 * Date: 11/19/2020
 * Objective: This was created and used for a login for a medical company (not real)
 * Notes: The register.php page is not included
 */
?>
<html>

<head>
    <title>DoChart - Login</title>
    <link rel="stylesheet" href="jmm_layout.css">
</head>
</head>

<div class="center">
<h1 class="header">Welcome to DoChart</h1>
<form method="POST" action="login.php">

    <div class="input-group">
        <label class="label">Username:</label>
        <input type="text" name="username" id="username" placeholder="Username">

    </div>

    <div class="input-group">
        <label class="label">Password:</label>
        <input type="password" name="pass" id="pass" placeholder="Password">
    </div>


    <div class="input-group">
        <button id="login" class="btn" type="submit" name="login" href="pill.php">Login</button>
        <p class="fb">Need to register?  <a href="register.php">Register Here</a></p>
    </div>

</form>
</div>
</html>