import 'dart:io';

extension FileExtention on FileSystemEntity {
  get getName {
    return this.path.split(Platform.pathSeparator).last;
  }

  get getExtension {
    return this.path.split(".").last.trim();
  }
}
