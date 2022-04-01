import os
import pandas as pd
import glob
from os import listdir
from os.path import isfile, join
import sys

input_args = sys.argv
csv_folder_path = input_args[1]
excel_folder = input_args[2]


flow_cat_list =[o for o in os.listdir(csv_folder_path) 
                    if os.path.isdir(os.path.join(csv_folder_path,o))]


for flow_cat in flow_cat_list:
    path = csv_folder_path + '/' + flow_cat
    all_files = glob.glob(os.path.join(path, "*.csv"))


    writer = pd.ExcelWriter( excel_folder + '/' +flow_cat   + '.xlsx', engine='xlsxwriter')

    for f in all_files:
        df = pd.read_csv(f)
        print(f)
        df.to_excel(writer, sheet_name=os.path.splitext(os.path.basename(f))[0], index=False)

    writer.save()