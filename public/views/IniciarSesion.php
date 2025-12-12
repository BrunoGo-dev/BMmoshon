<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" href="../css/iniciarsesion.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Roboto+Slab:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .error {
            border: 2px solid red !important;
        }

        .mensaje-error {
            color: white;
            background-color: red;
            padding: 5px;
            font-size: 14px;
            margin-top: 5px;
            border-radius: 5px;
            display: none;
        }
    </style>
</head>
<body>
    <form id="formLogin" onsubmit="return false;">
        <h2>Iniciar Sesión</h2>
        <input type="email" id="correo" placeholder="Correo">
        <div id="correo-error" class="mensaje-error"></div>

        <input type="password" id="contraseña" placeholder="Contraseña">
        <div id="contraseña-error" class="mensaje-error"></div>

        <button type="submit" id="IniciarSesion">Entrar</button>
    </form>

    <script>
        document.getElementById("formLogin").addEventListener("submit", function(e) {
            e.preventDefault();
            let correo = document.getElementById("correo").value.trim();
            let contraseña = document.getElementById("contraseña").value.trim();
            let error = false;

            document.getElementById("correo-error").style.display = "none";
            document.getElementById("contraseña-error").style.display = "none";
            document.getElementById("correo").classList.remove("error");
            document.getElementById("contraseña").classList.remove("error");

            if (!correo) {
                document.getElementById("correo-error").innerText = "Ingrese correo";
                document.getElementById("correo-error").style.display = "block";
                document.getElementById("correo").classList.add("error");
                error = true;
            }

            if (!contraseña) {
                document.getElementById("contraseña-error").innerText = "Ingrese contraseña";
                document.getElementById("contraseña-error").style.display = "block";
                document.getElementById("contraseña").classList.add("error");
                error = true;
            }

            if (error) return;

            fetch('/apis/iniciarSesion.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ correo, contraseña })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    window.location.href = data.redirect;
                } else {
                    alert(data.message);
                }
            })
            .catch(err => console.error("Error en fetch:", err));
        });
    </script>
</body>
</html>
