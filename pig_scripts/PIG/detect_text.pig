row = load 'hbase://test' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('' '-loadKey true -caster HBaseBinaryConverter') as (rowkey:chararray);
flt = foreach row 
