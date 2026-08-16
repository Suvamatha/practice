class PropertyMatch {
  const PropertyMatch({
    required this.imageUrl,
    required this.price,
    required this.percent,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.tags,
  });

  final String imageUrl;
  final String price;
  final int percent;
  final int beds;
  final int baths;
  final int sqft;
  final List<String> tags;
}

const sampleMatches = [
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800',
    price: '\$725,000',
    percent: 98,
    beds: 4,
    baths: 3,
    sqft: 2450,
    tags: ['Good schools', 'Yard'],
  ),
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
    price: '\$649,000',
    percent: 95,
    beds: 3,
    baths: 2,
    sqft: 2150,
    tags: ['Garage', 'Modern'],
  ),
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
    price: '\$599,000',
    percent: 92,
    beds: 2,
    baths: 1,
    sqft: 1850,
    tags: ['Big windows', 'Open space'],
  ),
];
