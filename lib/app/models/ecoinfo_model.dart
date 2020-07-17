class EcoInfoModel {
  String quem;
  String anatomorfologia;
  String repro;
  String ecoloc;
  String inimigos;
  String imgskeleton;
  String imgmorf;
  String imgecoloc;

  EcoInfoModel(
      {this.quem,
      this.anatomorfologia,
      this.repro,
      this.ecoloc,
      this.inimigos,
      this.imgskeleton,
      this.imgmorf,
      this.imgecoloc});

  EcoInfoModel.fromJson(Map<String, dynamic> json) {
    quem = json['quem'];
    anatomorfologia = json['anatomorfologia'];
    repro = json['repro'];
    ecoloc = json['ecoloc'];
    inimigos = json['inimigos'];
    imgskeleton = json['imgskeleton'];
    imgmorf = json['imgmorf'];
    imgecoloc = json['imgecoloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quem'] = this.quem;
    data['anatomorfologia'] = this.anatomorfologia;
    data['repro'] = this.repro;
    data['ecoloc'] = this.ecoloc;
    data['inimigos'] = this.inimigos;
    data['imgskeleton'] = this.imgskeleton;
    data['imgmorf'] = this.imgmorf;
    data['imgecoloc'] = this.imgecoloc;
    return data;
  }
}
