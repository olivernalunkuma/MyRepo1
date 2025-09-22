#!/bin/bash

#number 1
mkdir -p AY20252026
cd AY20252026

while IFS=, read -r code firstname surname program; do

code=$(echo "$code" | tr -d '"')
firstname=$(echo "$firstname" | tr -d '"')
surname=$(echo "$surname" | tr -d '"')
program=$(echo "$program" | tr -d '"')

if [[ "$code" == "Code" ]]; then
continue
fi


mkdir -p "$program"

student_dir="$program/$code"
mkdir -p "$student_dir"

email=$(echo "${firstname}.${surname}@aims.ac.rw" | tr '[:upper:]' '[:lower:]')
echo "$firstname $surname" > "$student_dir/student_info.txt"
echo "$email" >> "$student_dir/student_info.txt"

echo "Student folder and file for: $firstname $surname ($program)"
done < ../student_info.csv

#number 2
#(i)
sum_calculator() {
declare n=$1
declare mode=$2 # "divisible" or "not_divisible"
declare result=0

if [ "$mode" = "divisible" ]; then
# Sum of the squares of all numbers from 1 to n divisible by 3
for ((i=1; i<=n; i++)); do
if ((i % 3 ==0)); then
result=$((result + i*i))
fi
done
elif [ "$mode" = "not_divisible" ]; then

# Sum of the cubes of numbers from 1 to n that are not divisible by 3
for ((i=1; i<=n; i++)); do
if (( i % 3 != 0 )); then
result=$((result + i*i*i))
fi
done
fi

echo "$result"
}

#(ii)
echo "Task 2: Sum Calculator"
read -p "Enter a positive integer n: " n

case "$n" in
  ''|*[!0-9]*|0) 
    echo "Please enter a positive integer"
    exit 1
    ;;
esac


echo "Sum of squares of numbers divisible by 3: $(sum_calculator $n divisible)"
echo "Sum of cubes of numbers not divisible by 3: $(sum_calculator $n not_divisible)"

#number 3
while true; do
read -p "Enter day number from 0 for Sunday to 6 for Saturday: " day

case $day in
0) echo "Sunday - Weekend"; break ;;
1) echo "Monday - Working day"; break ;;
2) echo "Tuesday - Working day"; break ;;
3) echo "Wednesday - Working day"; break ;;
4) echo "Thursday - Working day"; break ;;
5) echo "Friday - Working day"; break ;;
6) echo "Saturday - Weekend"; break ;;
*) echo "Please enter a number from 0 to 6." ;;
esac		
done


#number 4
while true; do
read -p "Enter month number from 0 for December to 11 for November: " month

case $month in
0) echo "December: 31 days"; break ;;
1) echo "January: 31 days"; break ;;
2) echo "February: 28 days" ;;  # ignoring Leap year 
3) echo "March: 31 days"; break ;;
4) echo "April: 30 days"; break ;;
5) echo "May: 31 days"; break ;;
6) echo "June: 30 days"; break ;;
7) echo "July: 31 days"; break ;;
8) echo "August: 31 days"; break ;;
9) echo "September: 30 days"; break ;;
10) echo "October: 31 days"; break ;;
11) echo "November: 30 days"; break ;;

*) echo "Please enter number from 0 to 11." ;;
esac
done

#number 5
echo "For loop version:"
for ((i=1; i<=3; i++)); do
echo "Oliver Nalunkuma"
done

echo "While loop version:"
count=1
while [ $count -le 3 ]; do
echo "Oliver Nalunkuma"
count=$((count + 1))
done

#number 6

read -p "Enter first number (x0): " x0
read -p "Enter second number (x1): " x1

echo "First 15 terms of Fibonacci sequence:"
echo "1: $x0"
echo "2: $x1"

for ((i=3; i<=15; i++)); do
next=$((x0 + x1))
echo "$i: $next"
x0=$x1
x1=$next
done

#number 7
read -p "Enter x0: " x0
read -p "Enter x1: " x1

echo "First 30 terms of the sequence:"
echo "1: $x0"
echo "2: $x1"

for ((i=3; i<=30; i++)); do
next=$(echo "scale=3; (1/2)*$x1 - 3*$x0" | bc)
echo "$i: $next"
x0=$x1
x1=$next
done

#number 8
#(a) for loop
sum=0
read -p "Enter n for sum of squares: " n

for (( i = 1; i <= n; i++ )); do
  (( sum += i * i ))
done
echo "The sum of squares from 1 to $n using for loop is: $sum"


#(a) while loop
i=1
sum=0

while (( i <= n )); do
  (( sum += i * i ))
  (( i++ ))
done

echo "The sum of squares from 1 to $n using while loop is: $sum"

#(b)
read -p "Enter M: " M
current_sum=0
n=0
while (( current_sum < M )); do
  (( n++ ))
  (( current_sum += n * n ))
done

echo "Smallest n such that sum >= $M: $n (Total = $current_sum)"

#number 9
#(a) 
read -p "Enter a natural number: " num
echo "Divisors of $num:"
for ((i = 1; i <= num; i++)); do
  if (( num % i == 0 )); then
    echo -n "$i "
  fi
done


#(b)
read -p "Enter a natural number: " num
echo "Prime factors of $num:"
value=$num
factor=2
while (( value > 1 )); do
  if (( value % factor == 0 )); then
    echo -n "$factor "
    (( value /= factor ))
  else
    (( factor++ ))
  fi
done

#number 10
while true; do
  read -p "Enter a number between 0 and 9: " num
  if (( num >= 0 && num <= 9 )); then
    break
  else
    echo "Enter a single-digit number between 0 and 9."
  fi
done

#ask user to enter positive integer for N
while true; do
  read -p "Enter N: " N
  if [[ "$N" =~ ^[0-9]+$ ]]; then
  if (( N > 0 )); then
      break
    else
      echo "N is always greater than 0."
    fi
  else
    echo "Enter a positive integer."
  fi
done

# Display multiplication table
echo ""
echo "Multiplication table for $num up to $N:"
echo "----------------------------------------"
for ((i = 1; i <= N; i++)); do
  (( result = num * i ))
  printf "%2d x %2d = %3d\n" "$num" "$i" "$result"
done
  


#number 11
echo "Numbers that are multiples of 3, 7, or 11:"
for ((i = 0; i <= 40; i++)); do
  if (( i % 3 == 0 || i % 7 == 0 || i % 11 == 0 )); then
    echo -n "$i "
  fi
done

#number 12
while true; do
  read -p "Enter the x-point: " x
  read -p "Enter the y-point: " y

  # Validate input: must be integers
  if ! [[ "$x" =~ ^-?[0-9]+$ && "$y" =~ ^-?[0-9]+$ ]]; then
    echo "Please enter integer values for both x and y."
    echo ""
    continue
  fi

  echo "You entered a point A($x,$y)."

  if (( x == 0 && y == 0 )); then
    echo "The point A($x,$y) is the origin."
  elif (( x == 0 )); then
    echo "The point A($x,$y) lies on the y-axis."
  elif (( y == 0 )); then
    echo "The point A($x,$y) lies on the x-axis."
  elif (( x > 0 && y > 0 )); then
    echo "The point A($x,$y) belongs to the 1st quadrant."
  elif (( x < 0 && y > 0 )); then
    echo "The point A($x,$y) belongs to the 2nd quadrant."
  elif (( x < 0 && y < 0 )); then
    echo "The point A($x,$y) belongs to the 3rd quadrant."
  else
    echo "The point A($x,$y) belongs to the 4th quadrant."
  fi

  echo ""
  read -p "Do you want to enter another point? (y/n): " answer
  if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Finished."
    break
  fi
done


#number 13
while true; do
  while true; do
    read -p "Enter an integer x (0–9): " x
    if [[ "$x" =~ ^[0-9]$ ]]; then
      break
    else
      echo "x must be a single digit between 0 and 9."
    fi
  done

  
  while true; do
    read -p "Enter an integer max (0–255): " max
    if [[ "$max" =~ ^[0-9]+$ ]] && (( max >= 0 && max <= 255 )); then
      break
    else
      echo "max must be an integer between 0 and 255."
    fi
  done

  echo "Multiples of $x between 0 and $max:"
  if (( x == 0 )); then
    echo "0 (Note: Only 0 is a multiple of 0 in this context.)"
  else
    for (( i = 0; i <= max; i++ )); do
      if (( i % x == 0 )); then
        echo "$i"
      fi
    done
  fi

 
  read -p "Do you want to try again? (y/n): " answer
  if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Finished."
    break
  fi
  echo ""
done

























