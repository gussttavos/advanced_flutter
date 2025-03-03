import 'package:advanced_flutter/domain/entities/next_event_player_entity.dart';

class NextEventEntity {
  final String groupName;
  final DateTime date;
  final List<NextEventPlayerEntity> players;

  NextEventEntity({
    required this.groupName,
    required this.date,
    required this.players,
  });
}
