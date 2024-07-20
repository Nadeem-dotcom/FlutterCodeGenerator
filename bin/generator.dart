import 'dart:io';
import 'GeneratedCode/stCode.dart';
import 'GeneratedCode/stfulCode.dart';
import 'GeneratedCode/getController.dart';

enum FileType { stateless, stateful, getxController }

void main() {
  try {
    final option = getOption();
    final fileName = getFileName();
    createFile(option: option, fileName: fileName);
  } catch (e) {
    print('Error: $e');
  }
}

FileType getOption() {
  final options = [
    'State-Less Widget File',
    'State-Full Widget File',
    'Get-X Controller File',
  ];

  print('Please select an option:');
  for (var i = 0; i < options.length; i++) {
    print('${i + 1}. ${options[i]}');
  }

  final input = stdin.readLineSync();
  final choice = int.tryParse(input ?? '');

  if (choice == null || choice < 1 || choice > options.length) {
    throw Exception(
        'Invalid option selected. Please choose a number between 1 and ${options.length}.');
  }

  return FileType.values[choice - 1];
}

String getFileName() {
  print('Please enter the file name (e.g., my_file.dart):');
  final input = stdin.readLineSync();
  return handleFileName(input);
}

String handleFileName(String? fileName) {
  if (fileName == null || fileName.trim().isEmpty) {
    throw Exception('File name cannot be empty.');
  }
  return fileName.trim().endsWith('.dart')
      ? fileName.trim()
      : '${fileName.trim()}.dart';
}

void createFile({required FileType option, required String fileName}) {
  try {
    final file = File(fileName);
    switch (option) {
      case FileType.stateless:
        file.writeAsStringSync(st);
        print('Stateless widget file created: $fileName');
        break;
      case FileType.stateful:
        file.writeAsStringSync(stFul);
        print('Stateful widget file created: $fileName');
        break;
      case FileType.getxController:
        file.writeAsStringSync(controller);
        print('GetX controller file created: $fileName');
        break;
    }
  } catch (e) {
    print('Failed to create file: $e');
  }
}
