class HomePage
  attr_accessor :registration_lnk

  def initialize
    @registration_lnk = $Browser.find_element(:xpath,"//a[text()='Registration ']");
  end

  def clickRegistration_lnk
    @registration_lnk.click
  end
end