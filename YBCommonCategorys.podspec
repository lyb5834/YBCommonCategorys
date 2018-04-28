Pod::Spec.new do |s|
  s.name         = "YBCommonCategorys"
  s.version      = "0.0.1"
  s.summary      = "快速集成常用的categorys（主要是自己使用方便）"
  s.description  = "Code created and updated by Lyb.2018年04月28日"
  s.homepage     = "https://github.com/lyb5834/YBCommonCategorys.git"
  s.license      = "MIT"
  s.author       = { "lyb" => "lyb5834@126.com" }
  s.source       = { :git => "https://github.com/lyb5834/YBCommonCategorys.git", :tag => s.version.to_s }
  s.source_files  = "source/*.{h,m}"
  s.requires_arc = true
  s.platform     = :ios, '7.0'
end
