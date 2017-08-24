class Room < ActiveRecord::Base
   validates :name, presence: true
   validates :players, :numericality => {:only_integer => true}
end
