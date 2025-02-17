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
            onTap: () => context.pushNamed(AddOrEditAzkarScreen.name, extra: azkar.id),
          ),
          Gap(8.w),
          ActionButton(
            icon: FontAwesomeIcons.trash,
            color: context.colorsX.error,
            onTap: () => _showDeleteDialog(context, context.read<AzkarBloc>()),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.w),
          onTap: () => context.pushNamed(AzkarDetailsScreen.name, extra: azkar),
          child: Container(
            padding: EdgeInsets.all(4.sp),
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
                      Gap(5.w),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, AzkarBloc azkarBloc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: context.colorsX.background,
        title: Center(
          child: Text(
            context.l10n.areYouSure,
            style: context.textThemeX.large,
          ),
        ),
        alignment: Alignment.center,
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              context.l10n.cancel.capitalized,
              style: context.textThemeX.medium.copyWith(color: context.colorsX.error),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              azkarBloc.add(AzkarDeleted(azkar.id!));
            },
            child: Text(
              context.l10n.confirm.capitalized,
              style: context.textThemeX.medium.copyWith(color: context.colorsX.primary),
            ),
          ),
        ],
      ),
    );
  }
}
