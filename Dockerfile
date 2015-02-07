
FROM tutum/lamp

MAINTAINER elreycaifan@gmail.com

RUN apt-get update ; \
	apt-get upgrade -q -y ;\
	apt-get install -q -y curl php5-gd php5-ldap php5-imap; apt-get clean ; \
	php5enmod imap

RUN rm -rf /app; \
	mkdir -p /app;\
	git clone https://github.com/DogF/LimeSurvey.git; \
	mv LimeSurvey /app/LimeSurvey; \
	chown -R www-data:www-data /app

RUN chown www-data:www-data /var/lib/php5

ADD apache_default /etc/apache2/sites-available/000-default.conf

EXPOSE 80 3306
CMD ["/run.sh"]
