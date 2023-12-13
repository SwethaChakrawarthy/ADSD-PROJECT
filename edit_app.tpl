<!-- views/edit_app.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            text-align: center; /* Center-align content */
            background: linear-gradient(to bottom, #001F3F, #003366); /* Navy blue gradient */
            color: #fff; /* Set text color to white or another color for contrast */
        }

        h1 {
            color: #fff; /* Set heading color to white or another color for contrast */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #fff; /* Set label color to white or another color for contrast */
        }

        input {
            padding: 5px;
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            margin-right: 10px;
        }

        /* Add more styles as needed */
    </style>
</head>
<body>
    <h1>Edit App</h1>
    <form action="/update_app/{{app[0]}}" method="post">
        <label for="new_name">New App Name:</label>
        <input type="text" id="new_name" name="new_name" value="{{app[1]}}" required>
        <input type="submit" value="Update App">
    </form>
    <p><a href="/app/{{app[0]}}">Cancel</a></p>
</body>
</html>
