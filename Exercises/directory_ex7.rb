# In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty?
# Can you supply a default value?
# The input will be given to you as a string?
# How will you convert it to a symbol?
# What if the user makes a typo?



def input_students
  months = [
    :january,
    :february,
    :march,
    :april,
    :may,
    :june,
    :july,
    :august,
    :september,
    :october,
    :november,
    :december
  ]
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp

  while !name.empty? do
    puts "Please type a cohort"
    cohort = gets.chomp
    while !months.include?(cohort.downcase.to_sym) && !cohort.empty?
      puts "Please type a valid cohort"
      cohort = gets.chomp
    end

    if !cohort.empty?
      students << {name: name, cohort: cohort.to_sym}
    else
      students << {name: name, cohort: :unknown}
    end
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
