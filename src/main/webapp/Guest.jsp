<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome, Guest!</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: left;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        .feature {
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }

        .feature h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .feature p {
            color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <a href="logout.jsp">Logout</a>
    <h1>Welcome, Guest!</h1>
    <p>We're delighted to have you here. As a guest, you have limited access to some of our features, but don't worry, there's still plenty to explore!</p>

    <div class="feature">
        <h2>Latest News</h2>
        <p>Stay up-to-date with the latest news and developments in our community. We cover a wide range of topics, from technology and science to arts and culture.</p>
    </div>

    <div class="feature">
        <h2>Featured Articles</h2>
        <p>Discover insightful articles written by our experts and contributors. Whether you're interested in business, health, or lifestyle, we've got you covered.</p>
    </div>

    <p>Ready to unlock full access? <a href="register.jsp">Create an account</a> now!</p>
</div>
</body>
</html>
