import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmDate;

  NextEventPlayer._({
    required this.id,
    required this.name,
    required this.isConfirmed,
    required this.initials,
    this.photo,
    this.position,
    this.confirmDate,
  });

  factory NextEventPlayer({
    required String id,
    required String name,
    required bool isConfirmed,
    String? photo,
    String? position,
    DateTime? confirmDate,
  }) =>
      NextEventPlayer._(
        id: id,
        name: name,
        isConfirmed: isConfirmed,
        photo: photo,
        position: position,
        confirmDate: confirmDate,
        initials: _getInitials(name),
      );

  static String _getInitials(String name) {
    if (name.isEmpty) return '-';

    final names = name.toUpperCase().split(' ');
    if (names.length == 1) {
      if (names.first.length > 1) {
        return names.first.substring(0, 2);
      } else {
        return names.first;
      }
    }

    if (names.length > 1) {
      final firstName = names.first.substring(0, 1);
      final lastName = names.last.substring(0, 1);

      return (firstName + lastName);
    }

    return '-';
  }
}

void main() {
  String initialsOf(String name) => NextEventPlayer(
        name: name,
        id: '',
        isConfirmed: true,
      ).initials;

  test(
    'should return the first letters of the names',
    () => expect(initialsOf('Gustavo Simões'), 'GS'),
  );

  test(
    'should return the first letters of the first name'
    'when there is no second name',
    () => expect(initialsOf('G'), 'G'),
  );

  test(
    'should return "-" when the name is empty',
    () => expect(initialsOf(''), '-'),
  );

  test(
    'should convert to uppercase',
    () => expect(initialsOf('name'), 'NA'),
  );
}
