
$input_flows = $input_dir + "\_input_flows\" + $input_flows_name 
$mapping_file = $input_dir + "\" + $mapping_file_name

# create folders

#output
$output_dir = $input_dir + "\output"
If(!(test-path $output_dir))
{
    New-Item -Path $output_dir -ItemType "directory"
}

if($lang){
    $lang_output_dir = $output_dir + "_" + $lang
    If(!(test-path $lang_output_dir))
    {
        New-Item -Path $lang_output_dir -ItemType "directory"
    }
}


#output json
$output_json_dir = $output_dir + "\json"
If(!(test-path $output_json_dir))
{
    New-Item -Path $output_json_dir -ItemType "directory"
}

if($lang){
    $lang_output_json_dir = $lang_output_dir + "\json"
    If(!(test-path $lang_output_json_dir))
    {
        New-Item -Path $lang_output_json_dir -ItemType "directory"
    }
}


#output csv
$output_csv_dir = $output_dir + "\csv"
If(!(test-path $output_csv_dir))
{
    New-Item -Path $output_csv_dir -ItemType "directory"
}

if($lang){
    $lang_output_csv_dir = $lang_output_dir + "\csv"
    If(!(test-path $lang_output_csv_dir))
    {
        New-Item -Path $lang_output_csv_dir -ItemType "directory"
    }
}



#output excel
$output_excel_dir = $output_dir + "\excel"
If(!(test-path $output_excel_dir))
{
    New-Item -Path $output_excel_dir -ItemType "directory"
}

if($lang){
    $lang_output_excel_dir = $lang_output_dir + "\excel"
    If(!(test-path $lang_output_excel_dir))
    {
        New-Item -Path $lang_output_excel_dir -ItemType "directory"
    }
}




# populate folders

#json
# node create_excel_rows.js $input_flows $mapping_file $output_json_dir $lang
Write-Output "Produced json rows"

#csv
node .\create_csv_files.js $output_json_dir $output_csv_dir
if($lang){
    node .\create_csv_files.js $lang_output_json_dir $lang_output_csv_dir
}
Write-Output "produced csv files"

#excel
python .\create_single_excel.py $output_csv_dir $output_excel_dir
if($lang){
    python .\create_single_excel.py $lang_output_csv_dir $lang_output_excel_dir
}

Write-Output "produced excel files"

