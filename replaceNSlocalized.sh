#/bin/sh

# Run this inside the project to replace NSLocalizedString calls with swiftgen calls in all .swift files.
# Do not forget to make a backup before.

find . -type f | grep ".swift" > swiftindex.temp

DIRNAME=`dirname $0`

while IFS= read -r filename
do
  grep -o "NSLocalizedString(\"[^\"]*\", comment:\s*\"[^\"]*\")" "$filename" > strings.temp
  while IFS= read -r localizable
  do
    replacement=$(ruby ${DIRNAME}/transformToR.rb "$localizable")
    localizable=`printf "%s" "$localizable" | tr '\n' '\0' | sed 's/\0/\\n/g'`
    echo "$localizable -> $replacement"
    sed -i .bak "s#$localizable#$replacement#g" $filename
    rm "$filename.bak"
  done < strings.temp
  rm strings.temp
done < swiftindex.temp
rm swiftindex.temp
