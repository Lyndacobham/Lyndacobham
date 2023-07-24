//set directory
cd "insert the directory"
//load data into stata
use training_data, clear
ta lga
//Unemployed
keep if inlist(b5labour, 6)
tab lga
//Youths
keep if agey >=18 & agey <=45
tab lga
//Education Qualification
keep if inlist(educationalqualification, 1, 2, 3,4,5,6)
tab lga



// Generate a counter for each ward
gen counter = 1

bysort ward: replace counter = _n if counter <= 15

// Keep the first 25 beneficiaries per ward
keep if counter <= 15

// Drop the counter and rnd variables
drop counter 
tab lga