#!/usr/bin/bash
set -e

mkdir -p "/tmp/pg9-api-checker/"

#
# Test di pg9-prog-lambda-GetAllTalks
#
curl --json '{}' "https://8hqpqi3mm7.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-GetAllTalks" > "/tmp/pg9-api-checker/GetAllTalks.json"

#
# Test di pg9-prog-lambda-AddQABySlug
#
# Caso risposta vera
curl --json '{"slug": "sarah_lewis_embrace_the_near_win","question": "unique_question","answer": "1"}' "https://zbjyl85kp6.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-AddQABySlug" > "/tmp/pg9-api-checker/AddQABySlug-1.json"

# Caso risposta falso
curl --json '{"slug": "sarah_lewis_embrace_the_near_win","question": "unique_question","answer": "0"}' "https://zbjyl85kp6.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-AddQABySlug" > "/tmp/pg9-api-checker/AddQABySlug-0.json"

# Caso risposta invalida
curl --json '{"slug": "sarah_lewis_embrace_the_near_win","question": "unique_question","answer": "dQw4w9WgXcQ"}' "https://zbjyl85kp6.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-AddQABySlug" > "/tmp/pg9-api-checker/AddQABySlug-err.json"

#
# Test di pg9-prog-lambda-GetTalkBySlug
#
curl --json '{"slug": "sarah_lewis_embrace_the_near_win","question": "unique_question"}' "https://kx7pqnr9eh.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-GetTalkBySlug" > "/tmp/pg9-api-checker/GetTalkBySlug.json"
