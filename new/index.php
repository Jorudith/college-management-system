<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" charset="UTF-8" type="text/css" href="css/style.css">

    <link rel="icon" href="">
    <title>College Management System</title>
</head>
<body>
    <main>
        <section>
            <div class="signin">
                <form class="signin-form" method="post" action="php/includes/process.php">
                    <h1 style="font-size: 5rem; font-weight: 800;">SIGN IN</h1>

                    <div class="signin-input">
                        <label style="font-weight: 650;" for="username">USERNAME</label>
                        <input style="font-size: 1.4rem;" id="username" type="text" name="username" placeholder="Enter username..." required>
    
                        <label style="font-weight: 650;" for="password">PASSWORD</label>
                        <input style="font-size: 1.4rem;" id="password" type="text" name="password" placeholder="Enter password..." required>
                    </div>

                    <button type="submit">SIGN IN</button>
                </form>
                <div class="signin-logo">
                    <img src="img/URS-Logo.jpg">
                </div>
            </div>
        </section>
    </main>
</body>
</html>