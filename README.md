# Pewlett Hackard Analysis using SQL
## Overview
I was tasked with determining the number of retiring employees at Pewlett Hackard. To prepare for the transition, vacant positions must be classified by the title and quantity of the retiring employee. In addition, this information helped determine the number of retirement packages and  employees eligible for the mentorship program. 
### Preprocessing
[Entity Relationship Diagrams](https://github.com/DWashington3/Pewlett-Hackard-Analysis/blob/709d14e4b32e54a281fb58ff6511bb8918f51553/EmployeeDB.png) were used to map the primary keys, foreign keys and data types from existing csv files. First, I created the conceptual ERD on [Quick DBD](https://www.quickdatabasediagrams.com/) for the table names and column headers. Next, I layered the logical diagram by adding the data types and keys. Then I created the physical relationships with the keys. After mapping the realtions PostgreSQL was used to modify the data and saved in csv files. 
## Results
### Number of retiring employees by title
- The employee number, names, title from and to date were joined via "INNER JOIN" to create the table [retirment_titles.csv](https://github.com/DWashington3/Pewlett-Hackard-Analysis/blob/14955b83ba8b01e517744f9814197f47e944f12b/Data/retirement_titles.csv).

<img width="243" alt="retirement_title_tbl" src="https://user-images.githubusercontent.com/87162266/137834238-7af88ab8-15fd-4ed3-b1c6-490700125eb7.png">

- Due to promotions, there were duplicate employees listed. "DISTINCT ON ()" allowed the retrieval of unique employees, found in the [unique_titles.csv](https://github.com/DWashington3/Pewlett-Hackard-Analysis/blob/14955b83ba8b01e517744f9814197f47e944f12b/Data/unique_titles.csv)

<img width="269" alt="unique_titles" src="https://user-images.githubusercontent.com/87162266/137834203-24702596-cb5f-47b6-8f9e-e17bbcd753d5.png">


### Number of employees eligible for mentorship
- The employee number, names, birth date, from date, to date, and title were joined with two "INNER JOINS". 
- Using "WHERE" I filtered by birth date of the employees eligible for the [mentorship](https://github.com/DWashington3/Pewlett-Hackard-Analysis/blob/14955b83ba8b01e517744f9814197f47e944f12b/Data/mentorship_eligibilty.csv). The eligible employees DOB is between January 1, 1965- December 31, 1965. 

<img width="306" alt="mentorship" src="https://user-images.githubusercontent.com/87162266/137834171-7bbbb2c8-6037-4b57-b8de-fe766c18d8ef.png">

## Conclusion
There are a total of 90,398 [retiring](https://github.com/DWashington3/Pewlett-Hackard-Analysis/blob/14955b83ba8b01e517744f9814197f47e944f12b/Data/retiring_titles.csv) employees. The engineering department will have the greatest change with 43,636 engineers retiring. There are only 1,549 eligible mentorship employees with the current DOB qualification. This will definitely cause friction in the "silver tsunami". To mitigate this i'd suggest increasing the DOB range for the mentorship requirement. By changing the range from January 1, 1965- December 31, 1965 to January 1, 1960- December 31, 1965, 93,756 employees become eligible for the mentorship program. 

<img width="223" alt="mentorship_mod" src="https://user-images.githubusercontent.com/87162266/137835293-eab08efd-25d8-4c58-aba5-87037b063723.png">
