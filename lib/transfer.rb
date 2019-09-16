class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end 
  
  def execute_transaction
    if valid? && @sender.balance > @amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else 
      reject_transaction
    end 
  end 
  
  def reverse_transfer
    if self.status == "complete" && valid? && @receiver.balance > @amount
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end 
  end 
  
  def reject_transaction
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 
  
end
