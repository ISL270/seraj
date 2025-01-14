// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation

part of '../daleel_screen.dart';

class _DaleelListViewBuilder extends StatelessWidget {
  const _DaleelListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaleelBloc, DaleelState>(
      builder: (context, state) {
        return switch (state.status) {
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
                        thickness: 0.5,
                        color: context.colorsX.onBackgroundTint35.withValues(alpha: 0.1),
                      ),
                    );
                  },
                  itemCount: state.daleels.result.length,
                  shrinkWrap: true,
                ),
        };
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
            child: Icon(FontAwesomeIcons.edit, color: context.colorsX.onBackground, size: 24.r),
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
              child: Icon(FontAwesomeIcons.trash, color: context.colorsX.onBackground, size: 24.r),
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
                height: 170.h,
                decoration: BoxDecoration(
                  color: context.colorsX.primary,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        daleel.id,
                        style: context.textThemeX.large.bold,
                      ),
                      Gap(15.h),
                      Row(
                        children: [
                          Gap(5.w),
                          Expanded(
                            child: Text(
                              daleel.text,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text('${context.l10n.priority}:', style: context.textThemeX.medium.bold),
                          Gap(4.w),
                          Text(daleel.priority.toTranslate(context),
                              style: context.textThemeX.medium.bold),
                          const Spacer(),
                          Text(
                            daleel.lastRevisedAt.formatted,
                            style: context.textThemeX.small.bold.copyWith(
                              color: context.colorsX.onBackgroundTint35,
                            ),
                          ),
                          Gap(6.w),
                        ],
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
