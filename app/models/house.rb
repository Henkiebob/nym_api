class House < ActiveRecord::Base
<<<<<<< HEAD
  has_many :users
  has_one  :apikey
=======

  has_many :users
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
  has_many :tasks

  accepts_nested_attributes_for :users
  validates_presence_of :users

<<<<<<< HEAD
  accepts_nested_attributes_for :apikey

=======
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name

<<<<<<< HEAD
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :on => [ :update ]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/, :on => [ :update ]
  validates_with AttachmentPresenceValidator, :attributes => :avatar, :on => [ :update ]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes, :on => [ :update ]
=======
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    # //UserMailer.password_reset(self).deliver
  end
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
end
