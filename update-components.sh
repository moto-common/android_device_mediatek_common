#!/bin/bash

# Function to process the REL file content
process_rel_file() {
  local rel_file="$1"
  local content=$(cat "$rel_file")

  # Add your conditions here to run specific commands based on the content
  # For example:
  if [[ "$content" == $(cat "$base_directory"/rels/mt6768-cofud) ]]; then
    echo "Running command 1 in directory: $(dirname "$rel_file")"
    ./extract-files.sh /data/build/userdata/electimon/android_tools/dumps/XT2173-3_COFUD_RETEU_12_S3RWDS32.123-29-2-2_subsidy-DEFAULT_regulatory-DEFAULT_cid50_CFC.xml
    # Command 1
  elif [[ "$content" == $(cat "$base_directory"/rels/mt6879-tesla) ]]; then
    echo "Running command 2 in directory: $(dirname "$rel_file")"
    ./extract-files.sh /data/build/userdata/electimon/android_tools/dumps/TESLA_G_SYS_T2ST33.105-51-5-3_subsidy-DEFAULT_regulatory-DEFAULT_cid51_CFC.xml
    # Command 2
  elif [[ "$content" == $(cat "$base_directory"/rels/mt6893-lyriq) ]]; then
    echo "Running command 3 in directory: $(dirname "$rel_file")"
    ./extract-files.sh /data/build/userdata/electimon/android_tools/dumps/XT2303-2_LYRIQ_RETEU_13_T2TL33.3-22-5_subsidy-DEFAULT_regulatory-DEFAULT_cid50_CFC.xml
    # Command 3
  elif [[ "$content" == $(cat "$base_directory"/rels/mt6768-gnevan) ]]; then
    echo "Running command 4 in directory: $(dirname "$rel_file")"
    ./extract-files.sh /data/build/userdata/electimon/android_tools/dumps/XT2317-3_GNEVAN_ATT_13_T1TH33.75-12-6_subsidy-ATT_RSU_regulatory-DEFAULT_cid51_R3_CFC.xml/
    # Command 4
  elif [[ "$content" == $(cat "$base_directory"/rels/nwp2) ]]; then
    echo "Running command 4 in directory: $(dirname "$rel_file")"
    ./extract-files.sh /data/jenkins/rom/los-20.0/out/target/product/nwp2
    # Command 4
  else
    echo "No specific action for content: $content in directory: $(dirname "$rel_file")"
  fi
}

# Main script logic
main() {
  # Change this to the base directory where you have the REL directories
  base_directory="$PWD"

  # Find all directories containing the REL file
  rel_directories=$(find -L "$base_directory" -type f -name "REL" -exec dirname {} \;)

  # Process each directory
  for dir in $rel_directories; do
    if [[ ! -z "$1" ]]; then
      if [[ "$dir" != *$1* ]]; then
        continue
      fi
    fi
    cd "$dir" || continue
    rel_file="./REL"

    # Check if the REL file exists
    if [ -f "$rel_file" ]; then
      process_rel_file "$rel_file"
    else
      echo "REL file not found in directory: $dir"
    fi
  done
}

# Run the main function
main $@
