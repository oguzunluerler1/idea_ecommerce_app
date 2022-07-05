class Kampanya {
  final String id;
  final String kapsami;
  final String ozelligi;

  Kampanya({required this.id, required this.kapsami, required this.ozelligi});
  //final tanitimResmi//todo RESİM TUTMA OLAYINI STORAGEDAN AYARLAYINCA İLGİLENİCEM.

  Map<String, dynamic> toMap() => {
        'id': id,
        'kapsami': kapsami,
        'ozelligi': ozelligi,
      };

  factory Kampanya.fromMap(Map map) => Kampanya(
        id: map['id'],
        kapsami: map['kapsami'],
        ozelligi: map['ozelligi'],
      );
}
