import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/Utils/constants.dart';

class UserInfoItems extends StatelessWidget {
  const UserInfoItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('Edit Account'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen())),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person_pin_circle_rounded,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('Saved Addresses'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => AddressesScreen()));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('Favorites'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => WishlistScreen(
              //   isHome: false,
              // ))),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.inventory_rounded,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('My Orders'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrdersScreen())),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
