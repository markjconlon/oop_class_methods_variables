class BankAccount

 @@interest_rate = 0.01
 @@accounts = []

  def self.create
   account = BankAccount.new()
   @@accounts.push(account)
   return account
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum += account.balance
    end
    return sum
  end

  def self.interest_time
    @@accounts.each do |account|
      account[0] = account[0] * (1 + @@interest_rate)
    end
  end

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit (amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end
