class Morcegos {
  String sId;
  String especie;
  String familia;
  String distgeo;
  String habalim;
  Fordent fordent;
  String repro;
  String mododevida;
  String image;

  static List<String> familias = [
    "Phyllostomidae",
    "Mormopidae",
    "Emballoruidae",
    "Molossidae"
  ];
  static List<String> subfamilias = [
    "Desmodontinae",
    "Glossophaginae",
    "Phyllostominae",
    "Carollinae",
    "Stenodermatinae"
  ];
  static List<String> generos = [
    "Petopteryx",
    "Molossus",
    "Lonchophylla",
    "Glossophaga",
    "Lonchorhina",
    "Carollia",
    "Micronycteris",
    "Desmodus",
    "Sturnira",
    "Artibeus",
    "Phyllostomus",
    "Pteronotus",
    "Chrotopterus",
    "Saccopteryx"
  ];

  Morcegos(
      {this.sId,
      this.especie,
      this.familia,
      this.distgeo,
      this.habalim,
      this.fordent,
      this.repro,
      this.mododevida,
      this.image});

  Morcegos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    especie = json['especie'];
    familia = json['familia'];
    distgeo = json['distgeo'];
    habalim = json['habalim'];
    fordent =
        json['fordent'] != null ? new Fordent.fromJson(json['fordent']) : null;
    repro = json['repro'];
    mododevida = json['mododevida'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['especie'] = this.especie;
    data['familia'] = this.familia;
    data['distgeo'] = this.distgeo;
    data['habalim'] = this.habalim;
    if (this.fordent != null) {
      data['fordent'] = this.fordent.toJson();
    }
    data['repro'] = this.repro;
    data['mododevida'] = this.mododevida;
    data['image'] = this.image;
    return data;
  }
}

class Fordent {
  String info;
  String image;

  Fordent({this.info, this.image});

  Fordent.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = this.info;
    data['image'] = this.image;
    return data;
  }
}
