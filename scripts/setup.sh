sudo apt-get update
sudo apt-get install -y docker.io

sudo docker network create mynetwork

sudo docker run -d --name nessus \
  -p 8834:8834 \
  --network mynetwork \
  tenableofficial/nessus

sudo docker run -d --name webgoat --network mynetwork -p 8080:8080 webgoat/webgoat-8.0
sudo docker run -d --name dvwa --network mynetwork -p 80:80 vulnerables/web-dvwa
sudo docker run -d --name mutillidae --network mynetwork -p 80:80 citizenstig/nowasp
