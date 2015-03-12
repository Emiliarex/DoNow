class Todo < ActiveRecord::Base
   belongs_to :category
   belongs_to :user
   has_many :steps
  accepts_nested_attributes_for :steps
   has_one :priority
   
end
