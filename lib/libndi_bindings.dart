
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

import 'libndi_bindings_generated.dart';

/// The dynamic library in which the symbols for [LibndiBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isIOS) {
    return DynamicLibrary.process();
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final LibndiBindings _bindings = LibndiBindings(_dylib);

class Libndi {

  static String getVersion() => _bindings.NDIlib_version().cast<Utf8>().toDartString();

}
