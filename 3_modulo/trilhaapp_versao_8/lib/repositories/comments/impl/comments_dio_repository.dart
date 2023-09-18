import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/impl/comments_repository.dart';

import '../../jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustomDio.dio.get('/posts/$postId/comments');
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
