while true; do 
    date +'%a %b %e %Y%n%I:%M %p'
    sleep 1
done | awk '!seen[$0]++'

# Added a delay to reduce CPU usage and unnecessary checks
