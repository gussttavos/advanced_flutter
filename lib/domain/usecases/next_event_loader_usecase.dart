import 'package:advanced_flutter/domain/entities/next_event_entity.dart';
import 'package:advanced_flutter/domain/repository/load_next_event_repository.dart';

class NextEventLoaderUsecase {
  final LoadNextEventRepository repository;

  NextEventLoaderUsecase(this.repository);

  Future<NextEventEntity> call({required String groupId}) async {
    return await repository.loadNextEvent(groupId: groupId);
  }
}
