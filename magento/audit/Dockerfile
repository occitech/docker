FROM jolicode/phaudit

RUN cd $HOME && \
	wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar && \
	chmod +x n98-magerun.phar && \
	mv n98-magerun.phar /usr/local/bin/n98-magerun  && \
	mkdir -p ~/.n98-magerun/modules/ && \
	wget -qO- https://github.com/AOEpeople/mpmd/archive/master.tar.gz |  tar -zxf- -C ~/.n98-magerun/modules/ && \
	mv ~/.n98-magerun/modules/mpmd-master ~/.n98-magerun/modules/mpmd

ADD ./download-magento.sh /usr/local/bin/download-magento
ADD ./do-audit.sh /usr/local/bin/do-audit

RUN sudo chmod +x /usr/local/bin/download-magento /usr/local/bin/do-audit

USER root