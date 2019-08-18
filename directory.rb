@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "Type again or just hit return twice to finish"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    push_student(name, :november)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def load_students(filename = "students.csv")
  if !File.exists?(filename)
    puts "Error: File #{filename} does not exist"
    return
  end
  puts "Loading the students..."
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      push_student(name, cohort)
    end
  end
  puts "Students loaded"
end

def push_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
     load_students
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def ask_filename
  puts "Please enter filename (default students.csv)"
  STDIN.gets.chomp
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      filename = ask_filename
      filename.empty? ? save_students : save_students(filename)
    when "4"
      filename = ask_filename
      filename.empty? ? load_students : load_students(filename)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  # open the file for writing
  File.open(filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved"
end

try_load_students
interactive_menu
