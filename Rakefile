require "asrake"
require 'zip/zip'
require 'fileutils'

args = ASRake::Mxmlc.new "bin/Demo_Mobile.swf"
args.file_specs = 'src/Demo_Mobile.as'
args.target_player = 11.9
args.debug = true
args.source_path << "src"
args.library_path << "libs"
#args.external_library_path << "air/nativelibs/NativeGATracker-v2.0.4.ane"
#args.external_library_path << "air/nativelibs/NativeExtension.ane"
args.isAIR = true

current = Dir.pwd
unzipDir = "#{current}/unzippedane"

# the build may fail if the java heap is not large enough
# use export _JAVA_OPTIONS=-Xmx1024m to set the heap at 1gb if necessary

task :build => [args,:unzipANE] do 
	cp_u "src/Demo_Mobile-app.xml", "bin/" # copy the startup file
	Dir.glob("assets/*") do |folder| # copy the assets to the bin folder so that the debugger can pick them up
		cp_r folder, "bin/"
	end
end

task :unzipANE do
	puts "unzipping ANE files"

	#create unzip directory	
	puts unzipDir
	if Dir.exists?(unzipDir)
		FileUtils.rm_r(unzipDir)
	end
	Dir.mkdir(unzipDir)

	Dir.glob(current + '/src/nativelibs/*.ane') do |file|
		unzip_file file,unzipDir + "/" + File.basename(file)
	end
end

task :run => :build do 
	flex = ENV["FLEX_HOME"]
	sh "#{flex}/bin/adl -extdir #{unzipDir} -profile extendedMobileDevice -screensize iPhone -XversionPlatform IOS #{current}/bin/Demo_Mobile-app.xml"
end

def unzip_file (file, destination)
  Zip::ZipFile.open(file) { |zip_file|
   zip_file.each { |f|
     f_path=File.join(destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  }
end