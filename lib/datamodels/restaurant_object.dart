class RestaurantObject {
  final String title;
  final String subtitle;
  final String imageURL;
  final double baseDeliveryPrice;
  final double rating;
  final String pricing; //  $
  final int baseEstimate;
  final int id;

  RestaurantObject(
      {this.title,
      this.subtitle,
      this.imageURL,
      this.baseDeliveryPrice,
      this.rating,
      this.pricing,
      this.baseEstimate,
      this.id});
}
