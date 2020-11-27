class SharedMethods

  def verifyTextInPage(text)

    begin
      $Browser.find_element(:xpath,"//*[contains(text(),'"+text+"')]")
      puts "Scenario Passed"
    rescue => error
      raise ("Scenario Failed : ")+error.message
    end

  end

end
