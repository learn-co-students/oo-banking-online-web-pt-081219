class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status='pending', amount)
    @sender = sender 
    @receiver = receiver
    @status = status 
    @amount = amount
  end 
  
  def valid?
    sender.valid?
    receiver.valid?
  end 
  
   def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 

    if @status == "pending"
    
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status =='complete'
      receiver.balance -=amount
      sender.balance +=amount
      self.status = 'reversed'
    end
  end 
  
  
end
