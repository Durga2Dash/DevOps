#!/bin/bash

> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "[webservers]" >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo $(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /home/mtadmin123/tfcvpc/azure/module/terraform.tfstate | grep -v 198* | uniq | head -1) >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "[appservers]" >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo $(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /home/mtadmin123/tfcvpc/azure/module/terraform.tfstate | grep -v 198* | uniq | tail -1) >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "[webservers:vars]" >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "ansible_user=azureuser" >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "[appservers:vars]" >> /home/mtadmin123/tfcvpc/azure/module/hosts
echo "ansible_user=azureuser" >> /home/mtadmin123/tfcvpc/azure/module/hosts
