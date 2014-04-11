Register 'hdfs:///user/sertac/getstat.py' using jython as urlhelper;
Register 'hdfs:///user/sertac/unreverseUrl.py' using jython as urlreverse;

set hbase.zookeeper.quorum 'host-10-6-149-119'
set zookeeper.znode.parent '/hbase-unsecure'


data = LOAD 'hbase://97_webpage' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('f:*', '-loadKey true -caster HBaseBinaryConverter') as (url:CHARARRAY, value:MAP[]); 
--describe data;
--dump data;
counts = FOREACH data GENERATE urlreverse.unreverse(url),urlhelper.getstat((int)value#'st');
--describe counts;
--dump counts;
counts = FILTER counts BY ( $1 == 'STATUS_NOTMODIFIED');
STORE counts INTO '/user/sertac/out/STATUS_NOTMODIFIED';
