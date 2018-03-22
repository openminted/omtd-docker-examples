#!/bin/bash

function dockerRun(){
	# Image & command
	image=$1
	command=$2
	# IN & OUT
	hostIN=$3
	contIN=$4
	hostOT=$5
	contOT=$6
	options=$7
	# Print params
	echo "image: " $image
	echo "executor: " $command
	# Pull & run
	sudo docker pull $image
	echo -e "\n\n"
	dockerRunCommand="sudo docker run  $options -v $hostIN:$contIN -v $hostOT:$contOT $image $command --input $contIN --output $contOT"
	echo $dockerRunCommand
	echo -e "\n\n"
	$dockerRunCommand
}


#dockerRun "bibliome/uc-tdm-as-d" "alvisnlp plans/tag_xmi.plan" $(pwd)/xmiININRASample/ $(pwd)/xmiININRASample/ $(pwd)/uc-tdm-as-dOUT/ $(pwd)/uc-tdm-as-dOUT/ "--memory 4000M"
dockerRun "bibliome/segmenter" "alvisnlp -verbose alvis.segmenter.plan" $(pwd)/xmiININRASample/ $(pwd)/xmiININRASample/ $(pwd)/segmenterOUT/ $(pwd)/segmenterOUT/ 
#dockerRun "openminted/uc-ss-module-ner" "" $(pwd)/xmiIN/ $(pwd)/xmiIN/ $(pwd)/uc-ss-module-nerOUT/ $(pwd)/uc-ss-module-nerOUT/ 

