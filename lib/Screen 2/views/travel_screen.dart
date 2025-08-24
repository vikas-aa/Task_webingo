import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_webingo/Screen%202/view_models/bottom_nav_view_model,dart';
import '../view_models/travel_view_model.dart';
import './components/hero_header.dart';
import './components/listing_card_compact.dart';
import './components/discover_tile.dart';
import './components/glass_bottom_bar.dart';
import './widgets/no_glow_scroll.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final travelViewModel = Provider.of<TravelViewModel>(context);
    final bottomNavViewModel = Provider.of<BottomNavViewModel>(context);
    
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final isCompact = width < 370;
    final heroHeight = mq.padding.top + (isCompact ? 210 : 270);

    // Titles - Fixed: Use final variable instead of function
    final TextStyle tH2 = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF0F0F0F),
      letterSpacing: -0.2,
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF3F4F6),
      body: ScrollConfiguration(
        behavior: const NoGlowScroll(),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HeroHeader(
                imageUrl: travelViewModel.heroImage,
                title: travelViewModel.title,
                greeting: travelViewModel.greeting,
                height: heroHeight,
              ),
            ),

            // Section: The most relevant
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              sliver: SliverToBoxAdapter(
                child: Text('The most relevant', style: tH2),
              ),
            ),

            // Multiple horizontal cards
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: travelViewModel.destinations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) {
                    final destination = travelViewModel.destinations[i];
                    return SizedBox(
                      width: width - 66,
                      child: ListingCardCompact(
                        imageUrl: destination.imageUrl,
                        title: destination.title,
                        ratingText: destination.rating,
                        facts: destination.facts,
                        priceOld: destination.priceOld,
                        priceNew: destination.priceNew,
                        total: destination.total,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Discover
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              sliver: SliverToBoxAdapter(
                child: Text('Discover new places', style: tH2),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 132,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: travelViewModel.discoverPlaces.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) {
                    final place = travelViewModel.discoverPlaces[i];
                    return DiscoverTile(
                      title: place.title, 
                      imageUrl: place.imageUrl, 
                      width: 168
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),

      // Bottom nav
      bottomNavigationBar: GlassBlackBottomBar(
        currentIndex: bottomNavViewModel.currentIndex,
        onTap: (i) => bottomNavViewModel.setIndex(i),
        items: const [
          BottomItem(icon: Icons.explore_outlined, label: 'Discover'),
          BottomItem(icon: Icons.favorite_border, label: 'Favorites'),
          BottomItem(icon: Icons.bookmark_add_outlined, label: 'Bookings'),
          BottomItem(icon: Icons.chat_bubble_outline, label: 'Messages'),
        ],
        extraBottomPadding: 12,
        showHomeIndicator: true,
      ),
    );
  }
}