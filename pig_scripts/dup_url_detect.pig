--rows = load 'hbase://webpage' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('', '-loadKey true -caster HBaseBinaryConverter') as (rowkey:chararray);
rows = load 'inpdir/mysites' using PigStorage() as (rowkey:chararray);
--sorted = order rows by rowkey;
withSlash = foreach rows generate(CONCAT(rowkey, '/'));
grp = join rows by $0, withSlash by $0;
dump grp;

