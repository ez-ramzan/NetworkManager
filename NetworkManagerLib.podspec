
Pod::Spec.new do |spec|

  spec.name         = "NetworkManager"
  spec.version      = "1.0"
  spec.summary      = "Network Manager"

  spec.description  = <<-DESC
                      Network Manager Library
                      DESC

  spec.homepage     = "https://github.com/ez-ramzan/NetworkManager"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Raman Liulkovich" => "raman.liulkovich@gmail.com" }
  spec.source       = { :git => "https://github.com/ez-ramzan/NetworkManager.git", :tag => "#{spec.version}" }
 
  spec.source_files  = ["Sources/**/*.swift", "Sources/NetworkManager.h"]
  
end
