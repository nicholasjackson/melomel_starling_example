Before do |scenario|
  #start the app
  @pid = Process.fork do
  	flex = ENV["FLEX_HOME"]
    launchon_mobile = "#{flex}/bin/adl -profile extendedMobileDevice -screensize iPhone -XversionPlatform IOS #{Dir.pwd}/bin/Demo_Mobile-app.xml"
    exec launchon_mobile  	
  end
  Melomel.connect()
end


After do |scenario|
  puts "AFTER TO SCENARIO KILL #{@pid}"
  Process.kill 9, @pid
end

at_exit do
    
end