#you need full path for crontab
cd /home/git/carCount/img
a=`date +%s`
b=${a}_1.jpg 
wget -O $b -q "http://www.sviesoforai.lt/map/camera.aspx?size=full&image=K213-1.jpg&rnd=0.5732720431406051"

b=${a}_2.jpg
wget -O $b -q "http://www.sviesoforai.lt/map/camera.aspx?size=full&image=K6101-1.jpg&rnd=0.22270446713082492"

b=${a}_3.jpg
wget -O $b -q "http://www.sviesoforai.lt/map/camera.aspx?size=full&image=K6122-2.jpg&rnd=0.34141914220526814"

b=${a}_4.jpg
wget -O $b -q "http://www.sviesoforai.lt/map/camera.aspx?size=full&image=K7742-1.jpg&rnd=0.15417794161476195"
