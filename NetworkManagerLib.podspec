
Pod::Spec.new do |spec|

  spec.name         = "Network Manager"
  spec.version      = "1.0"
  spec.summary      = "Network Manager"

  spec.description  = <<-DESC
                      Network Manager Library
                      DESC

  spec.homepage     = "https://github.com/ez-ramzan/Network-Manager"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Raman Liulkovich" => "raman.liulkovich@gmail.com" }
  spec.source       = { :git => "https://github.com/ez-ramzan/Network-Manager.git", :tag => "#{spec.version}" }
 
  spec.source_files  = ["Sources/**/*.swift", "Sources/NetworkManager.h"]
  
end
