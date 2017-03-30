class Book

  @@on_shelf = []
  @@on_loan  = []

  def self.create (title, author, isbn )
    book = Book.new(title, author, isbn )
    @@on_shelf.push(book)
    return book
  end


  def self.current_due_date

  end

  def self.overdue_books
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  attr_accessor :due_date
  attr_accessor :title

  def initialize( title, author, isbn )
    @title  = title
    @author = author
    @isbn   = isbn
    @checkout = 0
    @due_date = 0
  end

  def borrow

  end

  def lent_out?
    if @@on_loan.include?(@title) == true
      puts "Sorry we dont have #{@title}"
    else
      puts "We do have #{@title}"
    end
  end
end

lotr= Book.create("LoTr", "tolkein", "1234")
puts lotr
