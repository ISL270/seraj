// ignore_for_file: inference_failure_on_function_invocation

part of '../dua_screen.dart';

class _DuaWidget extends StatelessWidget {
  const _DuaWidget({required this.dua});

  final Dua dua;

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
            onTap: () => _navigateToEditScreen(context),
          ),
          Gap(8.w),
          ActionButton(
            icon: FontAwesomeIcons.trash,
            color: context.colorsX.error,
            onTap: () => _showDeleteDialog(context, context.read<DuaBloc>()),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.w),
          onTap: () => context.pushNamed(DuaDetailsScreen.name, extra: dua),
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
                          dua.text,
                          style: context.textThemeX.large.copyWith(
                              fontFamily: GoogleFonts.amiriQuran().fontFamily),
                        ),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read<DuaBloc>()
                            .add(DuaFavouriteToggled(dua)),
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: Icon(
                            dua.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            key: ValueKey<bool>(dua.isFavourite),
                            color: dua.isFavourite
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

  void _navigateToEditScreen(BuildContext context) {
    context.pushNamed(AddOrEditDuaScreen.name, extra: dua.id);
  }

  void _showDeleteDialog(BuildContext context, DuaBloc duaBloc) {
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
              style: context.textThemeX.medium
                  .copyWith(color: context.colorsX.error),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              duaBloc.deleteDua(dua.id);
            },
            child: Text(
              context.l10n.confirm.capitalized,
              style: context.textThemeX.medium
                  .copyWith(color: context.colorsX.primary),
            ),
          ),
        ],
      ),
    );
  }
}
