import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflixapp/presentation/fastLaugh/widget/listofvediolaughloud.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initilized());
    });

    return SafeArea(
      child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Text("no connection");
          } else if (state.fastLaughImage.isEmpty) {
            return const Text("data not available");
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.fastLaughImage.length,
                  (index) => listOfVedioLaughLoudIherited(
                        widget: listOfVedioLaughLoud(index: index),
                        movieData: state.fastLaughImage[index],
                      )),
            );
          }
        },
      ),
    );
  }
}
