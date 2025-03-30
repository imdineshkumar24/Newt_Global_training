# -*- coding: utf-8 -*-
"""NewtGlobal-assingments.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1mIQjCboiPF5iDFmnCBUbNZot-_YlGh1s

Spark Session
"""

!pip install pyspark

from pyspark.sql import SparkSession
spark= SparkSession.builder.master("local[1]").appName("NewtGobal").getOrCreate()

spark

"""display version & masternode address

count() action
"""

sc=spark.sparkContext
data=[1,2,3,4,5,6,7,8,9,10,11,12]
rdd=sc.parallelize(data)
print(rdd.count())

"""collect action"""

sc=spark.sparkContext
data=[1,2,3,4,5,6,7,8,9,10,11,12]
rdd=sc.parallelize(data)
print(rdd.collect())

print(rdd.first())

sc=spark.sparkContext
data=[1,2,3,4,5,6,7,8,9,10,11,12]
rdd=sc.parallelize(data)
print(rdd.take(8))

sc=spark.sparkContext
data=[1,2,3,4,5,6,7,]
rdd=sc.parallelize(data)
print(rdd.reduce(lambda x,y :x+y))

sc=spark.sparkContext
save_rdd=sc.parallelize([1,2,3,4,5,6])
save_rdd.saveAsTextFile("file3.txt")

sc=spark.sparkContext
my_rdd =sc.parallelize([1,2,3,4,5,6])
print(my_rdd.map(lambda x: x+10).collect())

sc=spark.sparkContext
filter_rdd =sc.parallelize([1,2,3,4,5,6])
print(filter_rdd.filter(lambda x: x%2==0).collect())

filterstr_rdd =sc.parallelize(["rohit","dhoni","virat","raina","dhawan"])
print(filterstr_rdd.filter(lambda x: x.startswith('r')).collect())

u_inp=sc.parallelize([1,2,3,4,5,6,7,8,9,10,11,12])
u_rdd1=u_inp.filter(lambda x: x%2==0)
u_rdd2=u_inp.filter(lambda x: x%3==0)
print(u_rdd1.union(u_rdd2).collect())

i_inp=sc.parallelize([1,2,3,4,5,6,7,8,9,10,11,12])
i_rdd1=i_inp.filter(lambda x: x%2==0)
i_rdd2=i_inp.filter(lambda x: x%3==0)
print(i_rdd1.intersection(i_rdd2).collect())