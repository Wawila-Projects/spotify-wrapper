import 'dart:mirrors';

///Util class to get Enum from String and int.
///
///Base on this [Stack Overflow post](https://stackoverflow.com/questions/27673781/enum-from-string)
class EnumUtils {

  /// Get enum of type [T] from [value]. Return [T.Error] if [value] does not exist; 
  static T enumFromString<T>(String value) {
    final values = ((reflectType(T) as ClassMirror).getField(#values).reflectee as List);
    try {
      final result = values.firstWhere((e)=>e.toString().split('.')[1].toUpperCase() == value.toUpperCase());
      return result;
    } catch (Exception) {
      final result = values.firstWhere((e)=>e.toString().split('.')[1].toUpperCase() == 'ERROR');
      return result;
    }
  }

  /// Get enum of type [T] from [value]. Return [T.Error] if [value] is out of bounds.
  static T enumFromInt<T>(int value) {
    final values = ((reflectType(T) as ClassMirror).getField(#values).reflectee as List);
    try {
      return values[value];
    } catch(Exception) {
      return values.first;
    }
  }
}