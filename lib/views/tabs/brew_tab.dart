// lib/views/tabs/brew_tab.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/brew_viewmodel.dart';
import '../../widgets/timer_button.dart';

class BrewTab extends StatelessWidget {
  const BrewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BrewViewModel>(
      builder: (context, viewModel, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQuickTimer(viewModel),
              const SizedBox(height: 30),
              _buildTimerDisplay(viewModel),
              const SizedBox(height: 30),
              _buildRatioCalculator(viewModel),
              const SizedBox(height: 30),
              _buildBrewingGuides(),
              const SizedBox(height: 30),
              _buildTodayChallenge(),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildQuickTimer(BrewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Timer',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C2415),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TimerButton(
              label: '30s',
              seconds: 30,
              isSelected: viewModel.selectedTimerPreset == 30,
              onTap: () => viewModel.setTimerPreset(30),
            ),
            TimerButton(
              label: '1min',
              seconds: 60,
              isSelected: viewModel.selectedTimerPreset == 60,
              onTap: () => viewModel.setTimerPreset(60),
            ),
            TimerButton(
              label: '2min',
              seconds: 120,
              isSelected: viewModel.selectedTimerPreset == 120,
              onTap: () => viewModel.setTimerPreset(120),
            ),
            TimerButton(
              label: '4min',
              seconds: 240,
              isSelected: viewModel.selectedTimerPreset == 240,
              onTap: () => viewModel.setTimerPreset(240),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildTimerDisplay(BrewViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            viewModel.timerDisplay,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F4E37),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: viewModel.isTimerRunning 
                    ? viewModel.stopTimer 
                    : viewModel.startTimer,
                icon: Icon(
                  viewModel.isTimerRunning ? Icons.pause : Icons.play_arrow,
                  size: 32,
                ),
                color: const Color(0xFF6F4E37),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: viewModel.resetTimer,
                icon: const Icon(Icons.restart_alt, size: 32),
                color: const Color(0xFF6F4E37),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildRatioCalculator(BrewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Perfect Ratio',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C2415),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRatioItem('Coffee', '${viewModel.coffeeAmount.toInt()}g'),
                  const Icon(Icons.sync_alt, color: Color(0xFF6F4E37)),
                  _buildRatioItem('Water', '${viewModel.waterAmount.toInt()}ml'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Cups: '),
                  ...List.generate(6, (index) {
                    final cups = index + 1;
                    return GestureDetector(
                      onTap: () => viewModel.setCups(cups),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: viewModel.cups == cups 
                              ? const Color(0xFF6F4E37)
                              : Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$cups',
                          style: TextStyle(
                            color: viewModel.cups == cups 
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildRatioItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6F4E37),
          ),
        ),
      ],
    );
  }
  
  Widget _buildBrewingGuides() {
    final guides = [
      {'name': 'French Press', 'icon': Icons.coffee_maker},
      {'name': 'Pour Over', 'icon': Icons.local_cafe},
      {'name': 'AeroPress', 'icon': Icons.coffee},
      {'name': 'Espresso', 'icon': Icons.local_drink},
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Brewing Guides',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C2415),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: guides.length,
            itemBuilder: (context, index) {
              final guide = guides[index];
              return Container(
                width: 100,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      guide['icon'] as IconData,
                      size: 32,
                      color: const Color(0xFF6F4E37),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      guide['name'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  
  Widget _buildTodayChallenge() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6F4E37), Color(0xFF8B6F47)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Today\'s Challenge',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Try making a Pour Over Coffee',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}