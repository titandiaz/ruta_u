import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String apellido;
  String celular;
  Ciudad ciudad;
  String correo;
  String foto;
  String nombre;
  Type type;
  Universidad universidad;

  UserModel({
    this.apellido,
    this.celular,
    this.ciudad,
    this.correo,
    this.foto,
    this.nombre,
    this.type,
    this.universidad,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        apellido: json["apellido"],
        celular: json["celular"],
        ciudad: Ciudad.fromJson(json["ciudad"]),
        correo: json["correo"],
        foto: json["foto"],
        nombre: json["nombre"],
        type: Type.fromJson(json["type"]),
        universidad: Universidad.fromJson(json["universidad"]),
      );

  Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "celular": celular,
        "ciudad": ciudad.toJson(),
        "correo": correo,
        "foto": foto,
        "nombre": nombre,
        "type": type.toJson(),
        "universidad": universidad.toJson(),
      };
}

class Ciudad {
  int id;
  String nombre;
  Departamento departamento;

  Ciudad({
    this.id,
    this.nombre,
    this.departamento,
  });

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
        id: json["id"],
        nombre: json["nombre"],
        departamento: Departamento.fromJson(json["departamento"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "departamento": departamento.toJson(),
      };
}

class Departamento {
  int id;
  String nombre;

  Departamento({
    this.id,
    this.nombre,
  });

  factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}

class Type {
  int id;
  String nombreType;
  Carro carro;

  Type({
    this.id,
    this.nombreType,
    this.carro,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        nombreType: json["nombreType"],
        carro: Carro.fromJson(json["carro"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreType": nombreType,
        "carro": carro.toJson(),
      };
}

class Carro {
  String color;
  String marca;
  int id;
  String modelo;
  String placa;

  Carro({
    this.color,
    this.marca,
    this.id,
    this.modelo,
    this.placa,
  });

  factory Carro.fromJson(Map<String, dynamic> json) => Carro(
        color: json["color"],
        marca: json["marca"],
        id: json["id"],
        modelo: json["modelo"],
        placa: json["placa"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "marca": marca,
        "id": id,
        "modelo": modelo,
        "placa": placa,
      };
}

class Universidad {
  int id;
  String nombre;
  String logo;
  int sede;

  Universidad({
    this.id,
    this.nombre,
    this.logo,
    this.sede,
  });

  factory Universidad.fromJson(Map<String, dynamic> json) => Universidad(
        id: json["id"],
        nombre: json["nombre"],
        logo: json["logo"],
        sede: json["sede"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "logo": logo,
        "sede": sede,
      };
}
