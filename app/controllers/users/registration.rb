module User::Registration
  extend ActiveSupport::Concern

  def register(email,password, password_confirmation)
    if email.blank?
      errors[:email] << "is invalid"
      return false
    end

    if password.blank?
      errors[:password] << "is invalid"
      return false
    end
    
    if password_confirmation.blank?
      errors[:password_confirmation] << "is invalid"
      return false
    end

    self.email = email
    self.password = password
    self.password_confirmation = password_confirmation

    self.save
    
  end

end