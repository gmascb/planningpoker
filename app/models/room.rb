class Room < ActiveRecord::Base
   validates :name, presence: true
   validates :players, :numericality => {:only_integer => true}
   validates :playersname, :allow_blank => true, :allow_nil => true,  format: { with: /\A[a-zA-Z ,âÂêÊîÎôÔûÛïÏõÕôÔãÃÜüçÇàèìòùÀÈÌÒÙáéíóúÁÉÍÓÚ]+\z/, message: ": Apenas letras." }
   
   attr_accessor :selectresponsavel
   attr_accessor :selectuser
   
end