import 'package:flutter/foundation.dart';
import '../models/destination_model.dart';
import '../models/discover_model.dart';

class TravelViewModel with ChangeNotifier {
  final List<Destination> _destinations = [
    Destination(
      title: 'Tiny home in Rælingen',
      imageUrl: 'https://images.unsplash.com/photo-1554995207-c18c203602cb?q=80&w=1600&auto=format&fit=crop',
      rating: '4.96 (217)',
      facts: '4 guests  •  2 bedrooms  •  2 beds  •  1 bathroom',
      priceOld: '€117',
      priceNew: '€91 night',
      total: '€273 total',
    ),
    Destination(
      title: 'Lake cabin in Voss',
      imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1600&auto=format&fit=crop',
      rating: '4.88 (143)',
      facts: '4 guests  •  2 bedrooms  •  2 beds  •  1 bathroom',
      priceOld: '€117',
      priceNew: '€91 night',
      total: '€273 total',
    ),
    Destination(
      title: 'Modern hut in Tromsø',
      imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?q=80&w=1600&auto=format&fit=crop',
      rating: '4.92 (301)',
      facts: '4 guests  •  2 bedrooms  •  2 beds  •  1 bathroom',
      priceOld: '€117',
      priceNew: '€91 night',
      total: '€273 total',
    ),
    Destination(
      title: 'Forest loft in Ås',
      imageUrl: 'https://images.unsplash.com/photo-1494526585095-c41746248156?q=80&w=1600&auto=format&fit=crop',
      rating: '4.90 (189)',
      facts: '4 guests  •  2 bedrooms  •  2 beds  •  1 bathroom',
      priceOld: '€117',
      priceNew: '€91 night',
      total: '€273 total',
    ),
  ];

  final List<DiscoverPlace> _discoverPlaces = [
    DiscoverPlace(
      title: 'Santorini',
      imageUrl: 'https://images.unsplash.com/photo-1505735457224-84f52f58b3c7?q=80&w=1400&auto=format&fit=crop',
    ),
    DiscoverPlace(
      title: 'Alps',
      imageUrl: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?q=80&w=1400&auto=format&fit=crop',
    ),
    DiscoverPlace(
      title: 'Amalfi',
      imageUrl: 'https://images.unsplash.com/photo-1493558103817-58b2924bce98?q=80&w=1400&auto=format&fit=crop',
    ),
    DiscoverPlace(
      title: 'Bali',
      imageUrl: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=1400&auto=format&fit=crop',
    ),
  ];

  List<Destination> get destinations => _destinations;
  List<DiscoverPlace> get discoverPlaces => _discoverPlaces;

  final String heroImage = 'https://images.unsplash.com/photo-1519681393784-d120267933ba?q=80&w=1800&auto=format&fit=crop';
  final String greeting = 'Hey, Martin! Tell us where you\nwant to go';
  final String title = 'Norway';
}