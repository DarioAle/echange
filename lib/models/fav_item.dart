import 'package:equatable/equatable.dart';

class FavItem extends Equatable {
  final String category;
  final String description;
  final String name;
  final String ownerEmail;
  final String ownerName;
  final String ownerPhone;
  final String ownerPicture;
  final String size;
  final String status;
  final String urlPicture;

  const FavItem({
    this.category,
    this.description,
    this.name,
    this.ownerEmail,
    this.ownerName,
    this.ownerPhone,
    this.ownerPicture,
    this.size,
    this.status,
    this.urlPicture,
  });

  factory FavItem.fromJson(Map<String, dynamic> json) {
    return FavItem(
      category: json['category'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      ownerEmail: json['ownerEmail'] as String,
      ownerName: json['ownerName'] as String,
      ownerPhone: json['ownerPhone'] as String,
      ownerPicture: json['ownerPicture'] as String,
      size: json['size'] as String,
      status: json['status'] as String,
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
      'ownerPhone': ownerPhone,
      'ownerPicture': ownerPicture,
      'size': size,
      'status': status,
      'urlPicture': urlPicture,
    };
  }

  FavItem copyWith({
    String category,
    String description,
    String name,
    String ownerEmail,
    String ownerName,
    String ownerPhone,
    String ownerPicture,
    String size,
    String status,
    String urlPicture,
  }) {
    return FavItem(
      category: category ?? this.category,
      description: description ?? this.description,
      name: name ?? this.name,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      ownerPicture: ownerPicture ?? this.ownerPicture,
      size: size ?? this.size,
      status: status ?? this.status,
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
      ownerPhone,
      ownerPicture,
      size,
      status,
      urlPicture,
    ];
  }
}
