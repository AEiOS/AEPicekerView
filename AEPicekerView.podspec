Pod::Spec.new do |s|
    s.name         = 'AEPicekerView'
    s.version      = '0.0.1'
    s.summary      = 'An easy way to use pickerView'
    s.homepage     = 'https://github.com/AEiOS/AEPicekerView'
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.authors      = {'' => ''}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/AEiOS/AEPicekerView.git', :tag => s.version}
    s.source_files = 'AEPicekerView/**/*.{h,m}'
    s.requires_arc = true
end
