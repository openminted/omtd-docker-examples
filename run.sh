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
	dockerRunCommand="sudo docker run  $options -v $hostIN:$contIN -v $hostOT:$contOT $image $command --input $contIN --ouput $contOT"
	echo $dockerRunCommand
	$dockerRunCommand
}


dockerRun "bibliome/uc-tdm-as-d" "alvisnlp plans/tag_xmi.plan" $(pwd)/xmiIN/ $(pwd)/xmiIN/ $(pwd)/xmiOUT/ $(pwd)/xmiOUT/ "-m 2024M"

