#FECHA=`date +%y%m%d` 
cuando=`date +%d%m%y ` 
HORA=`date +%H%M%S` 
 
clear 
echo "Archivo?" 
read archivo 
sleep  1 
clear 
 
cat /dev/null > /home/julio/hierarchy1301/trans-total-falla.log 
cat /dev/null > /home/julio/hierarchy1301/trans-total-llaves.log 
cat /dev/null > /home/julio/hierarchy1301/chidas.txt 
cat /dev/null >/home/julio/hierarchy1301/comunica.txt 
sleep  1 
 
x=`awk 'END{print  NR}' /home/julio/hierarchy1301/ipes.txt ` 
 
HOY=`date +%Y%m%d` 
 
validar_envio () { 
                VAL=`ssh $1 "md5sum $2  | cut -d' ' -f1"` 
                if [ $VAL == "${3}" ];then 
                                echo "$DET TRANSMISION OK: $VAL" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
                else 
                                echo "$DET TRANSMISION  MAL: $VAL" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
                fi 
 } 
 
transmitir3 () { 
 
###-------ENVIO  DE TAR VERSION 3798---------------------------------------------------------------------
 
####NOMBRE QUE  LLEVARA  EL  LOG  DE INSTALACIÓN#####Envio_ver3798_FORMATO_SCO_01 
 
#  scp /home/julio/version3798/edit/sco_SAMS_ver3798.tar.xz  root@$1:/home/server/ . 
#  validar_envio $1 /home/server/sco_SAMS_ver3798.tar.xz 501e903900414f31ddb7b164d95238b3 
 
#  scp /home/julio/version3798/edit/sco_BAE_ver3798.tar.xz  root@$1:/home/server/. 
#  validar_envio $1 /home/server/sco_BAE_ver3798.tar.xz 49c3d869a117b1eb8a83bda41d862a92 
 
#  scp /home/julio/version3798/edit/sco_BOD_ver3798.tar.xz  root@$1:/home/server/. 
#  validar_envio $1 /home/server/sco_BOD_ver3798.tar.xz b93c933e739f977bab1c02664863bd16 
 
#  scp /home/julio/version3798/edit/sco_MiBOD_ver3798.tar.xz  root@$1:/home/server/ . 
#  validar_envio $1 /home/server/sco_MiBOD_ver3798.tar.xz 47140afa69d59ea72e220df8059a8c58 
 
#  scp /home/julio/version3798/edit/sco_SC_ver3798.tar.xz  root@$1:/home/server/. 
#  validar_envio $1 /home/server/sco_SC_ver3798.tar.xz 7fadd225743e5c71a847d93fbd8a693c 
 
#  scp /home/julio/version3798/edit/sco_WE_ver3798.tar.xz  root@$1:/home/server/. 
#  validar_envio $1 /home/server/sco_WE_ver3798.tar.xz 5d723a7e0a8f271cbe7f7f2cf27be211 

 
###-------ENVIO 2700 ACTIVO SAMS------------------------------------------------------------------------
 
#  scp /home/julio/version3798/edit/SAMS/2700Encendido/ P_REGCONF.hierarchy.2700.Estacionamiento.XML.BKP  root@$1:/home/server/ M_DEPLOY/sco/gd90/. 
#  validar_envio $1 /home/server/ M_DEPLOY/sco/gd90/ P_REGCONF.hierarchy.2700.Estacionamiento.XML.BKP 52e9118318b7d46b1e0a24e528c7677a 
 
###-------DESCOMPRESION VERSION 3798---------------------------------------------------------------
 
####NOMBRE QUE  LLEVARA  EL  LOG  DE INSTALACIÓN#####Instalacion_ver3798_FORMATO_SCO_01 
 
#  ssh $1 "tar -xvJf /home/server/sco_SAMS_ver3798.tar.xz -C /home/server/" 
#  ssh $1 "tar -xvJf /home/server/sco_BAE_ver3798.tar.xz -C /home/server/" 
#  ssh $1 "tar -xvJf /home/server/sco_BOD_ver3798.tar.xz -C /home/server/" 
#  ssh $1 "tar -xvJf /home/server/sco_MiBOD_ver3798.tar.xz -C /home/server/" 
#  ssh $1 "tar -xvJf /home/server/sco_SC_ver3798.tar.xz -C /home/server/" 
#  ssh $1 "tar -xvJf /home/server/sco_WE_ver3798.tar.xz -C /home/server/" 
 
#  ssh $1 "chmod -R 775 /home/server/ M_DEPLOY && chown -R server:ars /home/server/ M_DEPLOY" 

#  validar_envio $1 /home/server/ M_DEPLOY/sco/class/ars-cla.jars 8234c12dca42365fcfaed19803f178ee 
 
###-------VALIDAR CLASS  EN SERVER VERSION 3798---------------------------------------------------
 
####NOMBRE QUE  LLEVARA  EL  LOG  DE  INSTALACIÓN#####Val_Class_ARS_SCO_01 
#  validar_envio $1 /home/server/ M_DEPLOY/sco/class/ars-cla.j ar 8234c12dca42365fcfaed19803f178ee 
 
 ###-------VALIDAR CLASS  EN CAJAS VERSION 3798-----------------------------------------------------
 
####NOMBRE QUE  LLEVARA  EL  LOG  DE  INSTALACIÓN#####Val_Class_SCO_01 
#  validar_envio $1 /home/reg/gd90/class/ars-cla.jar 8234c12dca42365fcfaed19803f178ee 
   
###=============CHECK alzaron  las caj as=================================== 
#     scp /home/julio/check.tar.xz  root@$1:/home/check.tar.xz 
#     ssh $1 "sleep  1 ; tar -xJf /home/check.tar.xz -C /home/ && sleep 1 && /home/new/check/./checas.sh && sleep  1 >/dev/null 2>&1" 
#     scp  root@$1:/home/new/check/check.log /home/julio/ hierarchy1301/txt/transmision-$1.log 
 
###=============REINICIO  POS  MUCHO CUIDADO AL USAR============================ 
#    ssh $1  "j ava -cp /home/reg/gd90/class/ars-cla.j ar com.ncr.asr.Shutdown 6790 >>L_JVM\$REG.LOG 2>&1" 
 
###========REVISAR CIERRE ABORTADO================================ 
#  ssh $1 "ls -ll /home/ NCR/webFront_ScheduledEOD  | tail -2" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 

###========PERMISOS  DE gd90  EN CAJAS================================ 
#    ssh  root@$1 "ls -ld /home/reg/gd90/" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
#    ssh  root@$1 "ls -ld /home/reg/gd90/js/" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
#    ssh  root@$1 "ls -ld /home/reg/gd90/jars/" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
 
#########---------------------------------------------------------------------------------------------------
 
#  ssh $1 "tar -xJf /home/ver3798_AUTO_ARS.tar.xz -C /home/ && /home/new/ver3798/./respaldo_SCO.sh && sleep  1" 
#  ssh $1 "/home/new/ver3798/./respaldo_SCO.sh" 
 
#  VAL=`ssh $1 "ls /home/new/ver3798/pre_instalacion.log  | wc -l"` 
#  if [ $VAL -eq 0 ];then 
#    echo "SIN  LOG  DE  INSTALACION" >> /home/julio/ hierarchy1301/txt/transmision-$1.log 
#  else 
#    scp  root@$1:/home/new/ver3798/pre_instalacion.log /home/julio/ hierarchy1301/txt/transmision-$1.log 
#  fi
 
##########################################################################
 
} 
 
pingo() { 
  ping -q -c6 $1  1>/dev/null 2>&1 
  if [ $? -ne 0 ];then 
    echo  no comunica >> /home/julio/hierarchy1301/txt/transmision-falla-$1.log 
  else 
    echo $1 >> /home/julio/hierarchy1301/comunica.txt 
  fi
} 
 
 
llaves () { 
  timeout 45 ssh -o StrictHostKeyChecking=no -o  BatchMode=yes $1 echo  hola ; cola=$? 
  if [ $cola -eq 0 ]; then 
      echo $1 >> /home/julio/hierarchy1301/chidas.txt 
  else 
    if [ $cola -eq  124 ]; then 
      echo timeout >> /home/julio/hierarchy1301/txt/transmision-llaves-$1.log 
    else     
      echo sin  llaves>> /home/julio/hierarchy1301/txt/transmision-llaves-$1.log 
    fi

    fi
} 
 
for (( i=1;i<=x; i++)) do 
  ip=`awk -v counter="$i" 'NR==counter{print substr($1,1,30)}' /home/julio/ hierarchy1301/ipes.txt ` 
  (  pingo $ip ) & 
done 
wait 
 
y=`awk 'END{print  NR}' /home/julio/hierarchy1301/comunica.txt ` 
for (( j =1;j <=y; j ++)) do 
  ip2=`awk -v counter="$j " 'NR==counter{print substr($1,1,30)}' /home/julio/ hierarchy1301/comunica.txt ` 
  (  llaves $ip2 ) & 
done 
wait 
 
 
z=`awk 'END{print  NR}' /home/julio/hierarchy1301/chidas.txt ` 
for (( k=1;k<=z;  k++)) do 
  ip3=`awk -v counter="$k" 'NR==counter{print substr($1,1,30)}' /home/julio/ hierarchy1301/chidas.txt ` 
  #transmitir3 $ip3 
  ( transmitir3 $ip3 ) & 
done 
wait 
 
strings -f /home/julio/hierarchy1301/txt/transmision-falla*.log >> /home/julio/ hierarchy1301/trans-total-falla.log 
strings -f /home/julio/hierarchy1301/txt/transmision-llaves*.log >> /home/julio/ hierarchy1301/trans-total-llaves.log 
strings -f /home/julio/hierarchy1301/txt/* >> /home/julio/ hierarchy1301/Actualizacion_${archivo}_${cuando}.log 
sed -i -e "s,/home/julio/hierarchy1301/txt/transmision-falla-,,g" /home/julio/ hierarchy1301/Actualizacion_${archivo}_${cuando}.log 
sed -i -e "s,/home/julio/hierarchy1301/txt/transmision-llaves-,,g" /home/julio/ hierarchy1301/Actualizacion_${archivo}_${cuando}.log 
sed -i -e "s,/home/julio/hierarchy1301/txt/transmision-,,g" /home/julio/ hierarchy1301/Actualizacion_${archivo}_${cuando}.log 
sed -i -e "s,.log,,g" /home/julio/hierarchy1301/Actualizacion_${archivo}_${cuando}.log 
rm /home/julio/hierarchy 1301/txt/*  
rm /home/julio/hierarchy 1301/txt1/* 
#cat /dev/null > /home/julio/hierarchy 1301/ipes.txt  
#eb5ad221ec702738e870f  