def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  hobbies = []
  name = gets.chomp

  while !name.empty? do
    puts "Please enter hobby"
    hobby = gets.chomp
    hobbies.push(hobby) if !hobbies.include? hobby
    students << {name: name, cohort: :november, hobby: hobby}
    if students.count == 1
      puts "Now we have 1 student with this hobby: #{hobby}"
    else
      puts "Now we have #{students.count} students with these hobbies: #{hobbies.join(", ")}"
    end
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
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort) (#{students[i][:hobby]} hobby)"
      i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
