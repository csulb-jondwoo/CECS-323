This script reads in a correctly formatted excel sheet and outputs text in a SQL INSERT ready statement.

Dependencies:
Python3
openpyxl (pip install)


a couple things about this script:
1. the excel file you create MUST be the same name as the table you want to insert into (ex: headChef.xlsx = headChef table)
2. the excel file MUST be in the same folder as the script
3. went entering date into excel columns make sure DATE(yy-mm-dd) and TIME(hh:mm:ss) are formatted correctly 
4. make sure data matches up with what you guys want in the table rows (ex: CA for state, not California or vice versa)


*sample excel sheets with dummy data provided
*not exhaustively tested
*check links.txt for random generators for commonly used things
