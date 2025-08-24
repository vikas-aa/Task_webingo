import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../view_models/choose_seats_viewmodel.dart';
import '../services/seat_service.dart';
import '../models/ticket_model.dart';
import './widgets/seat_widget.dart';
import './widgets/ticket_card.dart';

class ChooseSeatsScreen extends StatefulWidget {
  const ChooseSeatsScreen({super.key});

  @override
  State<ChooseSeatsScreen> createState() => _ChooseSeatsScreenState();
}

class _ChooseSeatsScreenState extends State<ChooseSeatsScreen> {
  late ChooseSeatsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    
    final ticketInfo = TicketInfo(
      time: '21:55',
      date: '08.04',
      cinema: 'Cinema Max',
      pricePerSeat: 35.50,
    );
    
    _viewModel = ChooseSeatsViewModel(
      ticketInfo: ticketInfo,
      reservedSeats: SeatService.getReservedSeats(),
      preSelectedSeats: SeatService.getPreSelectedSeats(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChooseSeatsViewModel>(
      create: (context) => _viewModel,
      child: Scaffold(
        backgroundColor: const Color(0xFFECE6D9),
        body: Stack(
          children: [
            // subtle top neon gradient
            Positioned(
              top: -120,
              left: -60,
              right: -60,
              height: 260,
              child: IgnorePointer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1.2,
                      colors: [Color(0xFFCBFF4D), Colors.transparent],
                      stops: [0, .9],
                    ),
                  ),
                ),
              ),
            ),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar Row (avatar, name, search)
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 6, 18, 0),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop'),
                ),
                const SizedBox(width: 8),
                Text('Samantha',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF141414),
                    )),
                const Spacer(),
                _roundBtn(Icons.search, onTap: () {}, bg: Colors.transparent, iconColor: const Color(0xFF141414),),
              ],
            ),
          ),
          _buildHeader(),
          _buildSeatsGrid(),
          _buildLegend(),
          _buildTicketCard(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _roundBtn(
            Icons.arrow_back,
            onTap: () {
              Navigator.pop(context);
            },
            bg: Colors.transparent,
            iconColor: const Color(0xFF121212),
          ),
          const SizedBox(width: 12),
          Text(
            'Choose Seats',
            style: GoogleFonts.inter(
              fontSize: 28,
              height: 1.1,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF121212),
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeatsGrid() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Consumer<ChooseSeatsViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  const SizedBox(height: 24),
                  Column(
                    children: List.generate(viewModel.totalRows, (rowIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(8, (colIndex) {
                          if ((rowIndex == 0 || rowIndex == viewModel.totalRows - 1) && colIndex == 0) {
                            return SizedBox(width: 36);
                          }
                          
                          if ((rowIndex == 0 || rowIndex == viewModel.totalRows - 1) && colIndex == 7) {
                            return SizedBox(width: 36);
                          }
                          
                          if (colIndex == 4) {
                            return Row(
                              children: [
                                SizedBox(width: 36 * 0.5),
                                _buildSeat(viewModel, rowIndex, colIndex),
                              ],
                            );
                          }
                          
                          return _buildSeat(viewModel, rowIndex, colIndex);
                        }),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSeat(ChooseSeatsViewModel viewModel, int rowIndex, int colIndex) {
    int adjustedColIndex;
    if (rowIndex == 0 || rowIndex == viewModel.totalRows - 1) {
      adjustedColIndex = colIndex - 1;
    } else {
      adjustedColIndex = colIndex;
    }
    
    final reserved = viewModel.isReserved(rowIndex, adjustedColIndex);
    final selected = viewModel.isSelected(rowIndex, adjustedColIndex);
    final color = reserved
        ? const Color(0xFF111111)
        : selected
            ? const Color(0xFF9C7BFF)
            : const Color(0xFFD8D3C9);

    return 
    SeatWidget(
      size: 36,
      color: color,
      onTap: () => viewModel.toggleSeatSelection(rowIndex, adjustedColIndex),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _legendDot(const Color(0xFF9C7BFF)),
            const SizedBox(width: 8),
            Text('Selected', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF222222))),
            const SizedBox(width: 22),
            _legendDot(const Color(0xFF111111)),
            const SizedBox(width: 8),
            Text('Reserved', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF222222))),
            const SizedBox(width: 22),
            _legendDot(const Color(0xFFD8D3C9)),
            const SizedBox(width: 8),
            Text('Available', style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: const Color(0xFF222222))),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard() {
    return Consumer<ChooseSeatsViewModel>(
      builder: (context, viewModel, child) {
        final pad = MediaQuery.of(context).padding;
        return Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 14, 10 + pad.bottom * .2),
          child: TicketCard(
            price: viewModel.getFormattedPrice(),
            time: viewModel.ticketInfo.time,
            date: viewModel.ticketInfo.date,
            cinema: viewModel.ticketInfo.cinema,
            seats: viewModel.getFormattedSeats(),
            row: viewModel.getFormattedRows(),
            onBuy: () {},
          ),
        );
      },
    );
  }

  Widget _legendDot(Color c) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: c, shape: BoxShape.circle),
      );

  Widget _roundBtn(IconData icon, {VoidCallback? onTap, Color bg = Colors.white24, Color iconColor = Colors.white}) {
    return ClipOval(
      child: Material(
        color: bg,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 34,
            height: 34,
            child: Icon(icon, size: 28, color: iconColor),
          ),
        ),
      ),
    );
  }
}