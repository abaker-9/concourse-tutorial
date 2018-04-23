# Commands

# execute local pipeline
fly -t tutorial e -c test.yml


 fly -t tutorial sp -p mytest -c test.yml -l concourse-credentials.yml
 fly -t tutorial up -p mytest

