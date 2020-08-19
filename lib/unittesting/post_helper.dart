import 'dart:async';

import 'dart:math';

class Example {
  PostHelper postHelper;

  Example() {
    this.postHelper = new PostHelper();
  }

  Example.withMocks({this.postHelper});

  Future<String> formatPostTitle(Post post) {
    bool isNew = postHelper.isNewPost(post);

    return Future.value(isNew ? '[New] ${post.title}' : post.title);
  }

  Future<bool> isPostActive(int id) async {
    try {
      Post post = await postHelper.fetchPost(id);
      return post.active == true;
    } catch (err) {
      return false;
    }
  }
}

class Post {
  final String title;
  final String content;
  final int id;
  final int userId;
  final bool active;

  Post({this.content, this.id, this.userId, this.active, this.title});
}

class PostHelper {
  bool isNewPost(Post post) {
    return Random().nextBool();
  }

  fetchPost(int id) {}
}
