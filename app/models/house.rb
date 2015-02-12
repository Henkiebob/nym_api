class House < ActiveRecord::Base
  has_many :users
  has_one  :apikey
  has_many :tasks
  has_many :notifications

  accepts_nested_attributes_for :users
  #validates_presence_of :users

  accepts_nested_attributes_for :apikey

  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :on => [ :update ]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :on => [ :update ]
  #validates_with AttachmentPresenceValidator, :attributes => :avatar, :on => [ :update ]
  #validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes, :on => [ :update ]
end
