import 'package:advanced_flutter/domain/entities/next_events_player_entity.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  String initialsOf(String name) => NextEventPlayerEntity(
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
