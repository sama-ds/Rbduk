library(devtools)
library(tidyverse)
library(fs)
library(here)
library(testthat)
#Shouldn't be creating this inside a project, but for now I'll keep it here
devtools::create_package(here())

#More->Show Hidden files in file pane
#shows dotfiles
usethis::use_git() #Allow to commit all intiial files

#With cloud repos- I linked this project to a git folder in the normal way before doing this
#Show that .git has been created
dir_info(all = TRUE, regexp = "^[.]git$") %>%
  select(path, type)

#Create a function within the R folder
#Run this line with function names
use_r("is_integer64.R")
#Write the function in the file that opens
#This simulates the process of building, installing and attaching the package
load_all()

#We can now use functions in the package, but they aren't in the global workplace
#'Proof of this:
exists("is_integer64", where = globalenv(), inherits = FALSE)

#We should now commit this file

#With any addition, we should check that all the "moving parts" still work
check()
#Deal with the issues
#Expected warning: "Non-standard lisence specification..."

#DESCRIPTION file provides metadata about the package
#Set yourself as author, and write some descriptive texts in the titel and description fields
#Do this by going into the DESCRIPTION file and editing

#Use the MIT lisence
use_mit_license("Sam Atkin")
#When run, check the new LISENCE file has your name and current year

#Each function must come with doccumentation for users
#To do this, open the .R file (in this case "is_integer64.R")
#Use special comments #'
#Each function should have:
#a summary
#list what the each parameter should be with @params
#list what the function returns with @return
#Contain an example with @example followed by an example useage of the fucntion
#When this is complete, we document this
document()
#This will also update the NAMESPACE file, based on the @export found in roxygen comments
#This is what makes a user able to run library(Rbduk)

#Preview help file:
?is_integer64
#This will say "Rendering development documentation for 'function_name'
#This is curretnly showing default- we have doccumented within our source, but we havent installed the packaged yet
#Doccumentation will only show when the package has been formally built and installed

#We should check() often
check()

#Commit all these new files to GIT

#We can now install the package
install()

#Now, we can run library(Rbduk) and use the functions within it

library(Rbduk)
is_integer64(100)

#Although this works, all function should have comprehensive unit tests
use_testthat()
#This creates testing files but we must write the tests
#Run this line to open the tests for a named function
use_test("is_integer64")

#Reload and apply the test
load_all()
test()

#'Tests also run whenevr we run check()
check()

#Try the function
is_integer64(1)

#If we have dependencies (i.e other packages we need)
#we don't read them in, we use the syntax "package::" before the function
#To do this, we need to specifty we are using that package

#We add another function that relies on the stringr package
use_package("stringr")
#This adds the package to the imports field of the description

#Now we add a second function

#Initiate a new .R with use_r
#In this .R window that loads we add the doccuemntation and the function
use_r("pretty_postcode")

load_all()

pretty_postcode("SW1a2nP")

#Run document() to add it to the namespace
document()

#If we had access, we would use use_github() here- instead we use google source repos
#We must create a readme for those using the package
#To edit this, edit this .rmd file, that renders the .md file (not the .md file itself)
use_readme_rmd()

check()

load_all()

use_test("pretty_postcode")

test()

#Add more functions
use_r("is_postcode")
load_all()
document()
install()
#Update readme to reflect addition
