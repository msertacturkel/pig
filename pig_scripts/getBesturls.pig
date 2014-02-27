REGISTER /home/sertac/veriler/piggybank.jar ;
Register 'hdfs:///user/sertac/urlreverseforseed.py' using jython as urlhelper;

data = LOAD 'domainseed.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE', 'NOCHANGE', 'SKIP_INPUT_HEADER')
    AS (key:int,domain:chararray,domaincc:int,url:chararray,urlcc:int);


X = FOREACH data GENERATE domain,domaincc,url,urlcc;
B = GROUP X BY domain;
top1 = foreach B {
        sorted = order X by urlcc desc;
        top    = limit sorted 1;
        generate group, flatten(top);
};
--dump top1;
C = FOREACH top1 GENERATE url;
STORE C INTO '/user/sertac/datas/C';
Z = FOREACH top1 GENERATE domain,url;


D = foreach Z generate urlhelper.unreverse(domain) as fixdomain ,url;
F = FILTER  D BY fixdomain == url;
G = FOREACH F GENERATE url;
--dump G;
STORE G INTO '/user/sertac/datas/G';


M = FILTER  D BY fixdomain != url;
N = FOREACH F GENERATE url;
STORE N INTO '/user/sertac/datas/N';




