part of '../dua_screen.dart';

class _DuasListView extends StatelessWidget {
  const _DuasListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colorsX.secondaryBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<DuaBloc, DuaState>(
            builder: (context, state) => switch (state.status) {
              Loading() => const Center(child: CircularProgressIndicator()),
              _ => state.duas.result.isEmpty
                  ? Center(child: Text(context.l10n.noDua, style: context.textThemeX.medium.bold))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Text(
                            '${context.l10n.dua.toUpperCase()} '
                            '(${state.duas.result.length})',
                            style: context.textThemeX.small.bold.copyWith(
                              color: context.colorsX.onBackgroundTint.withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _DuaWithNumWidget(
                              label: state.duas.result[index].text,
                              labelIndex: index,
                            );
                          },
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
                          itemCount: state.duas.result.length,
                        ),
                      ],
                    ),
            },
          ),
        ],
      ),
    );
  }
}
