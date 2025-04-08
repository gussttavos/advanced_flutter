import 'package:flutter_test/flutter_test.dart';

import 'package:advanced_flutter/domain/entities/next_event_entity.dart';
import 'package:advanced_flutter/domain/usecases/next_event_loader_usecase.dart';
import 'package:advanced_flutter/domain/repository/load_next_event_repository.dart';

import '../../helpers/fakes.dart';

class LoadNextEventSpyRepositoryImpl implements LoadNextEventRepository {
  String? groupId;
  NextEventEntity? output;
  Error? error;

  @override
  Future<NextEventEntity> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
    if (error != null) throw error!;
    return output!;
  }
}

void main() {
  late String id;
  late LoadNextEventSpyRepositoryImpl repository;
  late NextEventLoaderUsecase sut;

  setUp(() {
    id = anyString();
    repository = LoadNextEventSpyRepositoryImpl();
    repository.output = NextEventEntity(
      groupName: 'any_group_name',
      date: DateTime.now(),
      players: [],
    );
    sut = NextEventLoaderUsecase(repository);
  });

  test('should load event data from repository', () async {
    await sut(groupId: id);

    expect(repository.groupId, id);
  });

  test('should return event data on success', () async {
    final event = await sut(groupId: id);

    expect(event.groupName, repository.output?.groupName);
    expect(event.date, repository.output?.date);
  });
  test('should rethrow on error', () async {
    final error = Error();
    repository.error = error;

    final future = sut(groupId: id);

    expect(future, throwsA(error));
  });
}
