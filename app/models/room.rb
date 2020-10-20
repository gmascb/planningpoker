class Room < ActiveRecord::Base
   validates :name, presence: true
   validates :card, presence: true
   validates :players, :numericality => {:only_integer => true}
   validates :playersname, :allow_blank => true, :allow_nil => true,  format: { with: /\A[a-zA-Z ,âÂêÊîÎôÔûÛïÏõÕôÔãÃÜüçÇàèìòùÀÈÌÒÙáéíóúÁÉÍÓÚ]+\z/, message: ": Apenas letras." }
   
   attr_accessor :selectresponsavel
   attr_accessor :selectuser
   
   scope :filtered, -> (user_name) { 
      where("ROOMS.USER LIKE '%#{user_name}%'
         OR ROOMS.USER LIKE ''
         OR ROOMS.USER IS NULL
         OR ROOMS.PLAYERSNAME LIKE '%#{user_name}%'
         OR ROOMS.PLAYERSNAME LIKE ''
         OR ROOMS.PLAYERSNAME IS NULL ").order(:name)
   }

end