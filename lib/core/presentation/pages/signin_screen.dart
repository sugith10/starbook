import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_util_hub/core/presentation/navigation/route_names.dart';
import 'package:flutter_util_hub/core/presentation/utils/constants.dart';
import 'package:flutter_util_hub/core/presentation/utils/message_generator.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';
import 'package:flutter_util_hub/core/presentation/utils/widget_helper.dart';
import 'package:flutter_util_hub/core/presentation/widgets/web_optimised_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/authentication_bloc.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/submit_button.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _phoneNumCntrlr = TextEditingController();

  final AuthenticationBloc _authBloc = AuthenticationBloc();
  ProgressDialog? pr;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumCntrlr.dispose();

    super.dispose();
  }

  void submitCredentials() {
    _authBloc.add(AuthSignInEvent(phoneNumber: _phoneNumCntrlr.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _authBloc,
      listener: (ctx, state) {
        appLogger.i(state);

        if (pr?.isShowing() ?? false) {
          pr?.hide();
        }
        if (state is LoadingState) {
          pr = ProgressDialog(
            context,
            type: ProgressDialogType.normal,
            isDismissible: false,
          );
          pr?.style(
            backgroundColor: appColors.screenBg,
            padding: WebOptimisedWidget.getWebOptimisedHorizonatalPadding(),
            message: state.loadingInfo.message,
            widgetAboveTheDialog: Text(
              state.loadingInfo.title,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            progressWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoadingIndicator(
                indicatorType: Indicator.lineScalePulseOutRapid,
                colors: appColors.rainbowColors,
                strokeWidth: 2,
                backgroundColor: appColors.screenBg,
                pathBackgroundColor: appColors.screenBg,
              ),
            ),
            progressTextStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w400),
            messageTextStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          );
          pr?.show();
        } else if (state is AuthErrorState) {
          showSingleButtonAlertDialog(
              context: context, title: state.title, message: state.message);
        } else if (state is AuthSignedInState) {
          context.go("/home");
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: _authBloc,
          builder: (ctx, state) {
            return Scaffold(
              body: CustomScrollView(slivers: [
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: maxScreenWidth,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                            minHeight: MediaQuery.of(context).size.height),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Spacer(flex: 1),
                            WelcomeText(
                              text: MessageGenerator.getMessage("auth-welcome"),
                            ),
                            SizedBox(height: 5.h),
                            WelcomeMsgText(
                              text: MessageGenerator.getMessage(
                                  "auth-welcome-message"),
                            ),
                            SizedBox(height: 30.h),
                            AuthTextField(controller: _phoneNumCntrlr),
                            SizedBox(height: 15.h),
                            SubmitButton(
                              callback: () {
                                context.go("/${RouteName.otpVerification}");
                              },
                              text: "Send OTP",
                            ),
                            SizedBox(height: 30.h),
                            const TermsAndConditionsWidget(),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }
}
