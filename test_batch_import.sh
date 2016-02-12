ead_files() {
    local  DIR=$1

    
    find "$DIR" -name '*.xml'
    
}


#get_json_from_aspace() {
#    local file=$1
#    local #ASPACE_PLUGIN_URL="http://ec2-54-165-134-204.compute-1.amazonaws.com:8089/plugi#ns/jsonmodel_from_format/resource/ead"
#    set -x
#    curl -H "Content-Type: text/xml" -H "X-ArchivesSpace-Session: $TOKEN" -X #POST -d @"$file" "$ASPACE_PLUGIN_URL"
#    set +x
#    }

main() {
    local ASPACE_PLUGIN_URL="http://ec2-54-165-134-204.compute-1.amazonaws.com:8089/plugins/jsonmodel_from_format/resource/ead"
    local files=$(ead_files little_testbed)
    for file in "$files"
    do
#	echo "$file"

   curl -H "Content-Type: text/xml" -H "X-ArchivesSpace-Session: $TOKEN" -X POST -d @"$file" "$ASPACE_PLUGIN_URL"

	done
    
    }

main


#   curl -H "Content-Type: application/json" -H "X-ArchivesSpace-Session: $TOKEN" -X POST -d @ead.json "http://ec2-54-165-134-204.compute-1.amazonaws.com:8089/repositories/2/batch_imports"



