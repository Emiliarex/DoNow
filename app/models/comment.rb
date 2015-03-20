class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :step
  
  default_scope { order('updated_at DESC') }
end
