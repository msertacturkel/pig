set hbase.zookeeper.quorum 'localhost'
--fetch markı var ama parse markı yoksa depola.site enson fetch edildi ve dolayısyla parse markı yokken çalışınca url var.Parse da edilince bos cikar.
data = LOAD 'hbase://webpage' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('mk:*', '-loadKey true -caster HBaseBinaryConverter') as (url:CHARARRAY, value:MAP[]);
a = FOREACH data GENERATE url,(int)value#'_ftcmrk_' as fetch,(int)value#'__prsmrk__' as parse;
filtered = filter a by fetch is not null and parse is null;
ILLUSTRATE filtered;

