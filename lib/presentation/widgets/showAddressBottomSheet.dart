import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

void showAddressBottomSheet(BuildContext context) {
  final List<Map<String, dynamic>> addressList = [
    {
      'title': 'Home',
      'userName': 'John Doe', // Added user name
      'address': '123 Street, City, Country',
      'phone': '+123456789',
      'isPrimary': true,
      'type': 'Home', // Address type (Home/Office)
    },
    {
      'title': 'Office',
      'userName': 'John Doe', // Keeping the same user name for consistency
      'address': '456 Avenue, City, Country',
      'phone': '+987654321',
      'isPrimary': false,
      'type': 'Office', // Address type
    },
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.7, // Limits bottom sheet height to 50% of screen
        child: StatefulBuilder(
          // Allows bottom sheet to update selected address
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: addressList.length,
                      itemBuilder: (context, index) {
                        final address = addressList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              for (var addr in addressList) {
                                addr['isPrimary'] = false;
                              }
                              address['isPrimary'] = true; // Update selection
                            });
                          },
                          child: _buildAddressCard(
                            userName:
                                address['userName'], // Extract from address map
                            title: address['title'],
                            address: address['address'],
                            phone: address['phone'],
                            isPrimary: address['isPrimary'],
                            type: address['type'], // Fetching type dynamically
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContinueButton(context),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildHeader(BuildContext context) { // Pass context as a parameter
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Where to Deliver',
            style: AppFonts.body.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 4),
          Text(
            'Choose your preferred \nshipping address',
            style: AppFonts.body.copyWith(color: AppColors.secondary),
          ),
          const SizedBox(height: 12),
        ],
      ),
      ElevatedButton.icon(
        onPressed: () {
          showAddAddressBottomSheet(context); // ✅ Pass context correctly
        },
        icon: const Icon(Icons.add, color: AppColors.primary),
        label: Text(
          'New Address',
          style: AppFonts.button.copyWith(color: AppColors.primary),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary.withOpacity(0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ],
  );
}


Widget _buildAddressCard({
  required String title,
  required String userName,
  required String address,
  required String phone,
  required bool isPrimary,
  required String type,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: isPrimary ? AppColors.primary : Colors.transparent,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 4,
          spreadRadius: 1,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home/Office Icon in Circular Avatar
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.secondary,
                  radius: 16, // Smaller size
                  child: Icon(Icons.home, color: AppColors.primary, size: 18),
                ),
                const SizedBox(width: 6),
                Text(title, style: AppFonts.bold.copyWith(fontSize: 14)),
              ],
            ),
            // GPS Icon and Address Type
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: AppColors.white, size: 14),
                  const SizedBox(width: 3),
                  Text(type,
                      style: AppFonts.button
                          .copyWith(color: AppColors.white, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(color: Colors.black, thickness: 0.5),

        // User Name & Address
        const SizedBox(height: 6),
        Text(userName, style: AppFonts.bold.copyWith(fontSize: 14)),
        const SizedBox(height: 3),
        Text(address,
            style:
                AppFonts.body.copyWith(color: Colors.grey, fontSize: 13)),

        const SizedBox(height: 10),

        // Footer Section (Phone Number & Buttons)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Phone Number in Border Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(phone,
                  style: AppFonts.body
                      .copyWith(color: AppColors.primary, fontSize: 13)),
            ),

            // Edit & Delete Buttons
            Row(
              children: [
                _actionButton('Edit', AppColors.secondary.withOpacity(0.2),
                    AppColors.black),
                const SizedBox(width: 6),
                _actionButton('Delete', AppColors.secondary.withOpacity(0.2),
                    AppColors.black),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _actionButton(String text, Color bgColor, Color textColor) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    child: Text(text, style: AppFonts.button.copyWith(color: textColor)),
  );
}

Widget _buildContinueButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Continue', style: AppFonts.button),
    ),
  );
}
void showAddAddressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white, // ✅ White background
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.7, // ✅ Adjusted to 60% of the screen height
        child: Container(
          color: Colors.white, // ✅ Ensure background is white
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Shipping Address',
                  style: AppFonts.heading.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 10),

                _buildTextField('Shipping to', 'Home'),
                _buildTextField('First Name', 'Peter'),
                _buildTextField('Last Name', 'Anderson'),
                _buildTextField('Country', 'United States'),
                _buildTextField('Address', 'Street Address'),
                _buildTextField('City', ''),
                
                Row(
                  children: [
                    Expanded(child: _buildTextField('State/Region', '')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTextField('Postal Code', '')),
                  ],
                ),

                _buildTextField('Phone Number', ''),
                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // ✅ Primary color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    minimumSize: const Size(double.infinity, 44), // ✅ Reduced button size
                  ),
                  child: Text(
                    'Save',
                    style: AppFonts.button.copyWith(color: AppColors.white),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildTextField(String label, String placeholder) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2), // Reduced vertical padding
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.body.copyWith(fontWeight: FontWeight.w500, fontSize: 14), // Smaller font size
        ),
        const SizedBox(height: 2),
        TextFormField(
          initialValue: placeholder,
          style: const TextStyle(fontSize: 14), // Smaller input text
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4), // Slightly smaller radius
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Reduced padding
          ),
        ),
      ],
    ),
  );
}
