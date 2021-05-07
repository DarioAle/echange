import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String category;
  final String description;
  final String name;
  final String ownerEmail;
  final String ownerName;
  final String ownerPicture;
  final String size;
  final String state;
  final String urlPicture;

  const Item({
    this.category,
    this.description,
    this.name,
    this.ownerEmail,
    this.ownerName,
    this.ownerPicture,
    this.size,
    this.state,
    this.urlPicture,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      category: json['category'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      ownerEmail: json['ownerEmail'] as String,
      ownerName: json['ownerName'] as String,
      ownerPicture: json['ownerPicture'] as String,
      size: json['size'] as String,
      state: json['state'] as String,
      urlPicture: json['urlPicture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'description': description,
      'name': name,
      'ownerEmail': ownerEmail,
      'ownerName': ownerName,
      'ownerPicture': ownerPicture,
      'size': size,
      'state': state,
      'urlPicture': urlPicture,
    };
  }

  Item copyWith({
    String category,
    String description,
    String name,
    String ownerEmail,
    String ownerName,
    String ownerPicture,
    String size,
    String state,
    String urlPicture,
  }) {
    return Item(
      category: category ?? this.category,
      description: description ?? this.description,
      name: name ?? this.name,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerName: ownerName ?? this.ownerName,
      ownerPicture: ownerPicture ?? this.ownerPicture,
      size: size ?? this.size,
      state: state ?? this.state,
      urlPicture: urlPicture ?? this.urlPicture,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      category,
      description,
      name,
      ownerEmail,
      ownerName,
      ownerPicture,
      size,
      state,
      urlPicture,
    ];
  }
}
