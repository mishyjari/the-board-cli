require_relative "../../config/environment.rb"

# A CLI tool to prompt user for datetime info and return a datetime object.
# Throws out of range error when trying to initialize time instance with hours and minutes (date alone works)

def get_time_obj
  t = Time.now
  puts "Current time #{t}"
  puts "Enter the day (leave blank if today)"
  puts "Prefered format: mm/dd/yyyy, will assume year if blank. Additional format handlers to come."
  print "> "
  date = gets.chomp
  if date.length == 0
    d = t.day
    m = t.month
    y = t.year
  else
    date = date.split("/")
    d = date[1]
    m = date[0]
    if date[2]
      y = date[2]
    else
      y = t.year
    end
  end

  puts "Year: #{y} Month: #{m} Day: #{d}"

  puts "Enter the time. 24 Hour format seperated by a colon (e.g., 18:33). Additional format handlers to come."
  puts "Leaving this blank will be interpreted as midnight (00:00)"
  print "> "
  time = gets.chomp.split(":")
  h = time[0]
  m = time[1]

  puts "Hour: #{h} Minute: #{m}"

  puts "All values saved locally, but Time.new(y,m,d,h,m) throws out of range error! Why?!"
  puts "Press enter to exit"
  gets.chomp
  #binding.pry
  #Time.new(y,m,d,h,m)
end

