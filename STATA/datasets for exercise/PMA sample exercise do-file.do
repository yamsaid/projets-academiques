************************************************************************************
* This do-file is STATA exercise for Macros
* Update the local macros for your-initials & today ( initials, which is your initials here), today (today, which is current date here)
* Run the do-file and check what’s the name of the log-file that newly generated
************************************************************************************
clear
clear matrix
clear mata
capture log close
set maxvar 15000
set more off
numlabel, add


* macro for your-initials & today
local initials XX
local today XX


*Create a log-file in your working directory and keep the records of commands in your do-file.
*log using "PMA data for exercise_`today'_`initials'.log", replace

log using "PMA2019_Bootcamp_exercise_`today'_`initials'.log", replace

*Save the log-file as “PMA data for exercise_date_your-initials.dta”
log close
