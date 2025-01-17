// ignore_for_file: inference_failure_on_function_invocation

part of '../dua_screen.dart';

class _DuaWithNumWidget extends StatelessWidget {
  const _DuaWithNumWidget({required this.dua});

  final Dua dua;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('onDismissibleDua'),
      onDismissed: (v) {},
      child: InkWell(
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
                  GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: context.colorsX.background,
                              title: Text(
                                context.l10n.areYouSure,
                                textAlign: TextAlign.center,
                                style: context.textThemeX.medium.copyWith(
                                  color: context.colorsX.onBackground,
                                ),
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              contentPadding: EdgeInsets.all(8.w),
                              actions: [
                                TextButton(
                                  child: Text(
                                    context.l10n.cancel,
                                    style: context.textThemeX.medium.copyWith(
                                      color: context.colorsX.onBackground,
                                    ),
                                  ),
                                  onPressed: () => context.pop(),
                                ),
                                TextButton(
                                  child: Text(
                                    context.l10n.ok,
                                    style: context.textThemeX.medium.copyWith(
                                      color: context.colorsX.error,
                                    ),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.delete_rounded)),
                  Gap(10.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
