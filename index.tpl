<!-- views/index.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to bottom, #001F3F, #003366); /* Navy blue gradient */
        }

        .container {
            text-align: center;
            max-width: 600px;
            padding: 20px;
            border: 1px solid #ddd; /* Optional: Add a border for better visibility */
            border-radius: 10px; /* Optional: Add rounded corners */
            background-color: #fff; /* Set background color to white or another color */
        }

        h1 {
            color: #333;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
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
    <div class="container">
        <h1>Apps</h1>
        <ul>
            % for app in apps:
                <li><a href="/app/{{app[0]}}">{{app[1]}}</a> ({{app[2]}} users)</li>
            % end
        </ul>
        <h2>Add App</h2>
        <form action="/add_app" method="post">
            <label for="name">App Name:</label>
            <input type="text" id="name" name="name" required>
            <input type="submit" value="Add App">
        </form>
    </div>
</body>
</html>
