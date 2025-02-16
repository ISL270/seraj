// ignore_for_file: inference_failure_on_function_invocation

part of '../azkar_screen.dart';

class _AzkarWidget extends StatelessWidget {
  const _AzkarWidget({required this.azkar});

  final Azkar azkar;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3.w,
        children: [
          ActionButton(
            icon: FontAwesomeIcons.penToSquare,
            color: context.colorsX.primary,
            onTap: () => context.pushNamed(AddAzkarScreen.name, extra: azkar.id),
          ),
          Gap(8.w),
          ActionButton(
            icon: FontAwesomeIcons.trash,
            color: context.colorsX.error,
            onTap: () => context.read<AzkarBloc>().add(AzkarDeleted(azkar.id!)),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.w),
        onTap: () => context.pushNamed(AzkarDetailsScreen.name, extra: azkar),
        child: Container(
          padding: EdgeInsets.all(4.sp),
          margin: EdgeInsets.all(16.sp),
          child: Padding(
            padding: EdgeInsets.all(6.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Gap(5.w),
                    Expanded(
                      child: Text(
                        azkar.text,
                        style: context.textThemeX.large
                            .copyWith(fontFamily: GoogleFonts.amiriQuran().fontFamily),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => context.read<AzkarBloc>().add(AzkarFavourited(azkar)),
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                        child: Icon(
                          azkar.isFavourite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey<bool>(azkar.isFavourite),
                          color: azkar.isFavourite
                              ? context.colorsX.error
                              : context.colorsX.onBackground,
                        ),
                      ),
                    ),
                    Gap(15.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
