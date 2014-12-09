class Task < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :house

=======
  has_many :users, through: :userstasks, class_name: User
  has_many :userstasks, class_name: Userstasks

  belongs_to :house
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
end
