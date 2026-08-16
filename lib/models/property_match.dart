class PropertyMatch {
  const PropertyMatch({
    required this.imageUrl,
    required this.price,
    required this.percent,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.tags,
    required this.category,
  });

  final String imageUrl;
  final String price;
  final int percent;
  final int beds;
  final int baths;
  final int sqft;
  final List<String> tags;
  final String category;
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
    category: 'Land',
  ),
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
    price: '\$649,000',
    percent: 95,
    beds: 3,
    baths: 2,
    sqft: 2150,
    tags: ['Garage', 'Modern'],
    category: 'House',
  ),
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
    price: '\$599,000',
    percent: 92,
    beds: 2,
    baths: 1,
    sqft: 1850,
    tags: ['Big windows', 'Open space'],
    category: 'House',
  ),
];

const sampleFeatured = [
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800',
    price: '\$899,000',
    percent: 88,
    beds: 5,
    baths: 4,
    sqft: 3200,
    tags: ['Pool', 'Corner lot'],
    category: 'House',
  ),
  PropertyMatch(
    imageUrl: 'https://images.unsplash.com/photo-1613977257363-707ba9348227?w=800',
    price: '\$540,000',
    percent: 81,
    beds: 3,
    baths: 2,
    sqft: 1900,
    tags: ['Near transit'],
    category: 'House',
  ),
];