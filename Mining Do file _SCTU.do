//set directory
cd "insert the directory"
//save pvhh_data
use training_data, clear
ta lga

//AGED (60 ABOVE)
keep if agey >= 60
ta lga

//PWD or RONICALLYILLNESS
keep if disability == 1 
ta lga

keep if chronicallyill ==1

//Urban Dwellers
keep if urbanrural  == 1

ta lga

//contract dataset and export
contract lga
rename _freq beneficiaries
export excel mined_lga_less80 if beneficiaries<85, sheetreplace firstrow(variable)
preserve
restore
export excel mined_lga, sheetreplace firstrow(variable)
export excel mined_lga_above80 if beneficiaries>85, sheetreplace firstrow(variable)




















/*
// Subsetting using the `in` command
keep if inlist(sex, 1, 1)

// Subsetting using logical conditions

keep if agey >= 30 & sex == 1

// Subsetting using comparison operators

keep if agey < 20 | maritalstatus == 1

// Subsetting using logical operators

keep if sex == 2 & (agey >= 30 | maritalstatus == 1)



// Subsetting using the `if` and `in` commands together
use pvhh_data, clear
keep if agey >= 40 & inlist(educationalqualification, 1, 2, 3, 4, 5, 6)

