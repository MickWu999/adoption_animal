class LookupOption {
  const LookupOption({
    required this.code,
    required this.label,
    this.countyCode,
  });

  final int code;
  final String label;
  final int? countyCode;
}

const countyOptions = <LookupOption>[
  LookupOption(code: 2, label: '台北市'),
  LookupOption(code: 3, label: '新北市'),
  LookupOption(code: 4, label: '基隆市'),
  LookupOption(code: 5, label: '宜蘭縣'),
  LookupOption(code: 6, label: '桃園縣'),
  LookupOption(code: 7, label: '新竹縣'),
  LookupOption(code: 8, label: '新竹市'),
  LookupOption(code: 9, label: '苗栗縣'),
  LookupOption(code: 10, label: '台中市'),
  LookupOption(code: 11, label: '彰化縣'),
  LookupOption(code: 12, label: '南投縣'),
  LookupOption(code: 13, label: '雲林縣'),
  LookupOption(code: 14, label: '嘉義縣'),
  LookupOption(code: 15, label: '嘉義市'),
  LookupOption(code: 16, label: '台南市'),
  LookupOption(code: 17, label: '高雄市'),
  LookupOption(code: 18, label: '屏東縣'),
  LookupOption(code: 19, label: '花蓮縣'),
  LookupOption(code: 20, label: '台東縣'),
  LookupOption(code: 21, label: '澎湖縣'),
  LookupOption(code: 22, label: '金門縣'),
  LookupOption(code: 23, label: '連江縣'),
];

const shelterOptions = <LookupOption>[
  LookupOption(code: 48, label: '基隆市寵物銀行', countyCode: 4),
  LookupOption(code: 49, label: '台北市動物之家', countyCode: 2),
  LookupOption(code: 50, label: '新北市板橋區公立動物之家', countyCode: 3),
  LookupOption(code: 51, label: '新北市新店區公立動物之家', countyCode: 3),
  LookupOption(code: 53, label: '新北市中和區公立動物之家', countyCode: 3),
  LookupOption(code: 55, label: '新北市淡水區公立動物之家', countyCode: 3),
  LookupOption(code: 56, label: '新北市瑞芳區公立動物之家', countyCode: 3),
  LookupOption(code: 58, label: '新北市五股區公立動物之家', countyCode: 3),
  LookupOption(code: 59, label: '新北市八里區公立動物之家', countyCode: 3),
  LookupOption(code: 60, label: '新北市三芝區公立動物之家', countyCode: 3),
  LookupOption(code: 61, label: '桃園市動物保護教育園區', countyCode: 6),
  LookupOption(code: 62, label: '新竹市動物收容所', countyCode: 8),
  LookupOption(code: 63, label: '新竹縣動物收容所', countyCode: 7),
  LookupOption(code: 67, label: '台中市動物之家南屯園區', countyCode: 10),
  LookupOption(code: 68, label: '台中市動物之家后里園區', countyCode: 10),
  LookupOption(code: 69, label: '彰化縣流浪狗中途之家', countyCode: 11),
  LookupOption(code: 70, label: '南投縣公立動物收容所', countyCode: 12),
  LookupOption(code: 71, label: '嘉義市流浪犬收容中心', countyCode: 15),
  LookupOption(code: 72, label: '嘉義縣流浪犬中途之家', countyCode: 14),
  LookupOption(code: 73, label: '台南市動物之家灣裡站', countyCode: 16),
  LookupOption(code: 74, label: '台南市動物之家善化站', countyCode: 16),
  LookupOption(code: 75, label: '高雄市壽山動物保護教育園區', countyCode: 17),
  LookupOption(code: 76, label: '高雄市燕巢動物保護關愛園區', countyCode: 17),
  LookupOption(code: 77, label: '屏東縣流浪動物收容所', countyCode: 18),
  LookupOption(code: 78, label: '宜蘭縣流浪動物中途之家', countyCode: 5),
  LookupOption(code: 79, label: '花蓮縣流浪犬中途之家', countyCode: 19),
  LookupOption(code: 80, label: '台東縣動物收容中心', countyCode: 20),
  LookupOption(code: 81, label: '連江縣流浪犬收容中心', countyCode: 23),
  LookupOption(code: 82, label: '金門縣動物收容中心', countyCode: 22),
  LookupOption(code: 83, label: '澎湖縣流浪動物收容中心', countyCode: 21),
  LookupOption(code: 89, label: '雲林縣流浪動物收容所', countyCode: 13),
  LookupOption(code: 92, label: '新北市政府動物保護防疫處', countyCode: 3),
  LookupOption(code: 96, label: '苗栗縣生態保育教育中心', countyCode: 9),
];

String countyLabelForCode(int code) {
  for (final option in countyOptions) {
    if (option.code == code) {
      return option.label;
    }
  }
  return code.toString();
}

String shelterLabelForCode(int code) {
  for (final option in shelterOptions) {
    if (option.code == code) {
      return option.label;
    }
  }
  return code.toString();
}

List<LookupOption> sheltersForCountyCode(int countyCode) {
  return shelterOptions
      .where((option) => option.countyCode == countyCode)
      .toList(growable: false);
}
