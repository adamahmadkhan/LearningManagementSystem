/// id : 1
/// name : "adam ahmad khan"
/// rollnumber : "fa19-bcs-108"
/// email : "developbyadam@gmail.com"
/// password : "adam"
/// profile : "https://img.freepik.com/premium-vector/men-icon-trendy-avatar-character-cheerful-happy-people-flat-vector-illustration-round-frame-male-portraits-group-team-adorable-guys-isolated-white-background_275421-286.jpg"
/// phone : "03175975747"

class Studentdata {
  Studentdata({
      num? id, 
      String? name, 
      String? rollnumber, 
      String? email, 
      String? password, 
      String? profile, 
      String? phone,}){
    _id = id;
    _name = name;
    _rollnumber = rollnumber;
    _email = email;
    _password = password;
    _profile = profile;
    _phone = phone;
}

  Studentdata.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _rollnumber = json['rollnumber'];
    _email = json['email'];
    _password = json['password'];
    _profile = json['profile'];
    _phone = json['phone'];
  }
  num? _id;
  String? _name;
  String? _rollnumber;
  String? _email;
  String? _password;
  String? _profile;
  String? _phone;
Studentdata copyWith({  num? id,
  String? name,
  String? rollnumber,
  String? email,
  String? password,
  String? profile,
  String? phone,
}) => Studentdata(  id: id ?? _id,
  name: name ?? _name,
  rollnumber: rollnumber ?? _rollnumber,
  email: email ?? _email,
  password: password ?? _password,
  profile: profile ?? _profile,
  phone: phone ?? _phone,
);
  num? get id => _id;
  String? get name => _name;
  String? get rollnumber => _rollnumber;
  String? get email => _email;
  String? get password => _password;
  String? get profile => _profile;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['rollnumber'] = _rollnumber;
    map['email'] = _email;
    map['password'] = _password;
    map['profile'] = _profile;
    map['phone'] = _phone;
    return map;
  }

}