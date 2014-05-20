#Define a method hello(name) that takes a string representing a name and 
#returns the string "Hello, " concatenated with the name.

def hello(name)
    return 'Hello, ' + name
end

raise "Input John doesn't work" unless hello('John') == 'Hello, John'
raise "Input 5 doesn't work" unless hello('5') == 'Hello, 5'
raise "Input empty doesn't work" unless hello('') == 'Hello, '
raise "Input space doesn't work" unless hello(' ') == 'Hello,  '



#Define a method starts_with_consonant?(s) that takes a string and 
#returns true if it starts with a consonant and false otherwise. 
#(For our purposes, a consonant is any letter other than A, E, I, O, U.) #
#NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant?(s)
    regex = /^[AEIOU]/i
    regex2 = /^[BCDFGHJKLMNPQRSTVWXYZ]/i
    (s =~ regex2) != nil
    # regex2 = /^[BCDFGHJKLMNPQRSTVWXYZ]/i
    # if regex2.match(s) == nil
    # 	false
    # else true
    # end
end

puts "Error: Cat starts with a consonant and should pass" if  starts_with_consonant?("Cat") != true
puts "Error: cat starts with a consonant and should pass" if starts_with_consonant?("cat") != true
puts "Error: Empty string passes" if starts_with_consonant?("") != false
puts "Error: vowel string shouldn't pass" if starts_with_consonant?("at") != false
puts "Error: Vowel string shouldn't pass" if starts_with_consonant?("At") != false
puts "Error: symbol string shouldn't pass" if starts_with_consonant?("$Cat") != false
puts "Error: starts with an empty space string shouldn't pass" if starts_with_consonant?(" Cat") != false
puts "Error: starts with a number string shouldn't pass " if  starts_with_consonant?("5Cat") != false

#Define a method binary_multiple_of_4?(s) that takes a string and 
#returns true if the string represents a binary number that is a multiple of 4. 
#NOTE: be sure it returns false if the string is not a valid binary number!

def binary_multiple_of_4?(s)
	regex3 = /(00)$/
	regex4 = /[2-9A-Za-z_]/
	# if regex3.match(s) == nil && s != "0" || regex4.match(s) != nil
	# 	false
	# else true
	if regex4.match(s) != nil
		false
	elsif regex3.match(s) == nil && s != "0"
		false
	else true

	end
	# (s =~ regex3) != nil
end

puts "Error: Not Valid Number - Empty"  if binary_multiple_of_4?("") != false
puts "Error: Valid Multiple - single 0 test"  if binary_multiple_of_4?("0") == false
puts "Error: Not Valid Number - decimal"  if binary_multiple_of_4?("123") == true
puts "Error: not valid input - letters start input"  if binary_multiple_of_4?("z00") == true
puts "Error: not valid input - non-binary input"  if binary_multiple_of_4?("001z00") == true
puts "Error: Valid Multiple"  if binary_multiple_of_4?("00000") == false
puts "Error: Not Valid Number"  if binary_multiple_of_4?("010101") == true
puts "Error: Valid Multiple"  if binary_multiple_of_4?("100") == false
puts "Error: Not Valid Multiple"  if binary_multiple_of_4?("010") == true
puts "Error: Not Valid Multiple"  if binary_multiple_of_4?("011") == true


