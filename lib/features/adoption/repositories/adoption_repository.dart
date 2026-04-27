import '../models/app_models.dart';

abstract class AdoptionRepository {
  // 新增其他資料來源時，優先維持 repository 介面穩定，
  // 讓 controller 與頁面不需要跟著調整。
  List<HomeCategory> getHomeCategories();
  List<Animal> getAnimals();
  Future<AnimalPage> fetchAnimals(
    AnimalSearchParams searchParams, {
    int top = 1000,
    int skip = 0,
  });
  List<Shelter> buildShelters(List<Animal> animals);
  List<Shelter> getShelters();
  List<NoticeItem> getNotifications();
}
