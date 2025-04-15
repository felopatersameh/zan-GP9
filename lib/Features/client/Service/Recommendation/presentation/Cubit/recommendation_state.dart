part of 'recommendation_cubit.dart';

@immutable
class RecommendationState {
  final String? image;
  final List<String>? optionsRoom;
  final String? selectedOptionsRoom;

  const RecommendationState(
      {this.image, this.optionsRoom, this.selectedOptionsRoom});

  RecommendationState copyWith({
    String? image,
    List<String>? optionsRoom,
    String? selectedOptionsRoom,
  }) {
    return RecommendationState(
      image: image ?? this.image,
      optionsRoom: optionsRoom ?? this.optionsRoom,
      selectedOptionsRoom: selectedOptionsRoom ?? this.selectedOptionsRoom,
    );
  }
}
