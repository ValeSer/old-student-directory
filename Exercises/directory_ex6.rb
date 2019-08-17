# Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned. 
def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(50)
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------------------".center(50)
end

def print(students)
  i = 0
  while i < students.length do
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)".center(50)
      i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
