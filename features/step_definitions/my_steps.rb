
#================================================================================
#Diwakar, 6-12-2016
#Below step def to read parameters data for each testcase from testdata sheet
#================================================================================
Then(/^I should get the testdata for "([^"]*)"$/) do |testcasename|
  get_testdata(testcasename)
end

def get_testdata(testcasename)

  begin
    require 'roo'
    workbook = Roo::Spreadsheet.open($testdatafile)
    workbook.default_sheet=$testdatasheet
    testNameColNumber = false
    foundtestcasecol = false
    foundtestdata = nil
    testdatarow = nil
    testdata = nil

    # gets the col number of unique col

    (1..workbook.last_column).each { |k|
      colValue = workbook.cell(1, k)
      if (colValue == "Testcase Name") then
        testNameColNumber = k
        foundtestcasecol = true
        break
      end
    }

    if (foundtestcasecol)
        (2..workbook.last_row).each { |k|
          current_test = workbook.cell(k, testNameColNumber)
          if (current_test == testcasename)
            testdatarow = k
            break
          end
        }
    else
      raise('In the test data sheet "Testcase Name" column is not available please make sure it is availble')
    end

    unless (testdatarow.nil?)
      (2..workbook.last_column).each do |col|
        colName = workbook.cell(1,col)
        colVal = workbook.cell(testdatarow,col)
        $Testdata[colName] = colVal;
      end
    else
      raise('The Test case " ' +testcasename+ '" is not found in the test data sheet, please make sure the test data is available')
    end
  end
  puts $Testdata
  return $Testdata;
end


Then(/^I verify testdata$/) do
  log($Testdata)
end

Then(/^I Naviagate to "([^"]*)"$/) do |arg|
  $Browser.navigate.to arg
end

Given(/^I am in the home page I click on new registration$/) do
  # Home Page

  @HomePage = HomePage.new
  @HomePage.clickRegistration_lnk

  #Registration Page

  @RegistrationPage = RegistrationPage.new
  @RegistrationPage.enterName_txt($Testdata["Name"])
  @RegistrationPage.enterUsername_txt($Testdata["Username"])
  @RegistrationPage.enterPassword_txt($Testdata["Password"])
  @RegistrationPage.enterEmailAddress_txt($Testdata["Email"])
  @RegistrationPage.clickRegister_btn

  #Verification
  @Page = SharedMethods.new
  @Page.verifyTextInPage("Your Account")
end