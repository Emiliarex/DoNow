class Step < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo
  has_many :comments, dependent: :destroy
end
