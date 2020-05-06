This script reads in a correctly formatted excel sheet and outputs text in a SQL INSERT ready statement.

Dependencies:<br/>
Python3<br/>
openpyxl (pip install)<br/>


a couple things about this script:
1. the excel file you create MUST be the same name as the table you want to insert into (ex: headChef.xlsx = headChef table)
2. the excel file MUST be in the same folder as the script
3. when entering date into excel columns make sure DATE(yy-mm-dd) and TIME(hh:mm:ss) are formatted correctly 
4. make sure data matches up with what you guys want in the table rows (ex: CA for state, not California or vice versa)
5. output is missing the necessary comma for each row and semicolon at the end. but that should be simple enough to include into DML by hand

*sample excel sheets with dummy data provided<br/>
*not exhaustively tested<br/>
*check links.txt for random generators for commonly used things<br/>
