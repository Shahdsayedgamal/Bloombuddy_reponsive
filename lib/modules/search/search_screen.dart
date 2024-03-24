import 'package:bloom_buddy/shared/shared.components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value){

                },
                label: 'search',
                prefix: Icons.search,
                suffix: Icons.clear,
                suffixPressed: (){},
                validator: (value)
                {
                  if(value.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                  return null;
                },
                isPassword: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Search'
                ),),

          ),

        ],
      ) ,
    );
  }
}