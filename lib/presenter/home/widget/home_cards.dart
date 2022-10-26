import 'package:doginfo/domain/ui/dog_info_icons.dart';
import 'package:doginfo/presenter/bloc/bloc/dogs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({Key? key}) : super(key: key);

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  late final DogsBloc dogsBloc;

  @override
  void initState() {
    super.initState();
    dogsBloc = GetIt.I.get<DogsBloc>();

    dogsBloc.add(OnGetDogs());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 305,
        width: 170,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.AE3sD8qMOmONNjEvpR5K9QHaJ6?pid=ImgDet&rs=1',
                      height: 190,
                      width: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nome Dog',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Text(
                  'Raça dog',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 65,
              right: -4,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 40,
                  child: IconButton(
                    iconSize: 18,
                    icon: const Icon(
                      DogInfo.heart,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
