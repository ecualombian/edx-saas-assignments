# Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.

def sum (array, counter=0)
	 raise ArgumentError, "Not an Array" if !array.kind_of?(Array)
	 # local ||= 0
	 # puts counter
	 if array.empty? || array.nil?
	 	# puts counter
	 return counter
	 else 
	 	counter += array.shift
	 	if array.empty?
	 	return counter
	 	else sum(array, counter)
	 	end
	 end
end

# sum("")
raise "Error empty array" if sum([]) != 0
# raise "Error empty array" if sum([]) != 0 #Not sure why this doesn't pass
raise "Error single element array" if sum([3]) != 3
raise "Error: array of 1, 2, 3, should return sum of 6" if sum([1,2,3]) != 6

# Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it 
# should return zero. For an array with just one element, it should return that element.

def max_2_sum(array, largest=0, runner_up=0)
	 raise ArgumentError, "Not an Array" if !array.kind_of?(Array)
# puts "start"
	 if array.empty?
	 	return 0 end

	 if array.length == 1
	 	return array[0] end

	 if array[0] > array [1]
	 	largest = array.shift
	 	runner_up = array.shift
	 	# puts largest
	 	# puts runner_up
	 elsif array[0] == array[1]
	 	largest = array.shift
	 	runner_up = array.shift
	 else
	 	runner_up = array.shift
	 	largest = array.shift
	 	# puts "current largest :", largest
	 	# puts "current runner_up :",  runner_up
	 end
	 # puts largest
	 # puts runner_up

	 array.each do |item|
	 	# puts "each loop current item :", item
	 	if item >= largest
	 		runner_up = largest
	 		largest = item
	 		# puts "Option 1"
	 	elsif item < largest and item > runner_up
	 		runner_up = item
	 		# puts "Option 2"
	 	# elsif item = largest
	 	# 	runner_up = item
	 	# 	puts "runner_up #{runner_up} -3"
	 	else 
	 		# puts "Option 3"
	 	end
	 	
	 	# puts "current largest :", largest
	 	# puts "current runner_up :",  runner_up
	 	# puts "current item :", item
	 	end
	 # puts largest
	 # puts runner_up
	# puts "end"

	 sum = runner_up + largest
	 
end

raise "Error: empty element array" if max_2_sum([]) != 0
raise "Error: 1 element array" if max_2_sum([7]) != 7
raise "Error: largest in front and back" if max_2_sum([11, 9, 1, 7, 10, 11]) != 22
raise "Error: all the same" if max_2_sum([3, 3, 3]) != 6
raise "Error: largest at end" if max_2_sum([3, 43, 0, 47, 34, 53]) != 100
raise "Error: largest in middle" if max_2_sum([1, 193, 03]) != 196
raise "Error: negatives" if max_2_sum([-1, -193, -03]) != -4

# Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and returns true if any two distinct 
# elements in the array of integers sum to n. An empty array or single element array should both return false.

def sum_to_n?(array, n)
	raise ArgumentError, "Not an Array" if !array.kind_of?(Array)

	if array.empty? || array.length == 1
		return false
	else
		# return true 
		new_array = array.map {|item| n - item}
		puts "this is new array #{new_array}"

		intersection = array & new_array
		puts "this is the intersection of the two arrays: #{intersection}"
		if intersection.length == 0
			return false #  empty array meaning to intersection maps between x_sub_i array and n - x_sub_i array
		elsif intersection.length == 1 && array.select {|element| element == intersection[0]}.length > array.select {|element| element == intersection[0]}.uniq.length
			return true #one match or intersection.length == 1 meaning there was a n/2 element and next conditional checks if n/2 element has pair
		elsif intersection.length >1
			return true # an intersection more than one guarantees more than one unique element therefore guarantees a potential pair
		else
			 return false

		end
		# array.each do |item|
		# 	if n - item == item
		# 		return false unless array.find_all {|element| element == item}.length > 1
		# 	else 
		# 		return true if !new_array.find_all {|match| match == item}.empty?
		# 	end
		# end
		# 	puts "this is item: #{item}"
		# 	valid_pairs = array.select {|element| (item + element) == n}
		# 	puts "this is valid_pairs #{valid_pairs}"
		# end
	end
end

# sum_to_n?("hello", 4)
raise "Error: empty array" if sum_to_n?([], 4) != false
raise "Error: single element array" if sum_to_n?([3], 4) != false
raise "Error: should return" if sum_to_n?([3, 1, 2, 2], 6) != false
raise "Error: should return" if sum_to_n?([5, 1, 2, 2], 4) != true
raise "Error: should return" if sum_to_n?([1, 1, 1, 1], 3) != false
raise "Error: should return" if sum_to_n?([1,2,3,4,5], 5) != true

# (FAILED)
#     returns false for the single element array [5 points]
#     returns false for the empty array [5 points]


