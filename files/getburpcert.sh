#!/bin/bash
printf "y\n" | /usr/bin/timeout 45 /opt/BurpSuitePro/jre/bin/java -Djava.awt.headless=true -jar /opt/BurpSuitePro/burpsuite_pro.jar &
sleep 30
/usr/bin/curl http://localhost:8080/cert -o /tmp/cacert.der
/usr/bin/openssl x509 -inform der -outform pem -in /tmp/cacert.der -out /tmp/BurpsuiteCA.crt
exit