import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String routeName='/search';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: LatLng(41.3775,64.5853),
        
      ),),
    );
  }
}
