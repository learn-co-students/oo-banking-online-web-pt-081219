class BankAccount
 
# attr_accessor :name, :balance, :status
 attr_reader :name
   attr_accessor :balance, :status
  # @@all=[]
 
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
    def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your Balance is $#{balance}."
      "Your balance is $1000."
  end
  
  # def display_balance(balance)
  #   self.display_balance = balance
  # end

  def close_account
    self.status = "closed"
  end

  def valid?
    balance > 0 && status == "open"
  end
 
 
end
