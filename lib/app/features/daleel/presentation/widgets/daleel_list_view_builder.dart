// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation

part of '../daleel_screen.dart';

class _DaleelListViewBuilder extends StatelessWidget {
  const _DaleelListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaleelBloc, DaleelState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >= notification.metrics.maxScrollExtent * 0.7) {
              context.read<DaleelBloc>().add(DaleelNextPageFetched());
            }
            return true;
          },
          child: switch (state.status) {
            Loading() => const Center(child: CircularProgressIndicator()),
            _ => state.daleels.result.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 210.h),
                      Center(
                        child: Text(
                          context.l10n.noResult,
                          style: context.textThemeX.large.bold
                              .copyWith(color: context.colorsX.onBackgroundTint35),
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) => _DaleelWidget(daleel: state.daleels.result[i]),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                        child: Divider(
                          height: 1,
                          color: context.colorsX.onBackground,
                        ),
                      );
                    },
                    itemCount: state.daleels.result.length,
                    shrinkWrap: true,
                  ),
          },
        );
      },
    );
  }
}

class _DaleelWidget extends StatelessWidget {
  const _DaleelWidget({required this.daleel});

  final Daleel daleel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3.w,
        children: [
          CircleAvatar(
            backgroundColor: context.colorsX.primary,
            radius: 24.r,
            child: Icon(FontAwesomeIcons.edit, color: context.colorsX.background, size: 24.r),
          ),
          Gap(8.w),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.all(16.sp),
                  buttonPadding: EdgeInsets.all(16.sp),
                  titlePadding: EdgeInsets.all(16.sp),
                  actionsPadding: EdgeInsets.all(16.sp),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  backgroundColor: context.colorsX.background,
                  title: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Center(
                      child: Text(
                        context.l10n.areYouSure.capitalized,
                        style: context.textThemeX.large.bold.copyWith(
                          color: context.colorsX.primary,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.l10n.cancel.capitalized,
                          style: context.textThemeX.large.bold),
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.l10n.ok.capitalized,
                          style:
                              context.textThemeX.large.bold.copyWith(color: context.colorsX.error)),
                    ),
                  ],
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: context.colorsX.error,
              radius: 24.r,
              child: Icon(FontAwesomeIcons.trash, color: context.colorsX.background, size: 24.r),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4.sp),
                height: daleel.text.length >= 120
                    ? 170.h + daleel.text.length * 0.15.h
                    : 140.h + daleel.text.length * 0.25.h,
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
                              daleel.text,
                              style: context.textThemeX.large
                                  .copyWith(fontFamily: GoogleFonts.amiriQuran().fontFamily),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.sp),
                        child: Row(
                          children: [
                            Text(
                              switch (daleel) {
                                Hadith() => context.l10n.propheticHadith,
                                Athar() => context.l10n.athar,
                                Others() => context.l10n.other,
                              },
                              style: context.textThemeX.small.bold
                                  .copyWith(color: context.colorsX.primary),
                            ),
                            const Spacer(),
                            Text(
                              daleel.lastRevisedAt.formatted,
                              style: context.textThemeX.small.bold
                                  .copyWith(color: context.colorsX.primary),
                            ),
                          ],
                        ),
                      ),
                      Gap(6.h),
                    ],
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
