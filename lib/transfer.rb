class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    if valid? && @status == "pending" && sender.balance >= amount 
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
  else 
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
   end 
  end
  
  def reverse_transfer
    if valid? && @status == "complete" && sender.balance >= amount 
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
  else 
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
   end 
  end

end
