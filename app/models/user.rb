class User < ActiveRecord::Base
    belongs_to :house
    has_many :tasks
    has_many :logs
    accepts_nested_attributes_for :tasks

  #validates :avatar, :attachment_presence => true, :on => [ :update ]
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :on => [ :update ]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :on => [ :update ]
  #validates_with AttachmentPresenceValidator, :attributes => :avatar, :on => [ :update ]
  #validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes, :on => [ :update ]
end
