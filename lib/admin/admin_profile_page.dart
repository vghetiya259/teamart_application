import 'package:flutter/material.dart';
import 'admin_login_page.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color backgroundColor = Color(0xFFF3DDB5);
  static const Color cardColor = Color(0xFFFFFDF8);
  static const Color primaryColor = Color(0xFF222222);
  static const Color secondaryTextColor = Color(0xFF6F665B);
  static const Color dividerColor = Color(0xFFE7D5B5);
  static const Color accentColor = Color(0xFFE96B72);
  static const Color iconBackground = Color(0xFFF8EBD3);

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController _nameController = TextEditingController(
    text: 'Sujal Desai',
  );

  final TextEditingController _emailController = TextEditingController(
    text: 'sujaldesai@example.com',
  );

  final TextEditingController _phoneController = TextEditingController(
    text: '+91 98765 43210',
  );

  final TextEditingController _roleController = TextEditingController(
    text: 'Administrator',
  );

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
            size: 19,
          ),
        ),

        title: const Text(
          'Profile',
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 30),
          child: Column(
            children: [
              _buildProfileHeader(),

              const SizedBox(height: 20),

              _buildProfileMenu(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PROFILE HEADER
  // ============================================================

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: dividerColor, width: 0.8),
      ),
      child: Column(
        children: [
          // PROFILE IMAGE
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBackground,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: iconBackground,
              child: Icon(Icons.person, size: 43, color: primaryColor),
            ),
          ),

          const SizedBox(height: 12),

          // NAME
          Text(
            _nameController.text,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 4),

          // ROLE
          Text(
            _roleController.text,
            style: const TextStyle(color: secondaryTextColor, fontSize: 11),
          ),

          const SizedBox(height: 4),

          // EMAIL
          Text(
            _emailController.text,
            style: const TextStyle(color: secondaryTextColor, fontSize: 10),
          ),

          const SizedBox(height: 15),

          // EDIT PROFILE
          SizedBox(
            height: 34,
            child: OutlinedButton.icon(
              onPressed: _showEditProfileDialog,
              icon: const Icon(Icons.edit_outlined, size: 14),
              label: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryColor,
                side: const BorderSide(color: primaryColor, width: 0.8),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROFILE MENU
  // ============================================================

  Widget _buildProfileMenu() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: dividerColor, width: 0.8),
      ),
      child: Column(
        children: [
          // PERSONAL INFORMATION
          _buildMenuItem(
            icon: Icons.person_outline,
            title: 'Personal Information',
            subtitle: 'Manage your personal details',
            onTap: _showPersonalInformationDialog,
          ),

          _buildDivider(),

          // CHANGE PASSWORD
          _buildMenuItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update your account password',
            onTap: _showChangePasswordDialog,
          ),

          _buildDivider(),

          // LOGOUT
          _buildLogoutItem(),
        ],
      ),
    );
  }

  // ============================================================
  // NORMAL MENU ITEM
  // ============================================================

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            _buildIconContainer(icon: icon),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: secondaryTextColor,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: secondaryTextColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // LOGOUT ITEM
  // ============================================================

  Widget _buildLogoutItem() {
    return InkWell(
      onTap: _showLogoutDialog,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.logout, color: accentColor, size: 19),
            ),

            const SizedBox(width: 13),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    'Sign out from your account',
                    style: TextStyle(color: accentColor, fontSize: 9),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: accentColor, size: 18),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ICON CONTAINER
  // ============================================================

  Widget _buildIconContainer({required IconData icon}) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: iconBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: primaryColor, size: 19),
    );
  }

  // ============================================================
  // DIVIDER
  // ============================================================

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 65),
      child: Divider(height: 1, thickness: 0.7, color: dividerColor),
    );
  }

  // ============================================================
  // EDIT PROFILE
  // ============================================================

  void _showEditProfileDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _dialogTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 12),

                _dialogTextField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 12),

                _dialogTextField(
                  controller: _phoneController,
                  label: 'Phone',
                  icon: Icons.phone_outlined,
                ),

                const SizedBox(height: 12),

                _dialogTextField(
                  controller: _roleController,
                  label: 'Role',
                  icon: Icons.admin_panel_settings_outlined,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: secondaryTextColor),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {});

                Navigator.pop(context);

                _showMessage('Profile updated successfully');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // PERSONAL INFORMATION
  // ============================================================

  void _showPersonalInformationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Personal Information',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _infoRow(Icons.person_outline, 'Name', _nameController.text),

              const SizedBox(height: 14),

              _infoRow(Icons.email_outlined, 'Email', _emailController.text),

              const SizedBox(height: 14),

              _infoRow(Icons.phone_outlined, 'Phone', _phoneController.text),

              const SizedBox(height: 14),

              _infoRow(
                Icons.admin_panel_settings_outlined,
                'Role',
                _roleController.text,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close', style: TextStyle(color: primaryColor)),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // CHANGE PASSWORD
  // ============================================================

  void _showChangePasswordDialog() {
    final TextEditingController passwordController = TextEditingController();

    final TextEditingController confirmPasswordController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Change Password',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: primaryColor,
                  ),
                  filled: true,
                  fillColor: iconBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: primaryColor,
                  ),
                  filled: true,
                  fillColor: iconBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: secondaryTextColor),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  _showMessage('Please enter password');
                  return;
                }

                if (passwordController.text != confirmPasswordController.text) {
                  _showMessage('Passwords do not match');
                  return;
                }

                Navigator.pop(context);

                _showMessage('Password changed successfully');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // LOGOUT DIALOG
  // ============================================================

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
          ),
          content: const Text(
            'Are you sure you want to logout from your account?',
            style: TextStyle(color: secondaryTextColor, fontSize: 13),
          ),
          actions: [
            // CANCEL
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: secondaryTextColor),
              ),
            ),

            // LOGOUT
            ElevatedButton(
              onPressed: () {
                // Close logout dialog
                Navigator.pop(context);

                // Redirect to Admin Login
                // and remove all previous pages
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminLoginPage(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DIALOG TEXT FIELD
  // ============================================================

  Widget _dialogTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryColor, size: 20),
        filled: true,
        fillColor: iconBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColor, width: 1),
        ),
      ),
    );
  }

  // ============================================================
  // INFO ROW
  // ============================================================

  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: primaryColor, size: 18),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: secondaryTextColor, fontSize: 9),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SNACKBAR
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
