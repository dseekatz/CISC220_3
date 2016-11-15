#David Seekatz      16das4  20037710
#Sean Eylott        13se18  10141657
#Simon Ungar        14seau  10149546
#Brooke Resendes    13brr2  10141112

#Question6
#!/bin/bash

#This script takes the info from three text files, course.txt, student.txt and student_course.txt
#And joins them together to make an array with a students name and which courses they are taking.

#Get text from student.txt and store info in studentArray
i=0
while read line
do	
	studentArray[i]="($line)"
	i=$((i+1))
done < student.txt

#Get names and student numbers into their own arrays
for((j=0;j<6;j++)); do
	names[j]="${studentArray[j+1]:8:-1}"
	studentID[j]="${studentArray[j+1]:1:7}"
done

#Get text from course.txt and store info in courseArray
k=0
while read line
do
	courseArray[k]="($line)"
	k=$((k+1))
done < course.txt

#Get course names into it's own array
for((l=0;l<6;l++)); do
	courseNames[l]="${courseArray[l+1]:3:-1}"
	courseID[l]=$((l+1));
done

#Get text from student_course.txt and store info in scArray
m=0
while read line
do
	scArray[m]="($line)"
	m=$((m+1))
done < student_course.txt


#Change all student ID numbers in scArray to  student names in finArray
finArray[0]="Student Name  Course Name"
for ((n=0;n < (${#scArray[@]})-1;n++)) do
	for ((p=0;p < (${#studentID[@]})-1;p++)) do
		if [ "${scArray[n+1]:1:7}" == "${studentID[p]}" ]; then
			finArray[n+1]="${names[p]}"
		fi
	done
done

#Change all course ID's in scArray to course names in finArray
for ((q=0;q < (${#finArray[@]})-1;q++)) do
	for ((r=0;r < (${#studentID[@]})-1;r++)) do
		if [ "${scArray[q+1]:8:-1}" == "${courseID[r]}" ]; then
			finArray[q+1]="   ${finArray[q+1]}        ${courseNames[r]}"
		fi
	done
done

#Output the final array
for ((s=0;s < (${#finArray[@]})-1;s++)) do
	echo "${finArray[s]}"
done
