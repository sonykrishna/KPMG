echo "please select any number"
echo "1.attributes/"
echo "2.description"
echo "3.disks/"
echo "4.hostname"
echo "5.id"
echo "6.network-interfaces/"
echo "7.machine-type"
echo "8.image"
echo "9.network-interfaces/ <index> /forwarded-ips/"
echo "10.scheduling/"
echo "11.scheduling/on-host-maintenance"
echo "12.scheduling/automatic-restart"
echo "13.maintenance-event"
echo "14.project-id"
echo "15.service-accounts/"
echo "16.tags"
echo "17.zone"
echo -n "please enter a number"
read value 
case $value in
  1)res=attributes/
  ;;
  2)res=description
  ;;
3)res=disks/
        ;;
4)res=hostname
        ;;
5)res=id
        ;;
6)res=network-interfaces/
        ;;
7)res=machine-type
        ;;
8)res=image
        ;;
9)res=network-interfaces/ <index> /forwarded-ips/
        ;;
10)res=scheduling/
        ;;
11)res=scheduling/on-host-maintenance
        ;;
12)res=scheduling/automatic-restart
        ;;
13)res=maintenance-event
        ;;
14)res=project-id
        ;;
15)res=service-accounts/
        ;;
16)res=tags
        ;;
17)res=zone
        ;;
esac
echo "Selected Option : $res"
curl "http://metadata.google.internal/computeMetadata/v1/instance/$res?recursive=true&alt=json" -H "Metadata-Flavor: Google" || curl "http://metadata.google.internal/computeMetadata/v1/instance/$res/?recursive=false" -H "Metadata-Flavor: Google"