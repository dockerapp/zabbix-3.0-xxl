FROM monitoringartist/zabbix-3.0-xxl
MAINTAINER dockerapp

RUN yum update -y && yum -y install python-pip && pip install pexpect
RUN yum autoremove -y python-pip && yum clean all

CMD ["/config/bootstrap.sh"]

VOLUME ["/etc/custom-config", "/usr/local/share/zabbix/alertscripts", "/usr/local/share/zabbix/externalscripts", "/usr/local/share/zabbix/ssl/certs", "/usr/local/share/zabbix/ssl/keys", "/usr/lib/zabbix/modules", "/usr/share/snmp/mibs", "/etc/snmp"]

EXPOSE 80/TCP 162/UDP 10051/TCP 10052/TCP
