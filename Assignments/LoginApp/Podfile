# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'LoginApp' do
  # Uncomment this line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for LoginApp
  pod 'FBSDKLoginKit', '~> 4.14'
  pod 'FBSDKShareKit', '~> 4.14'
  pod 'FBSDKCoreKit', '~> 4.14'
  
#  source 'https://github.com/CocoaPods/Specs.git'
#      pod 'GoogleMaps'
#      pod 'GooglePlaces'
#      
#      pod 'SDWebImage', '~>3.8'
#      
#      pod 'GoogleMaps'

  
  #source 'https://github.com/CocoaPods/Specs.git'
  #pod 'GoogleMaps'
  #pod 'GooglePlaces'
  

  target 'LoginAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LoginAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['CLANG_ENABLE_OBJC_WEAK'] ||= 'YES'
          end
      end
  end
  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['CLANG_ENABLE_OBJC_WEAK'] ||= 'YES'
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.3'
          end
      end
  end
  

end
