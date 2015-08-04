FROM gfredericks/leiningen

WORKDIR /var/app

CMD ["lein", "uberjar"]
