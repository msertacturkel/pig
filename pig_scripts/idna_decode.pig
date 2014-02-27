/*
idna_decode.pig
decodes idna encoded url names (or id's) existing on hbase 'webpage' table
*/

REGISTER /home/pala/Practice/my-practice/target/my-practice-1.0-SNAPSHOT.jar
raw = LOAD 'hbase://webpage' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('', '-loadKey true -limit 10000 -caster HBaseBinaryConverter') as (rowkey:chararray);
B = foreach raw generate com.pala.practice.PigIDNADecode(rowkey);
C = filter raw by (rowkey matches '.*xn--.*');
dump raw;
dump C;
--STORE C into 'idnaUrls' using PigStorage()
