#!/bin/bash
NOW=$(/bin/date +%Y%m%d)
tar czvf /tmp/openvpn-${NOW}.tgz /etc/openvpn /opt/ovpn-data /opt/ovpn-volume
aws s3 cp --region eu-west-2 /tmp/openvpn-${NOW}.tgz s3://gcap.backups/openvpn/openvpn-${NOW}.tgz
aws s3 cp --region eu-west-2 openvpn-backup-s3.sh s3://gcap.backups/openvpn/openvpn-backup-s3.sh
rm /tmp/openvpn-${NOW}.tgz
