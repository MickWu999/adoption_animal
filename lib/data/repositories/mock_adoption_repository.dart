import 'package:flutter/material.dart';

import '../../domain/models/app_models.dart';

abstract class AdoptionRepository {
  List<HomeCategory> getHomeCategories();
  List<Animal> getAnimals();
  List<Shelter> getShelters();
  List<NoticeItem> getNotifications();
}

class MockAdoptionRepository implements AdoptionRepository {
  const MockAdoptionRepository();

  @override
  List<HomeCategory> getHomeCategories() {
    return const [
      HomeCategory(
        label: '狗狗',
        icon: Icons.pets_rounded,
        background: Color(0xFFFFE4C6),
        foreground: Color(0xFFB56B1B),
      ),
      HomeCategory(
        label: '貓咪',
        icon: Icons.cruelty_free_rounded,
        background: Color(0xFFFFE9B9),
        foreground: Color(0xFFC38A08),
      ),
      HomeCategory(
        label: '幼年',
        icon: Icons.face_4_rounded,
        background: Color(0xFFFFD7C7),
        foreground: Color(0xFFC26A4B),
      ),
      HomeCategory(
        label: '附近',
        icon: Icons.near_me_rounded,
        background: Color(0xFFE3F1CC),
        foreground: Color(0xFF4F8A3F),
      ),
      HomeCategory(
        label: '已絕育',
        icon: Icons.favorite_rounded,
        background: Color(0xFFDFF0DD),
        foreground: Color(0xFF4F8A3F),
      ),
    ];
  }

  @override
  List<Animal> getAnimals() {
    return const [
      Animal(
        id: 'a1',
        name: '小花',
        imagePath: 'assets/images/dog/oscar-sutton-yihlaRCCvd4-unsplash.jpg',
        location: '台南市',
        shelterId: 's1',
        shelterName: '台南市動物之家灣裡站',
        breed: '米克斯',
        color: '黃白色',
        size: '中型',
        ageLabel: '幼年',
        genderLabel: '母',
        type: AnimalType.dog,
        tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
        isFavorite: true,
        isNeutered: true,
      ),
      Animal(
        id: 'a2',
        name: '小黑',
        imagePath: 'assets/images/dog/richard-brutyo-Sg3XwuEpybU-unsplash.jpg',
        location: '台南市',
        shelterId: 's1',
        shelterName: '台南市動物之家灣裡站',
        breed: '米克斯',
        color: '黑色',
        size: '中型',
        ageLabel: '成犬',
        genderLabel: '公',
        type: AnimalType.dog,
        tags: [
          AnimalTag('開放認養中', Color(0xFF5E9B54)),
          AnimalTag('已絕育', Color(0xFF4F8A3F)),
          AnimalTag('已施打疫苗', Color(0xFFE56B5B)),
        ],
        isFavorite: true,
        isNeutered: true,
      ),
      Animal(
        id: 'a3',
        name: '米米',
        imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
        location: '台南市',
        shelterId: 's2',
        shelterName: '台南市動物之家善化站',
        breed: '米克斯',
        color: '黃褐色',
        size: '小型',
        ageLabel: '幼年',
        genderLabel: '母',
        type: AnimalType.dog,
        tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
      ),
      Animal(
        id: 'a4',
        name: '斑斑',
        imagePath: 'assets/images/cat/hang-niu-Tn8DLxwuDMA-unsplash.jpg',
        location: '台南市',
        shelterId: 's3',
        shelterName: '台南市動物之家新化站',
        breed: '虎斑貓',
        color: '虎斑色',
        size: '小型',
        ageLabel: '成貓',
        genderLabel: '母',
        type: AnimalType.cat,
        tags: [AnimalTag('已絕育', Color(0xFF94B06E))],
        isNeutered: true,
      ),
      Animal(
        id: 'a5',
        name: '奶茶',
        imagePath: 'assets/images/cat/amber-kipp-75715CVEJhI-unsplash.jpg',
        location: '台南市',
        shelterId: 's4',
        shelterName: '台南市動物之家學甲站',
        breed: '米克斯貓',
        color: '黑白色',
        size: '小型',
        ageLabel: '幼年',
        genderLabel: '母',
        type: AnimalType.cat,
        tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
        isFavorite: true,
      ),
      Animal(
        id: 'a6',
        name: '旺財',
        imagePath: 'assets/images/dog/joe-caione-qO-PIF84Vxg-unsplash.jpg',
        location: '台南市',
        shelterId: 's1',
        shelterName: '台南市動物之家灣裡站',
        breed: '柯基',
        color: '黃白色',
        size: '中型',
        ageLabel: '幼年',
        genderLabel: '公',
        type: AnimalType.dog,
        tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
      ),
      Animal(
        id: 'a7',
        name: '小雪',
        imagePath: 'assets/images/cat/alvan-nee-ZCHj_2lJP00-unsplash.jpg',
        location: '台南市',
        shelterId: 's2',
        shelterName: '台南市動物之家善化站',
        breed: '白貓',
        color: '白色',
        size: '小型',
        ageLabel: '老年',
        genderLabel: '母',
        type: AnimalType.cat,
        tags: [AnimalTag('需熟齡照護', Color(0xFFD67D38))],
        isAdopted: true,
      ),
    ];
  }

  @override
  List<Shelter> getShelters() {
    return const [
      Shelter(
        id: 's1',
        name: '台南市動物之家灣裡站',
        imagePath: 'assets/images/shaltar/sheltar.jpg',
        address: '台南市南區萬年路 580 巷 92 號',
        phone: '06-2964439',
        distance: '2.3 km',
        capacity: '32 隻可認養',
        openingHours: '週二至週日 09:00 - 17:00',
      ),
      Shelter(
        id: 's2',
        name: '台南市動物之家善化站',
        imagePath: 'assets/images/shaltar/shaltar2.jpeg',
        address: '台南市善化區東昌里 201 號',
        phone: '06-5832399',
        distance: '5.1 km',
        capacity: '26 隻可認養',
        openingHours: '週二至週日 09:00 - 17:00',
      ),
      Shelter(
        id: 's3',
        name: '台南市動物之家新化站',
        imagePath: 'assets/images/shaltar/sheltar.jpg',
        address: '台南市新化區知義里 88 號',
        phone: '06-5941211',
        distance: '6.7 km',
        capacity: '18 隻可認養',
        openingHours: '週二至週日 09:00 - 17:00',
      ),
      Shelter(
        id: 's4',
        name: '台南市動物之家學甲站',
        imagePath: 'assets/images/shaltar/sheltar.jpg',
        address: '台南市學甲區華宗路 315 號',
        phone: '06-7837429',
        distance: '7.4 km',
        capacity: '21 隻可認養',
        openingHours: '週二至週日 09:00 - 17:00',
      ),
    ];
  }

  @override
  List<NoticeItem> getNotifications() {
    return const [
      NoticeItem(
        id: 'n1',
        title: '新毛孩上架',
        message: '台南市新增 2 隻幼犬可認養，快來看看。',
        time: '2 分鐘前',
        icon: Icons.pets_rounded,
        color: Color(0xFFF2B544),
      ),
      NoticeItem(
        id: 'n2',
        title: '收藏更新',
        message: '你收藏的「小黑」狀態更新為：已施打疫苗。',
        time: '1 小時前',
        icon: Icons.favorite_rounded,
        color: Color(0xFFE35D4F),
      ),
      NoticeItem(
        id: 'n3',
        title: '認養成功',
        message: '你追蹤的「小雪」已找到新家。',
        time: '昨天 18:30',
        icon: Icons.celebration_rounded,
        color: Color(0xFF4F8A3F),
      ),
    ];
  }
}
