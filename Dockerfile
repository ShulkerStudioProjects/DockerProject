# Utilisation de l'image Debian Bullseye comme base
FROM debian:bullseye

# Mise à jour et installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    tar \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Téléchargement de PocketMine-MP

# copy des fichiers dans le dossier pocketmine/
COPY ./server/ .

# set des permissions
RUN chmod 777 start.sh

# Exposition du port par défaut pour PocketMine
EXPOSE 19132/udp

# Commande par défaut pour démarrer le serveur
CMD ["bash", "start.sh"]
