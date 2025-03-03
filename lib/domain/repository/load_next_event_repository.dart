import 'package:advanced_flutter/domain/entities/next_event_entity.dart';

abstract class LoadNextEventRepository {
  Future<NextEventEntity> loadNextEvent({required String groupId});
}
