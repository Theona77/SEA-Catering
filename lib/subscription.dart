import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({Key? key}) : super(key: key);

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _phone;
  String? _plan;
  List<String> _mealTypes = [];
  List<String> _deliveryDays = [];
  String? _allergies;
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
    int planPrice = _planPrices[_plan!]!;
    int mealCount = _mealTypes.length;
    int dayCount = _deliveryDays.length;

    setState(() {
      _totalPrice = planPrice * mealCount * dayCount * 4.3;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _mealTypes.isNotEmpty && _deliveryDays.isNotEmpty) {
      _formKey.currentState!.save();
      _calculatePrice();
      // Submit to backend here
      Get.snackbar('Success', 'Subscription submitted successfully');
    } else {
      Get.snackbar('Error', 'Please complete all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Plan Subscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _name = value,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Active Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _phone = value,
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
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Allergies (optional)'),
                onSaved: (value) => _allergies = value,
              ),
              const SizedBox(height: 16),
              Text('Total Price: Rp${_totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
