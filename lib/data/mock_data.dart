import 'package:flutter/material.dart';

import '../models/app_models.dart';

const homeCategories = [
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

const filterChips = ['地區', '狗貓', '年齡', '體型', '更多篩選'];
const favoriteTabs = ['全部', '狗狗', '貓咪', '已送養'];
const categoryLabels = ['狗狗', '貓咪', '幼年動物'];
const categoryCounts = ['128 隻', '86 隻', '64 隻'];
const recentSearches = ['台南市狗狗', '黑色幼貓', '潤埤收容所'];
const profileMenus = ['認養偏好設定', '我的瀏覽紀錄', '通知設定', '幫助與客服', '關於我們', '設定'];
const taiwanAreas = ['台南市', '台北市', '新北市', '高雄市', '桃園市', '台中市', '彰化縣', '屏東縣'];
const animalTypes = ['狗狗', '貓咪', '其他'];
const ageFilters = ['幼年', '成犬 / 成貓', '老年'];
const genderFilters = ['不限', '公', '母'];
const sizeFilters = ['不限', '小型', '中型', '大型'];
const neuterFilters = ['不限', '已絕育', '未絕育'];

const demoAnimals = [
  Animal(
    name: '小花',
    imagePath: 'assets/images/dog/oscar-sutton-yihlaRCCvd4-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '米克斯',
    color: '黃白色',
    size: '中型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '小黑',
    imagePath: 'assets/images/dog/richard-brutyo-Sg3XwuEpybU-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '米克斯',
    color: '黑色',
    size: '中型',
    ageLabel: '成犬',
    genderLabel: '公',
    tags: [
      AnimalTag('開放認養中', Color(0xFF5E9B54)),
      AnimalTag('已絕育', Color(0xFF4F8A3F)),
      AnimalTag('已施打疫苗', Color(0xFFE56B5B)),
    ],
    isFavorite: true,
  ),
  Animal(
    name: '米米',
    imagePath: 'assets/images/dog/alvan-nee-T-0EW-SEbsE-unsplash.jpg',
    location: '台南市',
    shelterName: '善化站',
    breed: '米克斯',
    color: '黃褐色',
    size: '小型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '斑斑',
    imagePath: 'assets/images/cat/hang-niu-Tn8DLxwuDMA-unsplash.jpg',
    location: '台南市',
    shelterName: '新化站',
    breed: '虎斑貓',
    color: '虎斑色',
    size: '小型',
    ageLabel: '成貓',
    genderLabel: '母',
    tags: [AnimalTag('已絕育', Color(0xFF94B06E))],
  ),
  Animal(
    name: '奶茶',
    imagePath: 'assets/images/cat/amber-kipp-75715CVEJhI-unsplash.jpg',
    location: '台南市',
    shelterName: '學甲站',
    breed: '米克斯貓',
    color: '黑白色',
    size: '小型',
    ageLabel: '幼年',
    genderLabel: '母',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
    isFavorite: true,
  ),
  Animal(
    name: '旺財',
    imagePath: 'assets/images/dog/joe-caione-qO-PIF84Vxg-unsplash.jpg',
    location: '台南市',
    shelterName: '灣裡站',
    breed: '柯基',
    color: '黃白色',
    size: '中型',
    ageLabel: '幼年',
    genderLabel: '公',
    tags: [AnimalTag('開放認養中', Color(0xFF5E9B54))],
  ),
];

const demoShelters = [
  Shelter(
    name: '台南市動物之家灣裡站',
    imagePath: 'assets/images/shaltar/sheltar.jpg',
    address: '台南市南區萬年路 580 巷 92 號',
    phone: '06-2964439',
    distance: '2.3 km',
    capacity: '32 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
  Shelter(
    name: '台南市動物之家善化站',
    imagePath: 'assets/images/shaltar/shaltar2.jpeg',
    address: '台南市善化區東昌里 201 號',
    phone: '06-5832399',
    distance: '5.1 km',
    capacity: '26 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
  Shelter(
    name: '台南市動物之家新化站',
    imagePath: 'assets/images/shaltar/sheltar.jpg',
    address: '台南市新化區知義里 88 號',
    phone: '06-5941211',
    distance: '6.7 km',
    capacity: '18 隻可認養',
    openingHours: '週二至週日 09:00 - 17:00',
  ),
];

const demoNotifications = [
  NoticeItem(
    title: '新毛孩上架',
    message: '台南市新增 2 隻幼犬可認養，快來看看。',
    time: '2 分鐘前',
    icon: Icons.pets_rounded,
    color: Color(0xFFF2B544),
  ),
  NoticeItem(
    title: '收藏更新',
    message: '你收藏的「小黑」狀態更新為：已施打疫苗。',
    time: '1 小時前',
    icon: Icons.favorite_rounded,
    color: Color(0xFFE35D4F),
  ),
  NoticeItem(
    title: '認養成功',
    message: '你收藏的「奶茶」已被認養了，恭喜牠找到新家。',
    time: '昨天 18:30',
    icon: Icons.celebration_rounded,
    color: Color(0xFF4F8A3F),
  ),
  NoticeItem(
    title: '活動資訊',
    message: '本週六灣裡站將舉辦認養活動，歡迎到場互動。',
    time: '2 天前',
    icon: Icons.event_note_rounded,
    color: Color(0xFFF29D38),
  ),
];
