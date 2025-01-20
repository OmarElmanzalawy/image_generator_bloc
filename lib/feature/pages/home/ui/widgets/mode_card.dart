import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/pages/home/ui/widgets/icon_circle.dart';
import 'package:image_generator_bloc/feature/widgets/frosted.dart';

class ModeCard extends StatelessWidget {
  const ModeCard({super.key, required this.name, required this.icon, this.routePath, this.width});
  final String name;
  final IconData icon;
  final String? routePath;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO NAVIGATE TO ROUTE PATH
        if(routePath != null){
          Navigator.pushNamed(context, routePath!);
        }
      },
      child: Frosted(
        child: Container(
          constraints: BoxConstraints(minHeight: 120),
          width: width ?? 170,
          // height: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).colorScheme.primary.withOpacity(0.3),Theme.of(context).colorScheme.primary.withOpacity(0.3)]
              ),
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           IconCircle(icon: icon),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name),
                  
                  Icon(Icons.east,color: Colors.white70,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}