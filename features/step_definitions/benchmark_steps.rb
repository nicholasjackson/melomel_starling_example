Given /^I am on the MainMenu scene$/ do
  menuScene = Melomel.wait_until_visible("MainMenu", nil, nil)
  menuScene.should_not be_nil
end

Given /^I can see the "([^"]*)" button$/ do |arg1|
  button = Melomel.find!("starling.display.Button", nil, :text => arg1)
  button.should_not be_nil
end

When /^I touch the "([^"]*)" button$/ do |arg1|
  button = Melomel.find!("starling.display.Button", nil, :text => arg1)
  button.should_not be_nil
  Melomel.touch(button)
end

Then /^I expect to see the Benchmark scene$/ do
  benchScene = Melomel.wait_until_visible("scenes.BenchmarkScene", nil, nil)
  benchScene.should_not be_nil
end