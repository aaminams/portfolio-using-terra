#!/bin/bash

# Update the package list and install Nginx
apt update -y
apt install nginx -y

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Create portfolio content
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Aamina Mohammad Shafi | Portfolio</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      text-align: center;
      padding: 50px;
    }
    h1 {
      color: #333;
    }
    p {
      font-size: 18px;
      color: #666;
    }
    a {
      color: #007BFF;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <h1>Hi, I'm Aamina ^^</h1>
  <p>DevOps · Cloud · Software Development</p>
  <p>
    <a href="https://github.com/aaminams" target="_blank">GitHub</a> |
    <a href="https://drive.google.com/drive/folders/1vdIYnauA8bRCFeJnnnxFzaRRmfp8XomK?usp=drive_link" target="_blank">CySec portfolio</a> |
    <a href="https://drive.google.com/drive/folders/1bNAAWopNRfesNoVBcJAGxpEoAOQZZzyO?usp=drive_link" target="_blank">Proj Mgmt portfolio</a> |
    <a href="https://linkedin.com/in/aamina-m-s" target="_blank">LinkedIn</a>
  </p>
</body>
</html>
EOF