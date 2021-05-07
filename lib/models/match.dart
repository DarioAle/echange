import 'package:equatable/equatable.dart';

class Matches extends Equatable {
  final String herEmail;
  final String herName;
  final String herPhone;
  final String herPicture;
  final String itemsYouLiked;
  final String yourItemsLiked;

  const Matches({
    this.herEmail,
    this.herName,
    this.herPhone,
    this.herPicture,
    this.itemsYouLiked,
    this.yourItemsLiked,
  });

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      herEmail: json['herEmail'] as String,
      herName: json['herName'] as String,
      herPhone: json['herPhone'] as String,
      herPicture: json['herPicture'] as String,
      itemsYouLiked: json['itemsYouLiked'] as String,
      yourItemsLiked: json['yourItemsLiked'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'herEmail': herEmail,
      'herName': herName,
      'herPhone': herPhone,
      'herPicture': herPicture,
      'itemsYouLiked': itemsYouLiked,
      'yourItemsLiked': yourItemsLiked,
    };
  }

  Matches copyWith({
    String herEmail,
    String herName,
    String herPhone,
    String herPicture,
    String itemsYouLiked,
    String yourItemsLiked,
  }) {
    return Matches(
      herEmail: herEmail ?? this.herEmail,
      herName: herName ?? this.herName,
      herPhone: herPhone ?? this.herPhone,
      herPicture: herPicture ?? this.herPicture,
      itemsYouLiked: itemsYouLiked ?? this.itemsYouLiked,
      yourItemsLiked: yourItemsLiked ?? this.yourItemsLiked,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      herEmail,
      herName,
      herPhone,
      herPicture,
      itemsYouLiked,
      yourItemsLiked,
    ];
  }
}
