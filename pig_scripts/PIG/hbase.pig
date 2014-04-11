Register ' hdfs:///user/sertac/unreverseUrl.py ' using jython as urlhelper;
set hbase.zookeeper.quorum 'host-10-6-149-119'
set zookeeper.znode.parent '/hbase-unsecure'
dataset1 = LOAD '/user/sertac/seeds/1000url.txt' USING PigStorage('\n') AS ( url:chararray );
dataset2 = LOAD ' hbase://95_webpage ' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('f','-loadKey true') as
(url:CHARARRAY,f:map[]);
dataset2 = foreach dataset2 generate urlhelper.unreverse(url);
/*STORE dataset2 INTO '/user/sertac/out';
dump dataset2;*/
grpd = COGROUP dataset1 by url, dataset2 by url;
d1_only = foreach (FILTER grpd BY IsEmpty(dataset2)) GENERATE FLATTEN(dataset1);
STORE d1_only INTO '/user/sertac/outInjector';
/*dump a;*/
