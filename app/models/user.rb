class User < ActiveRecord::Base
  require 'bcrypt'
  attr_accessible :email, :password, :password_confirmation, :role
  attr_accessor :password
  
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  #def role_symbols
    #["Admin", "Student"].map do |role|
      #role.underscore.to_sym
    #end
  #end  
def role_symbols
    roles_to_array.map {|r| r.to_sym}
  end
    def roles_to_array
    (role || "").split("|")
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end