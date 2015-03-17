class Todo < ActiveRecord::Base
   belongs_to :category
   belongs_to :user
   has_many :steps
  accepts_nested_attributes_for :steps
   has_one :priority
   
  after_save :change_color
  
  def change_color
    if self.urgency == 1
      self.update_attribute(:color, "FA0505")
    elsif self.urgency == 2
      self.update_attribute(:color, "FF6F0F")
    elsif self.urgency == 3
      self.update_attribute(:color, "FAFA07")
    elsif self.urgency == 4
      self.update_attribute(:color, "BDFA07")
    elsif self.urgency == 5
      self.update_attribute(:color, "0EC704")
    end
  end
  
end
