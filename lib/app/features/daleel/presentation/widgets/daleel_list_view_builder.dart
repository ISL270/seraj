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
            _ => state.daleels.elements.isEmpty
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
                    itemBuilder: (context, i) => _DaleelWidget(daleel: state.daleels.elements[i]),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                        child: Divider(height: 1.h, color: context.colorsX.onBackground),
                      );
                    },
                    itemCount: state.daleels.elements.length,
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
          _ActionButton(
            icon: FontAwesomeIcons.edit,
            color: context.colorsX.primary,
            onTap: () => _navigateToEditScreen(context),
          ),
          Gap(8.w),
          _ActionButton(
            icon: FontAwesomeIcons.trash,
            color: context.colorsX.error,
            onTap: () => _showDeleteDialog(context),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        child: _DaleelCard(daleel: daleel),
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context) {
    final routeName = switch (daleel) {
      Hadith() => AddOrEditHadith.name,
      Athar() => AddOrEditAtharScreen.name,
      Other() => AddOrEditOther.name,
      Aya() => AddNewAyah.name,
    };

    context.pushNamed(routeName, extra: daleel.id);
  }

  void _showDeleteDialog(BuildContext context) {
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
          _DialogButton(
            label: context.l10n.cancel.capitalized,
            onPressed: () => context.pop(),
          ),
          _DialogButton(
            label: context.l10n.ok.capitalized,
            onPressed: () {
              context.pop();
              context.read<DaleelBloc>().delete(id: daleel.id);
            },
            color: context.colorsX.error,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20.r,
        child: Icon(icon, color: context.colorsX.background, size: 18.r),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.onPressed,
    this.color,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textThemeX.medium.copyWith(color: color),
      ),
    );
  }
}

class _DaleelCard extends StatelessWidget {
  const _DaleelCard({required this.daleel});

  final Daleel daleel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () => context.pushNamed(DaleelDetailsScreen.name, extra: daleel),
      child: Container(
        padding: EdgeInsets.all(4.sp),
        child: Padding(
          padding: EdgeInsets.all(6.sp),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Gap(5.w),
                    Expanded(
                      child: Text(
                        daleel.text,
                        style: context.textThemeX.large.copyWith(
                          fontFamily: GoogleFonts.amiriQuran().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                _DaleelFooter(daleel: daleel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DaleelFooter extends StatelessWidget {
  const _DaleelFooter({required this.daleel});

  final Daleel daleel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sp),
      child: Row(
        children: [
          Text(
            switch (daleel) {
              Hadith() => context.l10n.propheticHadith,
              Athar() => context.l10n.athar,
              Other() => context.l10n.other,
              Aya() => context.l10n.aya,
            },
            style: context.textThemeX.small.bold.copyWith(
              color: context.colorsX.primary,
            ),
          ),
          const Spacer(),
          Text(
            daleel.lastRevisedAt.formatted,
            style: context.textThemeX.small.bold.copyWith(
              color: context.colorsX.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class CancelFilterButton extends StatelessWidget {
  const CancelFilterButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: context.colorsX.primary,
        radius: 8.r,
        child: Icon(
          Icons.cancel,
          color: context.colorsX.onBackground,
          size: 12.r,
        ),
      ),
    );
  }
}
