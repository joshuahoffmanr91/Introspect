#!/bin/bash

#    _________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence_____________________________________ *|
#   | /                                                                                             \ |
#   | |         This program is free software: you can redistribute it and/or modify                | |
#   | |         it under the terms of the GNU General Public License as published by                | |
#   | |         the Free Software Foundation, either version 3 of the License, or                   | |
#   | |         (at your option) any later version.                                                 | |
#   | |                                                                                             | |
#   | |         This program is distributed in the hope that it will be useful,                     | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                      | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                       | |
#   | |         GNU General Public License for more details.                                        | |
#   | |                                                                                             | |
#   | |         You should have received a copy of the GNU General Public License                   | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.               | |
#   | |                                                                                             | |
#   | \_____________________________________________________________________________________________/ |
#   |* ______________________________________Introspect_|_4/5/2020__________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|
# MD5: cdff60b1cd4f70c27b1d25c24e8caf2a

Introspect () {

Hard=$(awk 'NR==27 {print $3}' "$0" | cut -c 1-32 ) #~#
Soft=$(awk '/'#~#'/ {gsub(/#~#/, "");print $0}' "$0" | md5sum | cut -c 1-32) #~#
Time=$(date +'%H:%M_%m-%d') #~#
#~#
	Retrospect () { #~#
	#~#
	Verfied=$( awk '!/'#~#'/ {gsub(/'$Hard'/, "");print $0}' $0 | md5sum | cut -c 1-32 ) #~#
	Checked=$( awk '!/'#~#'/ {gsub(/'$Soft'/, "'$Verfied'"); print $0}' "$0" ) #~#
	#~#
		if [[ $(awk 'NR==27 {print $3}' "$0" ) != $Verfied ]]; then #~#
		export File=${Time}_${Verfied:0:5}.bash #~#
		echo "$Checked" > ${File} #~#
		fi #~#
	#~# 
	} #~#
	#~#
	if [[ $Hard = $Soft ]]; then #~#
	Retrospect #~#
	else #~#
	exit 2 #~#
	fi #~#
	#~#
Over=$(awk 'NR==27 {print substr($3 ,1 ,32)}' "${File:=$0}" )
Easy=$(awk '{sub(/'$Over'/, ""); print $0}' "${File:=$0}" | md5sum | cut -c 1-32 )

	if [[ $Over = $Easy ]]; then 
	${Introspect_return:=return} 0
	fi
	
return 1
 
}
 
Introspect
