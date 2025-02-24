part of '../dua_screen.dart';

class _DuasListView extends StatelessWidget {
  const _DuasListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DuaBloc, DuaState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >=
                (notification.metrics.maxScrollExtent * .7)) {
              context.read<DuaBloc>().add(DuaNextPageFetched());
            }
            return true;
          },
          child: state.result.elements.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                      child: Text(context.l10n.noDua,
                          style: context.textThemeX.medium.bold)),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.result.elements.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: Divider(
                          height: 1.h, color: context.colorsX.onBackground),
                    );
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => _DuaWidget(
                    dua: state.result.elements[i],
                  ),
                ),
        );
      },
    );
  }
}
