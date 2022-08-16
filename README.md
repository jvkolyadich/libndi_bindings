# libndi_bindings

Minimal project to get libndi bindings to work on ios.  
Created using the plugin_ffi template.

## Setup

To get the static library file used by this project, you'll need to download the SDK it's in [here](https://downloads.ndi.tv/SDK/NDI_SDK_Mac/Install_NDI_SDK_v5_Apple.pkg). 

After you run the installer, the file should be at   
`/Library/NDI SDK for Apple/lib/iOS/libndi_ios.a`  
unless you chose a different installation folder than /Library.  

Then, you can
```
cd ios/Frameworks
ln -s /Library/NDI\ SDK\ for\ Apple/lib/iOS/libndi_ios.a
cd ../../example
flutter run
```
