class User < ActiveRecord::Base
  include Humanizer
  require_human_on :create
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, :format => { :with => email_regex }
  validates :login, presence: true, uniqueness: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :birth, presence: true
  validates :password, length: { minimum: 6, maximum: 16 }, on: [:create] 
  has_secure_password
  has_attached_file :avatar, :styles => {:medium => "250x250", :thumb => "70x70" }, :default_url => "noimage.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  crop_attached_file :avatar	
end
