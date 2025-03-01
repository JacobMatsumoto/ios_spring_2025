import UIKit

var team = [98:"Connor Bedard", 59:"Tyler Bertuzzi", 28:"Colton Dach", 16:"Jason Dickinson", 8:"Ryan Donato", 17:"Nick Foligno", 23:"Philipp Kurashev", 77:"Patrick Maroon", 95:"Ilya Mikheyev", 91:"Frank Nazar", 73:"Lukas Reichel", 84:"Landon Slaggert", 15:"Craig Smith", 86:"Teuvo Teravainen", 42:"Nolan Allan", 78:"TJ Brodie", 38:"Ethan Del Mastro", 4:"Seth Jones", 25:"Alec Martinez", 5:"Connor Murphy", 72:"Alex Vlasic", 34: "Petr Mrazek", 40:"Arvid Soderblom"]

var countries = [("Connor Bedard", "Canada"), ("Tyler Bertuzzi", "Canada"), ("Colton Dach", "Canada"), ("Jason Dickinson", "Canada"), ("Ryan Donato", "USA"), ("Nick Foligno", "USA"), ("Philipp Kurashev", "Switzerland"), ("Patrick Maroon", "USA"), ("Ilya Mikheyev", "Russia"), ("Frank Nazar", "USA"), ("Lukas Reichel", "Germany"), ("Landon Slaggert", "USA"), ("Craig Smith", "USA"), ("Teuvo Teravainen", "Finland"), ("Nolan Allan", "Canada"), ("TJ Brodie", "Canada"), ("Ethan Del Mastro", "Canada"), ("Seth Jones", "USA"), ("Alec Martinez", "USA"), ("Connor Murphy", "USA"), ("Alex Vlasic", "USA"), ("Petr Mrazek", "Czech Republic"), ("Arvid Soderblom", "Sweden")]

var ages = [("Connor Bedard", 19), ("Tyler Bertuzzi", 30), ("Colton Dach", 22), ("Jason Dickinson", 29),("Ryan Donato", 28), ("Nick Foligno", 37), ("Philipp Kurashev", 25), ("Patrick Maroon", 36), ("Ilya Mikheyev", 30), ("Frank Nazar", 21), ("Lukas Reichel", 22), ("Landon Slaggert", 22), ("Craig Smith", 35), ("Teuvo Teravainen", 30), ("Nolan Allan", 21), ("TJ Brodie", 34),("Ethan Del Mastro", 22), ("Seth Jones", 30), ("Alec Martinez", 37), ("Connor Murphy", 31), ("Alex Vlasic", 23), ("Petr Mrazek", 33), ("Arvid Soderblom", 25)]
var ages_str = [("Connor Bedard", "19"), ("Tyler Bertuzzi", "30"), ("Colton Dach", "22"), ("Jason Dickinson", "29"),("Ryan Donato", "28"), ("Nick Foligno", "37"), ("Philipp Kurashev", "25"), ("Patrick Maroon", "36"), ("Ilya Mikheyev", "30"), ("Frank Nazar", "21"), ("Lukas Reichel", "22"), ("Landon Slaggert", "22"), ("Craig Smith", "35"), ("Teuvo Teravainen", "30"), ("Nolan Allan", "21"), ("TJ Brodie", "34"),("Ethan Del Mastro", "22"), ("Seth Jones", "30"), ("Alec Martinez", "37"), ("Connor Murphy", "31"), ("Alex Vlasic", "23"), ("Petr Mrazek", "33"), ("Arvid Soderblom", "25")]

var height_inch = [("Connor Bedard", 70), ("Tyler Bertuzzi", 74), ("Colton Dach", 76), ("Jason Dickinson", 74), ("Ryan Donato", 72), ("Nick Foligno", 72), ("Philipp Kurashev", 72), ("Patrick Maroon", 75), ("Ilya Mikheyev", 74), ("Frank Nazar", 70), ("Lukas Reichel", 72), ("Landon Slaggert", 72), ("Craig Smith", 73), ("Teuvo Teravainen", 71), ("Nolan Allan", 74), ("TJ Brodie", 74), ("Ethan Del Mastro", 76), ("Seth Jones", 76), ("Alec Martinez", 73), ("Connor Murphy", 76), ("Alex Vlasic", 78), ("Petr Mrazek", 74), ("Arvid Soderblom", 75)]

var months = [("Connor Bedard", "July"), ("Tyler Bertuzzi", "February"), ("Colton Dach", "January"), ("Jason Dickinson", "July"), ("Ryan Donato", "April"), ("Nick Foligno", "October"), ("Philipp Kurashev", "October"), ("Patrick Maroon", "April"), ("Ilya Mikheyev", "October"), ("Frank Nazar", "January"), ("Lukas Reichel", "May"), ("Landon Slaggert", "June"), ("Craig Smith", "September"), ("Teuvo Teravainen", "September"), ("Nolan Allan", "April"), ("TJ Brodie", "June"), ("Ethan Del Mastro", "January"), ("Seth Jones", "October"), ("Alec Martinez", "July"), ("Connor Murphy", "March"), ("Alex Vlasic", "June"), ("Petr Mrazek", "February"), ("Arvid Soderblom", "August")]

//initializing sorting lists.
var sorted_ages = ages.sorted { $0.1 < $1.1 }
var sorted_countries = countries.sorted { $0.1 < $1.1 }
var added_age = 0
var num_of_ages = 0
var average_age = 0
var added_height = 0
var num_of_height = 0
var average_height = 0
//initializing tuples for the most popular month
var january = ("January", 0)
var february = ("Februry", 0)
var march = ("March", 0)
var april = ("April", 0)
var may = ("May", 0)
var june = ("June", 0)
var july = ("July", 0)
var august = ("August", 0)
var september = ("September", 0)
var october = ("October", 0)


for (name, age) in ages {
    added_age += age
    num_of_ages += 1
    average_age = added_age / num_of_ages
}
for (name, height) in height_inch {
    added_height += height
    num_of_height += 1
    average_height = added_height / num_of_height
}

for (name, month) in months {
    if month == "January" {
        january.1 += 1
    } else if month == "February" {
        february.1 += 1
    } else if month == "March" {
        march.1 += 1
    } else if month == "April" {
        april.1 += 1
    } else if month == "May" {
        may.1 += 1
    } else if month == "June" {
        june.1 += 1
    } else if month == "July" {
        july.1 += 1
    } else if month == "August" {
        august.1 += 1
    } else if month == "September" {
        september.1 += 1
    } else if month == "October" {
        october.1 += 1
    }
}
var num_month = [january, february, april, may, march, june, july, august, september, october]
var sorted_num_month = num_month.sorted { $0.1 > $1.1 }
print(sorted_num_month)
print(sorted_num_month[0])

        

print(sorted_ages)
print(sorted_countries)
print(average_age)
print(average_height)
