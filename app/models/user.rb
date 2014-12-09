class User < ActiveRecord::Base
<<<<<<< HEAD
    belongs_to :house
    has_many :tasks

    accepts_nested_attributes_for :tasks

  validates :avatar, :attachment_presence => true, :on => [ :update ]
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :on => [ :update ]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :on => [ :update ]
  validates_with AttachmentPresenceValidator, :attributes => :avatar, :on => [ :update ]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes, :on => [ :update ]
=======
  belongs_to :house
  has_many :tasks, through: :userstasks, class_name: Task
  has_many :userstasks, class_name: Userstasks

  accepts_nested_attributes_for :tasks

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
  #validates_presence_of :tasks
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
end
