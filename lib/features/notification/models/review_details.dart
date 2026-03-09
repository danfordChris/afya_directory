class ReviewDetails {
  const ReviewDetails({
    required this.overallRating,
    required this.serviceQualityRating,
    required this.facilitiesEquipmentRating,
    required this.professionalCompetenceRating,
    required this.impactOutcomeRating,
    required this.communicationRating,
    required this.review,
    required this.submittedBy,
  });

  final double overallRating;
  final double serviceQualityRating;
  final double facilitiesEquipmentRating;
  final double professionalCompetenceRating;
  final double impactOutcomeRating;
  final double communicationRating;
  final String review;
  final String submittedBy;
}
