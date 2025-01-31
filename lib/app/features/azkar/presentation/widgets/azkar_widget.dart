// ignore_for_file: inference_failure_on_function_invocation

part of '../azkar_screen.dart';

class _AzkarWidget extends StatelessWidget {
  const _AzkarWidget({required this.azkar});

  final Azkar azkar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.w),
        onTap: () => context.pushNamed(AzkarDetailsScreen.name, extra: azkar),
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
                        azkar.text,
                        style: context.textThemeX.large
                            .copyWith(fontFamily: GoogleFonts.amiriQuran().fontFamily),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
