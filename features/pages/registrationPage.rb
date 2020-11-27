
class RegistrationPage
  attr_accessor :name_txt,:username_txt,:password_txt,:confirmPassword_txt,:emailAddress_txt,:confirmEmailAddress_txt,:register_btn

  def initialize
    @name_txt = $Browser.find_element(:id,"jform_name");
    @username_txt = $Browser.find_element(:id,"jform_username")
    @password_txt = $Browser.find_element(:id,"jform_password1")
    @confirmPassword_txt = $Browser.find_element(:id,"jform_password2")
    @emailAddress_txt = $Browser.find_element(:id,"jform_email1")
    @confirmEmailAddress_txt = $Browser.find_element(:id,"jform_email2")
    @register_btn = $Browser.find_element(:xpath,"//button[text()='Register']")
  end

  def enterName_txt(text)
    @name_txt.send_keys text
  end

  def enterUsername_txt(username)
    @username_txt.send_keys username
  end

  def enterPassword_txt(pass)
    @password_txt.send_keys pass
    @confirmPassword_txt.send_keys pass
  end

  def enterEmailAddress_txt(email)
    @emailAddress_txt.send_keys email
    @confirmEmailAddress_txt.send_keys email
  end

  def clickRegister_btn
    @register_btn.click
  end
end