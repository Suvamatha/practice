class Project {
  const Project({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.developer,
    required this.priceRange,
    required this.unitTypes,
    required this.totalUnits,
    required this.unitsAvailable,
    required this.status,
  });

  final String imageUrl;
  final String name;
  final String location;
  final String developer;
  final String priceRange; 
  final String unitTypes; 
  final int totalUnits;
  final int unitsAvailable;
  final String status; 
}

const sampleProjects = [
  Project(
    imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800',
    name: 'Sunset Ridge Estates',
    location: 'Austin, TX',
    developer: 'Horizon Developers',
    priceRange: '\$310K – \$480K',
    unitTypes: '2 & 3 BHK',
    totalUnits: 12,
    unitsAvailable: 8,
    status: 'Under construction',
  ),
  Project(
    imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
    name: 'Sunset Ridge Estates',
    location: 'Austin, TX',
    developer: 'Horizon Developers',
    priceRange: '\$310K – \$480K',
    unitTypes: '2 & 3 BHK',
    totalUnits: 12,
    unitsAvailable: 8,
    status: 'Under construction',
  ),
  Project(
    imageUrl: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
    name: 'Sunset Ridge Estates',
    location: 'Austin, TX',
    developer: 'Horizon Developers',
    priceRange: '\$310K – \$480K',
    unitTypes: '2 & 3 BHK',
    totalUnits: 12,
    unitsAvailable: 8,
    status: 'Under construction',
  ),
  Project(
    imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
    name: 'Sunset Ridge Estates',
    location: 'Austin, TX',
    developer: 'Horizon Developers',
    priceRange: '\$310K – \$480K',
    unitTypes: '2 & 3 BHK',
    totalUnits: 12,
    unitsAvailable: 8,
    status: 'Under construction',
  ),
];