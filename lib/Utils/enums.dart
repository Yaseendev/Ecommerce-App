enum SortOptions {
  most_relv(title: 'Most Relevant'),
  low_price(title: 'Lowest Price'),
  high_price(title: 'Highest Price'),
  high_rating(title: 'Highest Rating'),
  low_rating(title: 'Lowest Rating');

  final String title;
  const SortOptions({
    required this.title,
  });

  factory SortOptions.fromString(String option) {
    switch (option) {
      case 'most_relv':
        return SortOptions.most_relv;
        case 'low_price':
        return SortOptions.low_price;
        case 'high_price':
        return SortOptions.high_price;
        case 'high_rating':
        return SortOptions.high_rating;
        case 'low_rating':
        return SortOptions.low_rating;
      default: return SortOptions.most_relv;
    }
  }
}
