class Todo < ActiveRecord::Base
   belongs_to :category
   belongs_to :user
   has_many :steps
  accepts_nested_attributes_for :steps
  has_one :priority, dependent: :destroy
  accepts_nested_attributes_for :priority
   
  after_save :change_color
  
  def change_color
    if self.priority.present?
      if self.priority.urgency == 1
        self.priority.update_attribute(:color, "FA0505")
      elsif self.priority.urgency == 2
        self.priority.update_attribute(:color, "FF6F0F")
      elsif self.priority.urgency == 3
        self.priority.update_attribute(:color, "FAFA07")
      elsif self.priority.urgency == 4
        self.priority.update_attribute(:color, "8CD603")
      elsif self.priority.urgency == 5
        self.priority.update_attribute(:color, "0EC704")
      end
    else
      p = Priority.create(urgency: 5, todo_id: self.id)
      p.todo.change_color
    end
  end
  
end
