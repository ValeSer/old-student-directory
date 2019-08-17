# Once you complete the previous exercise,
# change the way the users are displayed:
# print them grouped by cohorts.
# To do this, you'll need to get a list of all existing
#   cohorts (the map() method may be useful but it's not the only option),
#   iterate over it and only print the students from that cohort.



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

def group_by_cohort(students)
  group = students.group_by do |student|
    student[:cohort]
  end
  group
end

def print_by_cohort(group)
  puts "Students by cohort"
  group.each do |cohort, students|
    student_names = students.map do |student|
      student[:name]
    end
    puts "#{cohort}: #{student_names.join(", ").to_s}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end




students = input_students
print_header
print_by_cohort(group_by_cohort(students))
print_footer(students)
