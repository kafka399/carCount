#remove image duplicates
find . -maxdepth 1 -type f -exec md5sum {} \;  >test.txt
awk 'a[$1]++ {gsub(/^\*/,"",$2); print "rm ", $2}' test.txt |sh
rm test.txt

#convert jpg

if [ -d "out" ]; then
	rm -r out
fi
mkdir out
for k in $(ls *.jpg); do convert $k out/$k.pgm; done

cd out
mkdir slide
for filename in $(ls *.pgm);
 do 

w=`convert $filename -print "%w" /dev/null`
h=`convert $filename -print "%h" /dev/null`
let "ww= $w/100"
let "hh= $h/100"
for((y=150;y<=250;y+=50))
do
for((i=100;i<=400;i+=50))
do
echo "slide/$i.$filename" 
let "h_slide=$i"
convert $filename -crop 100x100+$i+$y slide/$y.$i.$filename
done
done
done

