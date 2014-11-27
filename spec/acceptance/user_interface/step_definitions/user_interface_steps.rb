Given(/^I have loaded the simulator$/) do
  `ruby the-app.rb`
end


And(/^the UI has displayed the following message: 'Enter EXIT to exit at anytime'$/) do
  
end


When(/^I enter EXIT into the command line$/) do
  # Enter EXIT into $stdin
end


Then(/^the program should exit$/) do
  # Check the exit status of the application is 0 - might need aruba for this...
end
