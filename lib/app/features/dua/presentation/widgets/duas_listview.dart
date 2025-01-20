part of '../dua_screen.dart';

class _DuasListView extends StatelessWidget {
  const _DuasListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DuaBloc, DuaScreenState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >= (notification.metrics.maxScrollExtent * .7)) {
              context.read<DuaBloc>().add(DuaNextPageFetched());
            }
            return true;
          },
          child: switch (state.status) {
            Loading() => const Center(child: CircularProgressIndicator()),
            _ => state.duas.result.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Center(
                        child: Text(context.l10n.noDua, style: context.textThemeX.medium.bold)),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.duas.result.length,
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => _DuaWithNumWidget(
                      dua: state.duas.result[i],
                    ),
                  ),
          },
        );
      },
    );
  }
}
