#grep '<description>' errors.xml | cut -d'>' -f2 | cut -d'<' -f1 | sed 's/\(^.*\) Diagnostics.*$/\1/g' | sort | uniq -c | sort -rn > errors_cnt.txt
grep '<description>' errors.xml | cut -d'>' -f2 | cut -d'<' -f1 | sed -r 's/(^.*) Diagnostics.*$/\1/g' | sort | uniq -c | sort -rn > errors_cnt.txt
