## time.sh
script continuously prints the current date and time, but with a twist — the awk '!seen[$0]++' ensures that only unique timestamps are displayed (i.e., it filters out duplicates). Here's a breakdown:

```bash
#!/bin/bash

while true
do 
    date +'%a %b %e %Y%n%I:%M %p'   # Formats date and time
done | awk '!seen[$0]++'           # Filters out repeated lines
```
## Format Output

The date format string '%a %b %e %Y%n%I:%M %p' means:

    %a = abbreviated weekday (e.g., "Mon")

    %b = abbreviated month (e.g., "Apr")

    %e = day of month (space-padded)

    %Y = full year

    %n = newline

    %I:%M %p = 12-hour time with minutes and AM/PM

## Behavior

    The while true loop runs indefinitely.

    The awk command ensures that if two consecutive date calls produce the same output (i.e., within the same second), only the first is printed.

