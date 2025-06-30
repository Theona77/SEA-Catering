import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:sea_catering/utils/validators/validation.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({Key? key}) : super(key: key);

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _allergyController = TextEditingController();

  bool _isSubmitting = false;
  String? _plan;
  List<String> _mealTypes = [];
  List<String> _deliveryDays = [];
  double _totalPrice = 0;

  final Map<String, int> _planPrices = {
    'Diet Plan': 30000,
    'Protein Plan': 40000,
    'Royal Plan': 60000,
  };

  final List<String> _mealOptions = ['Breakfast', 'Lunch', 'Dinner'];
  final List<String> _weekDays = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  void _calculatePrice() {
    if (_plan == null || _mealTypes.isEmpty || _deliveryDays.isEmpty) {
      setState(() => _totalPrice = 0);
      return;
    }
    final planPrice = _planPrices[_plan!]!;
    setState(() {
      _totalPrice = planPrice * _mealTypes.length * _deliveryDays.length * 4.3;
    });
  }

  void _submitForm() async {
    if (_isSubmitting) return;
    print('Current UID: ${FirebaseAuth.instance.currentUser?.uid}'); // ✅ Add here for debugging


    if (_formKey.currentState?.validate() != true) return;

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final allergies = _allergyController.text.trim();

    if (name.isEmpty) {
      Get.snackbar('Missing Name', 'Please fill in your full name.');
      return;
    }
    if (phone.isEmpty) {
      Get.snackbar('Missing Phone Number', 'Please fill in your active phone number.');
      return;
    }
    if (_plan == null || _mealTypes.isEmpty || _deliveryDays.isEmpty) {
      Get.snackbar('Missing Selections', 'Select a plan, meal types, and delivery days.');
      return;
    }

    _calculatePrice();
    setState(() => _isSubmitting = true);

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        Get.snackbar('Error', 'You must be logged in to submit.');
        return;
      }

      await FirebaseFirestore.instance.collection('subscriptions').add({
        'user_id': userId,
        'name': name,
        'phone': phone,
        'plan': _plan,
        'mealTypes': _mealTypes,
        'deliveryDays': _deliveryDays,
        'allergies': allergies,
        'totalPrice': _totalPrice,
        'status': 'Active',
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.snackbar('Success', 'Subscription submitted successfully');
      _formKey.currentState?.reset();
      _nameController.clear();
      _phoneController.clear();
      _allergyController.clear();
      setState(() {
        _mealTypes.clear();
        _deliveryDays.clear();
        _plan = null;
        _totalPrice = 0;
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit: $e');
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _allergyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Plan Subscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => TValidator.validateEmptyText('Full name', value),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Active Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => TValidator.validatePhoneNumber(value),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const Text('Select Plan'),
              ..._planPrices.keys.map((plan) => RadioListTile(
                title: Text('$plan (Rp${_planPrices[plan]})'),
                value: plan,
                groupValue: _plan,
                onChanged: (value) => setState(() {
                  _plan = value as String;
                  _calculatePrice();
                }),
              )),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const Text('Select Meal Types (at least one)'),
              ..._mealOptions.map((meal) => CheckboxListTile(
                title: Text(meal),
                value: _mealTypes.contains(meal),
                onChanged: (value) => setState(() {
                  if (value!) {
                    _mealTypes.add(meal);
                  } else {
                    _mealTypes.remove(meal);
                  }
                  _calculatePrice();
                }),
              )),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const Text('Select Delivery Days'),
              ..._weekDays.map((day) => CheckboxListTile(
                title: Text(day),
                value: _deliveryDays.contains(day),
                onChanged: (value) => setState(() {
                  if (value!) {
                    _deliveryDays.add(day);
                  } else {
                    _deliveryDays.remove(day);
                  }
                  _calculatePrice();
                }),
              )),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _allergyController,
                decoration: const InputDecoration(labelText: 'Allergies (optional)'),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Text('Total Price: Rp${_totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                child: _isSubmitting
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}