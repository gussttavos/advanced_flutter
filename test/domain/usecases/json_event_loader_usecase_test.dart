import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

class NextEventLoaderUsecase {
  final LoadNextEventRepository repository;

  NextEventLoaderUsecase(this.repository);

  Future<void> call({required String groupId}) async {
    repository.loadNextEvent(groupId: groupId);
  }
}

abstract class LoadNextEventRepository {
  Future<void> loadNextEvent({required String groupId});
}

class LoadNextEventMockRepositoryImpl implements LoadNextEventRepository {
  String? groupId;

  @override
  Future<void> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
  }
}

void main() {
  test('should load event data from repository', () async {
    final id = Random().nextInt(50000).toString();
    final repository = LoadNextEventMockRepositoryImpl ();
    final sut = NextEventLoaderUsecase(repository);

    await sut(groupId: id);

    expect(repository.groupId, id);
  });
}
