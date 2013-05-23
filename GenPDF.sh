#! /bin/bash
# 2013-05-20 v0.8
# Script to download the Google Spreadsheet, reformat for .GV and generate the 
# PDF file using graphviz 

TMP_DIR="/tmp/GenPDF"
AUTHFILE="$TMP_DIR/.AUTH_KEY"
CSVFILE="$TMP_DIR/$1.csv"
GVFILE="$TMP_DIR/$1.gv"
PDFFILE="./pdf/$4$1.pdf"

DIAGRAMTYPE=$4

TEST_DIR(){
# Test if the temp directory exists

if [ ! -d "$TMP_DIR" ]; then
    mkdir $TMP_DIR
    chmod -R 777 $TMP_DIR
fi

}

GENERATE_PDF(){

# First we grab the info for the Google Apps authentication..

	curl https://www.google.com/accounts/ClientLogin -d Email=$2 -d Passwd=$3 -d accountType=HOSTED_OR_GOOGLE  -d source=cURL-Example -d service=wise > $AUTHFILE 

# ..and we clean it

	AUTH_KEY=$(grep "Auth=" $AUTHFILE | sed 's/Auth\=//')

# Then we download the information ...
	
	curl --header "Authorization: GoogleLogin auth=$AUTH_KEY" "https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=$1&hl&exportFormat=csv" > $CSVFILE

# ...and we clean reformat the CSV for GV
	
	cat $CSVFILE | sed 's/""""/"/g' | sed 's/""/"/g' \
	| sed 's/\"\,/"/' | sed 's/\,\"\,/" /g' \
	| sed 's/->" /-> "/' | sed 's/" "\[/" \[/' \
	| sed 's/\/"/\//' | sed 's/,,,,,,,//' \
	| sed 's/"graph/graph/' | sed 's/;",,,,,,/;/' \
	| sed 's/" ,,,,"/"/' | sed 's/;"/;/' \
	 > $GVFILE

# And generate the pdf 
	
	$4 -Gsize=67! -Goverlap=scale -Tpdf $GVFILE > $PDFFILE
}

TEST_DIR
GENERATE_PDF $1 $2 $3 $4

# output
echo ""
echo "$1 -  Generated" 


# Cleanup
echo "" > $AUTHFILE
#echo "" > $CSVFILE
#echo "" > $GVFILE
