import 'package:flutter/material.dart';
import 'package:my_ecommerce/Primary/data/models/category.dart';
import 'package:my_ecommerce/Utils/constants.dart';

class CategoryFilterTile extends StatelessWidget {
  final Category category;
  final Function(bool value) onCheck;
  final bool value;
  const CategoryFilterTile({
    super.key,
    required this.category,
    required this.onCheck,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(category.name),
      secondary: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: FadeInImage.assetNetwork(
          image: category.imgUrl,
          height: 80,
          width: 80,
          placeholder: Images.PLACEHOLDER,
        ),
      ),
      value: value,
      activeColor: AppColors.PRIMARY_COLOR,
      onChanged: (value) => onCheck(value ?? false),
    );
  }
}
