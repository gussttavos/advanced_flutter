import 'package:flutter_test/flutter_test.dart';

class NestEventPlayer {
  final String id;
  final String name;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmDate;

  NestEventPlayer({
    required this.id,
    required this.name,
    required this.isConfirmed,
    this.photo,
    this.position,
    this.confirmDate,
  });

  String get initials {
    if (name.isEmpty) return '-';

    final names = name.split(' ');
    if (names.length == 1) return names.first.substring(0, 2).toUpperCase();

    if (names.length > 1) {
      final firstName = names.first.substring(0, 1);
      final lastName = names.last.substring(0, 1);

      return (firstName + lastName).toUpperCase();
    }

    return '-';
  }
}

void main() {
  String initialsOf(String name) => NestEventPlayer(
        name: name,
        id: '',
        isConfirmed: true,
      ).initials;

  test('should return the first letter of the names', () {
    expect(
      initialsOf('Gustavo Simões'),
      'GS',
    );
    expect(
      initialsOf('Gustavo'),
      'GU',
    );
    expect(
      initialsOf('Gustavo Teixeira Simões'),
      'GS',
    );
    expect(
      initialsOf(''),
      '-',
    );
  });
}
