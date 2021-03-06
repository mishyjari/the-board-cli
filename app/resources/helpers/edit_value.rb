require_relative "../../../config/environment.rb"

# Purpose:
  # Updating many different hashes with user input and saving to db
# Usage:
  # Takes three arguments
    # => hash: the hash being updated
    # => key: the name of the key ~as a string~ to be updated
    # => str: the name of the key in a text-friendly format
# Example
  # my_hash = {foo_bar: 'chopped fooey'}
  # edit_value({ hash: my_hash, key: 'foo_bar', str: 'Foo Bar' })
  # User will be promoted to update Foo Bar
  # > hello world
  # my_hash[:foo_bar] => 'hello world'

def edit_value(key:k,str:s,hash:c)
  key = key.to_sym
  puts "EDIT #{str.upcase}"
  print "Current #{str.downcase}: #{hash[key]}"
  puts "Enter new #{str.upcase} or press enter to CANCEL."
  print "\n> "
  res = gets.chomp
  puts "\n"

  if res.length == 0
    puts "#{str.upcase} Unchanged."
    puts "Press enter to continue."
    gets
  else
    hash[key] = res
    hash.save
    puts "#{str.upcase} updated to #{hash[key]}."
    puts "Press enter to continue."
    gets
  end
end
