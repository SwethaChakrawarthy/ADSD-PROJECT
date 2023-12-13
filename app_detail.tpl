<!-- views/app_detail.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{app[1]}} Users</title>
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

        p {
            color: #eee; /* Set paragraph color to a lighter shade for contrast */
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
            color: #eee; /* Set list item color to a lighter shade for contrast */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #eee; /* Set label color to a lighter shade for contrast */
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

        form {
            display: inline-block;
        }

        /* Add more styles as needed */
    </style>
</head>
<body>
    <h1>{{app[1]}} Users</h1>
    <p>{{app[2]}} users</p>
    <ul>
        % for user in users:
            <li>{{user[2]}}</li>
        % end
    </ul>
    <h2>Add User</h2>
    <form action="/add_user/{{app[0]}}" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <input type="submit" value="Add User">
    </form>

    <!-- Edit App Link -->
    <p><a href="/edit_app/{{app[0]}}">Edit App</a></p>

    <!-- Delete App Link -->
    <form action="/delete_app/{{app[0]}}" method="get" onsubmit="return confirm('Are you sure you want to delete this app?');">
        <input type="submit" value="Delete App">
    </form>

    <!-- Edit User Link for each user -->
    % for user in users:
        <p><a href="/edit_user/{{user[0]}}">Edit User</a></p>

        <!-- Delete User Form for each user -->
        <form action="/delete_user/{{user[0]}}" method="get" onsubmit="return confirm('Are you sure you want to delete this user?');">
            <input type="hidden" name="app_id" value="{{user[1]}}">
            <input type="submit" value="Delete User">
        </form>
    % end
</body>
</html>
