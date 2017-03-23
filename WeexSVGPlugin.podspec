# coding: utf-8

Pod::Spec.new do |s|
  s.name         = "WeexSVGPlugin"
  s.version      = "0.0.1"
  s.summary      = "Weex SVG plugin"

  s.description  = <<-DESC
                   Weex SVG plugin
                   DESC

  s.homepage     = "https://github.com/weexteam/weex-pack.git"
  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
           Alibaba-INC copyright
    LICENSE
  }
  s.authors      = {
                     "yangshengtao" =>"yangshengtao1314@163.com"
                   }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"

  s.source =  { :path => '.' }
  s.source_files  = "WeexSVGPlugin/**/*.{h,m,mm}"
  # s.exclude_files = "Classes/Exclude"
  s.resources = "WeexSVGPlugin/Resources/*"
  

  s.requires_arc = true

  #s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(SDKROOT)/TRemoteDebugger" }
  s.dependency "WeexSDK"
  #${weexpackPlaceHolder}

  s.vendored_frameworks = 'WeexSVGPlugin.framework'

  # s.user_target_xcconfig  = { 'FRAMEWORK_SEARCH_PATHS' => "'$(PODS_ROOT)/WeexSVGPlugin'" }

end
