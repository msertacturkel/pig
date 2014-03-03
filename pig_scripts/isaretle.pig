REGISTER /home/sertac/veriler/piggybank.jar ;
Register 'hdfs:///user/sertac/fix.py' using jython as urlhelper;
Register 'hdfs:///user/sertac/fixurl.py' using jython as urlfix;
Register 'hdfs:///user/sertac/esle.py' using jython as esle;


data = LOAD 'seeds.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(';', 'YES_MULTILINE', 'NOCHANGE', 'SKIP_INPUT_HEADER')
    AS (domain:chararray,cc:int,uygunsuz:chararray,spam:chararray,bozuk:chararray,devlet:chararray);


a = FOREACH data GENERATE domain,cc,uygunsuz,spam,bozuk,devlet;
x = foreach a generate urlhelper.fix(domain) as fixdomain,cc,uygunsuz,spam,bozuk,devlet;
data2 = LOAD 'seedlist.txt' AS (url:chararray);
b = FOREACH data2 GENERATE url;

duzenle = foreach b generate urlfix.fix(url) as fixurl;
j = JOIN x by fixdomain, duzenle by fixurl;
son = foreach j generate fixdomain,cc,uygunsuz,spam,bozuk,devlet;
ILLUSTRATE son;

gonder = foreach son generate esle.esle(fixdomain,cc,uygunsuz,spam,bozuk,devlet) as seed; 
--filterxxx = FILTER son BY x.uygunsuz == 'xxx';
--ILLUSTRATE gonder;
--dump gonder;
STORE gonder INTO '/user/sertac/gonder';


