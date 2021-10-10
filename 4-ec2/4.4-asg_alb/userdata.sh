#!/bin/bash

#######################################################
## Configuramos las métricas de CloudWatch ##
#######################################################
echo "* * * * *  /opt/aws/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --auto-scaling --from-cron" >> /var/spool/cron/root

chown -R nginx:nginx /var/run/php-fpm/
service nginx restart
service php-fpm-7.2 restart