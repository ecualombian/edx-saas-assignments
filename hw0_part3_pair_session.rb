puts "HW 0 Part 3"

#Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book as a floating-point number, price, as attributes. 
#The constructor should accept the ISBN number (a string) as the first argument and 
#price as second argument, and should raise ArgumentError (one of Ruby's built-in exception types) if the ISBN number is the empty string or 
#if the price is less than or equal to zero.

#Include the proper getters and setters for these attributes. 
#Include a method price_as_string that returns the price of the book with a leading dollar sign and trailing zeros, 
#that is, a price of 20 should display as "$20.00" and a price of 33.8 should display as "$33.80".

class BookInStock
  attr_reader :isbn, :price
  def initialize(isbn,price)
      self.isbn=isbn
      self.price=price
  end
  
  def isbn=(isbn)
      check_isbn(isbn)
      @isbn = isbn
  end
  
  def check_isbn(isbn)
      raise ArgumentError, "Error: ISBN cannot be anything other than string" if !isbn.kind_of?(String)
      raise ArgumentError, "Error: ISBN cannot be empty" if isbn.empty?
  end
  
  def price=(price)
      check_price(price)
      @price = price
  end
  
  def check_price(price)
      raise ArgumentError, "Error: Price must be of type Floating" if !price.kind_of?(Numeric)
      raise ArgumentError, "Error: Price must be greater than zero" if price <=0
      
  end
  
  def price_as_string()
      roundPrice= price.round(2)
      return "%s%.2f" % ["$", price.round(2)]
  end
  
end




#newbook = BookInStock.new("", 56)
#newbook = BookInStock.new("434", -34)
newbook = BookInStock.new("234", 0.5)
newbook = BookInStock.new("234", 2.3)
newbook = BookInStock.new("234", 0.23)
raise "Error: ISBN should be 234" unless newbook.isbn == "234"
raise "Error: Price should be 0.23" unless newbook.price == 0.23
#newbook.isbn = 437
#raise "Error: ISBN should be 437" unless newbook.isbn == "437"
newbook.isbn = "437"
raise "Error: ISBN should be 437" unless newbook.isbn == "437"
newbook.price = 56
raise "Error: Valid prices entered as XX should return as XX.00" if newbook.price_as_string != "$56.00"
newbook.price = 0.2
raise "Error: Valid prices entered as XX.Y should return as XX.Y0" if newbook.price_as_string != "$0.20"
newbook.price = 3.2
puts newbook.price_as_string
raise "Error: Valid prices entered as X.Y should return as X.Y0" if newbook.price_as_string != "$3.20"
newbook.price = 0.05
puts newbook.price_as_string
raise "Error: Valid prices entered as .XX should return as 0.XX" if newbook.price_as_string != "$0.05"
newbook.price = 5.454
raise "Error: Valid prices entered as XX.YYY should return as XX.YY round down" if newbook.price_as_string != "$5.45"
newbook.price = 5.456
raise "Error: Valid prices entered as XX.YYY should return as XX.YY round up" if newbook.price_as_string != "$5.46"

#raise "Error: ISBN number should not be an empty string" if newbook.isbn