import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty }

// Extend formzInput and provide the input type and error type
class UsernameInput extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameInputError validator(String value) {
    return value?.isNotEmpty == true ? null : UsernameInputError.empty;
  }
}
