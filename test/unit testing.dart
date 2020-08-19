import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing_flutter/unittesting/post_helper.dart';
import 'package:testing_flutter/unittesting/randomizer.dart';

class MockPostHelper extends Mock implements PostHelper {}

void main() {
  randomizerTesting();
  httpPostHelperTest();
}

void httpPostHelperTest() {
  group('formatPostTitle', () {
    test('when post is new', () async {
      final mockedPostHelper = MockPostHelper();

      when(mockedPostHelper.isNewPost(any)).thenReturn(true);

      Post post = new Post(
        title: 'Flutter/Dart Tutorial',
      );

      Example example = Example.withMocks(postHelper: mockedPostHelper);
      expect('[New] Flutter/Dart Tutorial', await example.formatPostTitle(post));
    });

    test('when post is not new', () async {
      final mockedPostHelper = MockPostHelper();
      when(mockedPostHelper.isNewPost(any)).thenReturn(false);

      Post post = new Post(
        title: 'Flutter/Dart Tutorial',
      );

      Example example = new Example.withMocks(postHelper: mockedPostHelper);
      expect('Flutter/Dart Tutorial', await example.formatPostTitle(post));
    });
  });

  group('isPostActive', () {
    test('when post is active', () async {
      final mockedPostHelper = MockPostHelper();

      when(mockedPostHelper.fetchPost(1)).thenAnswer((_) async => Future.value(new Post(
            id: 1,
            userId: 1,
            title: 'Post Title',
            content: 'Post content...',
            active: true,
          )));

      Example example = new Example.withMocks(postHelper: mockedPostHelper);
      expect(true, await example.isPostActive(1));
    });

    test('when post is inactive', () async {
      final mockedPostHelper = MockPostHelper();

      when(mockedPostHelper.fetchPost(1)).thenAnswer((_) async => Future.value(new Post(
            id: 1,
            userId: 1,
            title: 'Post Title',
            content: 'Post content...',
            active: false,
          )));

      Example example = new Example.withMocks(postHelper: mockedPostHelper);
      expect(false, await example.isPostActive(1));
    });

    test('when error', () async {
      final mockedPostHelper = MockPostHelper();

      when(mockedPostHelper.fetchPost(1)).thenThrow(new Error());

      Example example = new Example.withMocks(postHelper: mockedPostHelper);
      expect(false, await example.isPostActive(1));
    });
  });
}

void randomizerTesting() {
  Randomizer r;

  setUp(() {
    r = Randomizer();
  });

  group('more than one test case', () {
    test('return a random double number in range', () {
      expect(r.nextInRange2(1.9, 8.6), allOf(greaterThanOrEqualTo(1.9), lessThanOrEqualTo(8.6)));
    });

    test('returns a random int number in range', () {
      expect(r.nextInRange(1, 3), allOf(greaterThanOrEqualTo(1), lessThanOrEqualTo(3)));
    });
  });

  test('return a random number in range', () {
    expect(r.nextInRange(1, 3), allOf(greaterThanOrEqualTo(1), lessThanOrEqualTo(3)));
    //expect(r.nextInRange(5, 7), 6);
  });
}
