#!/bin/sh


echo "\r\n \r\n  Stats \r\n \r\n"
curl -XGET 'localhost:9200/_nodes/stats?pretty'
#curl -XGET 'localhost:9200/_nodes/nodeId1,nodeId2/stats?pretty'


echo "\r\n \r\n  Processes \r\n \r\n"
curl 127.0.0.1:9200/_nodes/process?pretty

echo "\r\n \r\n  Cluster Health \r\n \r\n"
curl -XGET 'localhost:9200/_cat/health?v&pretty'

echo "\r\n \r\n  Cluster Indices \r\n \r\n"
curl -XGET 'localhost:9200/_cat/indices?v&pretty'

echo "\r\n \r\n DONE \r\n \r\n \r\n"
