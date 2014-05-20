# Define a class BookInStock which represents a book with an isbn number, isbn, and price 
# of the book as a floating-point number, price, as attributes. The constructor should 
# accept the ISBN number (a string) as the first argument and price as second argument, and 
# should raise ArgumentError (one of Ruby's built-in exception types) if the ISBN number is the 
# empty string or if the price is less than or equal to zero.

# Include the proper getters and setters for these attributes. Include a method price_as_string 
# that returns the price of the book with a leading dollar sign and trailing zeros, that is, a 
# price of 20 should display as "$20.00" and a price of 33.8 should display as "$33.80".
require 'pry'
class BookInStock
	attr_accessor :isbn, :price # accessor reads/writes 
	attr_reader :isbn, :price # just reads 

	def initialize(isbn, price)
		raise ArgumentError, "Error: ISBN cannot be empty" if isbn == ""
		raise ArgumentError, "Error: price can't be 0 or less" if price <= 0
		@isbn = isbn
		@price = price
	end

	def isbn
		@isbn
	end

	def price
		@price
	end

	def price=(new_amount)
		@price = new_amount
	end

	def price_as_string
		regexp = /\.[0-9]+/ 
		# to_s used for @price as no implicit conversion errors appeared in terminal
		if regexp.match(@price.to_s) # will return nil if no decimal point present
			match = regexp.match(@price.to_s).to_s
			 # binding.pry
				if match.length == 1
				return "$" + @price.to_s + "00" # for price ending in only decimal
			elsif match.length == 2
				return "$" + @price.to_s + "0" # for price ending in .0
			else match.length > 2 
				return "$#{@price.round(2)}" # for prices entered with at least hundredths place precision
			end
		else return "$" + @price.to_s + ".00"
		end
	end
end

# newbook = BookInStock.new("", 56)
# newbook = BookInStock.new(4434343, -56)
newbook = BookInStock.new(45555, 56)
raise "Error: prices entered as XX should end in XX.00" if newbook.price_as_string != "$56.00"
# binding.pry
newbook2 = BookInStock.new(45555, 34.5)
raise "Error: prices ending in XX.Y should print XX.Y0" if newbook2.price_as_string != "$34.50"
# binding.pry
newbook3 = BookInStock.new(45555, 46.044444)
raise "Error: prices ending in XX.YYABC where A less than 5 should print XX.YY #{newbook3.price_as_string}" if newbook3.price_as_string != "$46.04"
# binding.pry
newbook4 = BookInStock.new(45555, 46.045555)
raise "Error: prices ending in XX.YYABC where A equals 5 or more should print XX.YY #{newbook4.price_as_string}" if newbook4.price_as_string != "$46.05"
# binding.pry

