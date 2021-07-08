require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender,receiver,amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end
 
 def valid? 
   if @sender.valid? && @receiver.valid? 
     true 
   else 
     false 
   end 
 end
 
 def execute_transaction
   if @status == "pending"
    # binding.pry
     if @sender.balance < @amount || self.valid? == false
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
      else
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
    end
   end 
 end
 
  def reverse_transfer
    if @status == "complete"
      @status = "pending"
      new_sender = @sender
      @sender = @receiver 
      @receiver = new_sender 
      self.execute_transaction
      @status = "reversed"
    end 
  end
end
