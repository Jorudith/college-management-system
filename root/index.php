<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="">
    <title>College Management System</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" charset="UTF-8" type="text/css" href="css/style.css">
</head>
<body>
    <section class="sec-a fxbx-b">
            <div class="fxbx-b frbx">
                <form class="fxbx-b fr" action="includes/process.php" method="POST">
                    <h1 class="tt-imgban">Sign In</h1>
                    <div class="fxbx-g">
                        <label for="email" class="fr-lbl">Email address</label>
                        <input id="email" class="fr-in" type="text" name="email" placeholder="Enter email address..." >

                    </div>
                    <div class="fxbx-g">
                        <label for="password" class="fr-lbl">Password</label>
                        <input id="password" class="fr-in"  type="password" name="pass" placeholder="Enter password..." >

                    </div>
                    <button class="fr-btn" name="button" value="signin">Submit</button>
                    <!-- <button class="fr-btn" name="button" value="getrows">Get Rows</button> -->
                    <a class="fr-url" href="up.php">Don't have an account? Click here!</a>
                </form>
        </div>
    </section>

    <div class="breathe breathe-b"></div>
</main>

<script src="../js/main.js"></script>
</body>
</html>