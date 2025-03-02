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
    final names = name.split(' ');
    if (names.length == 1) {
      return names.first.substring(0, 2).toUpperCase();
    }
    if (names.length > 1) {
      final firstName = names.first.substring(0, 1);
      final lastName = names.last.substring(0, 1);

      return (firstName + lastName).toUpperCase();
    }

    return '-';
  }
}

void main() {
  test('should return the first letter of the names', () {
    // arrange
    final player = NestEventPlayer(
      name: 'Gustavo Simões',
      id: '',
      isConfirmed: true,
    );

    // act
    final initials = player.initials;

    // assert
    expect(initials, 'GS');

    // arrange
    final player2 = NestEventPlayer(
      name: 'Gustavo',
      id: '',
      isConfirmed: true,
    );

    // act
    final initials2 = player2.initials;

    // assert
    expect(initials2, 'GU');
  });
}
