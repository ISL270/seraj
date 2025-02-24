part of '../azkar_screen.dart';

class _AzkarListViewBuilder extends StatelessWidget {
  const _AzkarListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarBloc, AzkarState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >= notification.metrics.maxScrollExtent * 0.7) {
              context.read<AzkarBloc>().add(AzkarNextPageFetched());
            }
            return true;
          },
          child: state.azkars.elements.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: Text(context.l10n.noAzkars, style: context.textThemeX.medium.bold),
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: Divider(height: 1.h, color: context.colorsX.onBackground),
                    );
                  },
                  itemBuilder: (context, index) =>
                      _AzkarWidget(azkar: state.azkars.elements[index]),
                  itemCount: state.azkars.elements.length,
                ),
        );
      },
    );
  }
}
