class CuriosidadesModel {
  String title;
  String curiosidade;

  CuriosidadesModel({this.title, this.curiosidade});

  CuriosidadesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    curiosidade = json['curiosidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['curiosidade'] = this.curiosidade;
    return data;
  }
}
