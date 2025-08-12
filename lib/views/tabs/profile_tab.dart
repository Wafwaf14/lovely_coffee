// lib/views/tabs/profile_tab.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../widgets/stat_card.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildUserCard(viewModel),
              const SizedBox(height: 20),
              _buildStatsGrid(viewModel),
              const SizedBox(height: 20),
              _buildAchievements(viewModel),
              const SizedBox(height: 20),
              _buildSettingsMenu(context, viewModel),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildUserCard(ProfileViewModel viewModel) {
    return Container(
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFF6F4E37),
            child: const Icon(Icons.person, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2415),
                  ),
                ),
                Text(
                  viewModel.userLevel,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xFFFFB800),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${viewModel.userPoints} points',
                      style: const TextStyle(
                        color: Color(0xFF6F4E37),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Color(0xFF6F4E37)),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatsGrid(ProfileViewModel viewModel) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.5,
      children: [
        StatCard(
          title: 'Coffees Tried',
          value: '${viewModel.coffeeTried}',
          icon: Icons.coffee,
        ),
        StatCard(
          title: 'Favorite',
          value: viewModel.favoriteCoffee,
          icon: Icons.favorite,
        ),
        StatCard(
          title: 'Streak',
          value: '${viewModel.streak} days',
          icon: Icons.local_fire_department,
        ),
        StatCard(
          title: 'Total Brews',
          value: '${viewModel.totalBrewed}',
          icon: Icons.water_drop,
        ),
      ],
    );
  }
  
  Widget _buildAchievements(ProfileViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C2415),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.achievements.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6F4E37),
                      const Color(0xFF6F4E37).withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      viewModel.achievements[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
  
  Widget _buildSettingsMenu(BuildContext context, ProfileViewModel viewModel) {
    return Container(
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
          _buildSettingItem(
            icon: Icons.language,
            title: 'Language',
            subtitle: viewModel.selectedLanguage,
            onTap: () => _showLanguageDialog(context, viewModel),
          ),
          _buildSettingItem(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            trailing: Switch(
              value: viewModel.isDarkMode,
              onChanged: (_) => viewModel.toggleDarkMode(),
              activeColor: const Color(0xFF6F4E37),
            ),
            onTap: () => viewModel.toggleDarkMode(),
          ),
          _buildSettingItem(
            icon: Icons.notifications,
            title: 'Notifications',
            trailing: Switch(
              value: viewModel.notificationsEnabled,
              onChanged: (_) => viewModel.toggleNotifications(),
              activeColor: const Color(0xFF6F4E37),
            ),
            onTap: () => viewModel.toggleNotifications(),
          ),
          _buildSettingItem(
            icon: Icons.straighten,
            title: 'Units',
            subtitle: 'Metric',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.info,
            title: 'About',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }
  
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: const Color(0xFF6F4E37)),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }
  
  void _showLanguageDialog(BuildContext context, ProfileViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'English',
            'Arabic',
            'French',
          ].map((language) => ListTile(
            title: Text(language),
            leading: Radio<String>(
              value: language,
              groupValue: viewModel.selectedLanguage,
              onChanged: (value) {
                viewModel.setLanguage(value!);
                Navigator.pop(context);
              },
              activeColor: const Color(0xFF6F4E37),
            ),
            onTap: () {
              viewModel.setLanguage(language);
              Navigator.pop(context);
            },
          )).toList(),
        ),
      ),
    );
  }
}