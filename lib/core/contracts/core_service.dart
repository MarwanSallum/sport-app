
import 'package:get/get.dart';
import 'package:sport_app/core/util/dto.dart';

abstract class CoreService<CoreModel> extends GetxService{
  Future<CoreModel?> create({required DTO dto});
  Future<CoreModel?> updateModel({required CoreModel model});
  Future<void> delete({required int id});
  Future<List<CoreModel>?> findAll({int? page});
  Future<CoreModel?> findOne({required String id});
}