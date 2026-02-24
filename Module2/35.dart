import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  stdout.write("Enter file path: ");
  String filePath = stdin.readLineSync()!;

  // Extract directory
  String directory = p.dirname(filePath);

  // Extract filename with extension
  String fileNameWithExt = p.basename(filePath);

  // Extract filename without extension
  String fileName = p.basenameWithoutExtension(filePath);

  // Extract extension
  String extension = p.extension(filePath);

  print("\n--- Path---");
  print("Full Path: $filePath");
  print("Directory: $directory");
  print("File Name (with ext): $fileNameWithExt");
  print("File Name (without ext): $fileName");
  print("Extension: $extension");
}