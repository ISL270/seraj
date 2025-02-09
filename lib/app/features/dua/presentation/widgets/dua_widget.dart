// ignore_for_file: inference_failure_on_function_invocation

part of '../dua_screen.dart';

class _DuaWithNumWidget extends StatelessWidget {
  const _DuaWithNumWidget({required this.dua});

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
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => context.pushNamed(DuaDetailsScreen.name, extra: dua),
        child: Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: context.colorsX.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5.sp,
                spreadRadius: 0.2.sp,
                blurStyle: BlurStyle.outer,
                color: context.colorsX.onBackgroundTint35,
              ),
              BoxShadow(
                blurRadius: 0.7.sp,
                spreadRadius: 0.5.sp,
                blurStyle: BlurStyle.outer,
                color: context.colorsX.onBackgroundTint35,
              ),
              BoxShadow(
                blurRadius: 2.sp,
                spreadRadius: 0.9.sp,
                blurStyle: BlurStyle.outer,
                color: context.colorsX.onBackgroundTint35,
              ),
            ],
          ),
          child: SizedBox(
            height: 80.h + (dua.text.length * 0.45).h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Gap(5.w),
                  Expanded(
                    child: Text(
                      dua.text,
                      style: context.textThemeX.medium.bold,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gap(5.w),
                  IconButton(
                    onPressed: () {},
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        dua.isFavourite ? Icons.favorite : Icons.favorite_border,
                        key: ValueKey<bool>(dua.isFavourite),
                        color:
                            dua.isFavourite ? context.colorsX.error : context.colorsX.onBackground,
                      ),
                    ),
                  ),
                  Gap(15.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context) {
    context.pushNamed(AddDuaScreen.name, extra: dua.id);
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
              style: context.textThemeX.medium.copyWith(color: context.colorsX.error),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              duaBloc.deleteDua(dua.id);
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
