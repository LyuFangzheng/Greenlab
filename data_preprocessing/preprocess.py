#!/usr/bin/env python
# coding: utf-8

# In[76]:


import pandas as pd
import os, os.path
import glob
import shutil, sys
import re

# experiment result path. e.g: 'C:/Jupyter/J7/'
EXPERIMENT_RESULT = sys.argv[1]
# first step result path. e.g: 'C:/New_Data/'
OUTDIR = sys.argv[2]
# set path. e.g: 'C:/New_Data/Processed'
CHDIR = sys.argv[3]
# set output file. e.g: 'result.csv'
OUTFILE = sys.argv[4]


# In[77]:


result_path = EXPERIMENT_RESULT


# In[78]:


def traversalDir_FirstDir(path):
    lists = []
    if (os.path.exists(path)):
        files = glob.glob(path + '/*' )
        for file in files:
            if (os.path.isdir(file)):
                h = os.path.split(file)
                lists.append(h[1])
    return lists

def traversalDir_File(path):
    lists = []
    if (os.path.exists(path)):
        files = glob.glob(path + '/*' )
        for file in files:
            if (~os.path.isdir(file)&('Joule_results_' in os.path.basename(file))):
                h = os.path.split(file)
                lists.append(h[1])
    return lists

traversalDir_FirstDir(result_path)


# In[79]:


for list in lists:
    result_path_new = os.path.join(result_path,list,'batterystats/')
    outdir = OUTDIR
    new_lists = traversalDir_File(result_path_new)
#     print(new_lists)
    for new_list in new_lists:
        df = pd.read_csv(result_path + '%s/batterystats/%s' %(list,new_list))
        
        df.to_csv(outdir+'%s.csv' %(re.sub(r'\d+', '',list.strip('android-runner-masterexamplesbatterystatsfinalapks').replace('lintcomexample', ""))), mode='a', header=False)
    df = pd.read_csv(outdir+'%s.csv' %(re.sub(r'\d+', '',list.strip('android-runner-masterexamplesbatterystatsfinalapks').replace('lintcomexample', ""))), header=None)
    df.columns = ['times',re.sub(r'\d+', '',list.strip('android-runner-masterexamplesbatterystatsfinalapks').replace('lintcomexample', ""))]
    df = df.drop(columns=['times'])
    df = df.reset_index().rename(columns={'index':'times'})
    df.to_csv(outdir+'Processed/%s.csv' %(re.sub(r'\d+', '',list.strip('android-runner-masterexamplesbatterystatsfinalapks').replace('lintcomexample', ""))))


# In[80]:


os.chdir(CHDIR)

dfs = [pd.read_csv(f, index_col=[0]) for f in os.listdir(os.getcwd()) if f.endswith('csv')]

finaldf = pd.concat(dfs, axis=1, join='inner').sort_index()
cols = finaldf.columns.tolist()
# cols = cols[-1:] + cols[:-1]

finaldf.times = finaldf.times+1
finaldf = finaldf.loc[:, ~finaldf.columns.duplicated()]
#finaldf.to_excel(OUTFILE)
finaldf.to_csv(OUTFILE)


# In[ ]:




