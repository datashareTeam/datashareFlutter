import 'package:plpidb/entity/article_entity.dart';
import 'package:plpidb/entity/banner_entity.dart';
import 'package:plpidb/entity/common_entity.dart';
import 'package:plpidb/entity/hot_key_entity.dart';
import 'package:plpidb/entity/navi_entity.dart';
import 'package:plpidb/entity/project_entity.dart';
import 'package:plpidb/entity/project_list_entity.dart';
import 'package:plpidb/entity/tree_entity.dart';
import 'package:plpidb/entity/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ArticleEntity") {
      return ArticleEntity.fromJson(json) as T;
    } else if (T.toString() == "BannerEntity") {
      return BannerEntity.fromJson(json) as T;
    } else if (T.toString() == "CommonEntity") {
      return CommonEntity.fromJson(json) as T;
    } else if (T.toString() == "HotKeyEntity") {
      return HotKeyEntity.fromJson(json) as T;
    } else if (T.toString() == "NaviEntity") {
      return NaviEntity.fromJson(json) as T;
    } else if (T.toString() == "ProjectEntity") {
      return ProjectEntity.fromJson(json) as T;
    } else if (T.toString() == "ProjectListEntity") {
      return ProjectListEntity.fromJson(json) as T;
    } else if (T.toString() == "TreeEntity") {
      return TreeEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}