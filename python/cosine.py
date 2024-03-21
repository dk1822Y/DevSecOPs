import math
import numpy as np
from sklearn.cluster import KMeans

def cosine_similarity(v1,v2):
    "compute cosine similarity of v1 to v2: (v1 dot v2)/{||v1||*||v2||)"
    sumxx, sumxy, sumyy = 0, 0, 0
    for i in range(len(v1)):
        x = v1[i]; y = v2[i]
        sumxx += x*x
        sumyy += y*y
        sumxy += x*y
    return sumxy/math.sqrt(sumxx*sumyy)

v1 = [3, 45, 7, 2]
v2 = [2, 54, 13, 15]
print(cosine_similarity(v1,v2))
