class City {
  String location;
  int woeid;

  City({this.woeid, this.location});

  City.initial()
      : woeid = 0,
        location = '';

  City.fromJson(Map<String, dynamic> json) {
    location = json['title'];
    woeid = json['woeid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.location;
    data['woeid'] = this.woeid;

    return data;
  }
}
