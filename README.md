# libndi_bindings

Minimal project to get libndi bindings to work on ios.  
Created using the plugin_ffi template.

## Setup

To download the static library file used by this project, you'll need to go [here](https://ndi.tv/sdk/#download), fill out the form for "Advanced Developer Kit", and go to the download link next to "Apple Advanced NDI SDK" in the email you receive. After you run the installer, the file should be at "/Library/NDI Advanced SDK for Apple/lib/iOS/libndi_advanced_ios.a" unless you chose a different installation folder than /Library. Then, you can cd into ios/static and run  
```
ln -s "/Library/NDI Advanced SDK for Apple/lib/iOS/libndi_advanced_ios.a"
```
After that, you can cd into the example and run it. 
