import 'package:aloqa_nazorat/src/config/routes/routes.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/one_id_body.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OneIdPage extends StatefulWidget {
  const OneIdPage({super.key});

  @override
  State<OneIdPage> createState() => _OneIdPageState();
}

class _OneIdPageState extends State<OneIdPage> {
  late final bloc = context.read<AuthBloc>();

  late final WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            String url = request.url;
            print(url);
            if (url.contains(
                "https://murojaat.gis.uz/api/one-id/432fdsfHHDSFG213__LL-123QWE?code=")) {
              int index1 = url.indexOf("code=");
              int index2 = url.indexOf("&state");
              String code = url.substring(index1 + 5, index2);
              bloc.oneId(body: OneIdBody(code: code, deviceKey: "iphone"));
            } else {
              // _webViewController.loadRequest(Uri.dataFromString(url));
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://sso.egov.uz/sso/oauth/Authorization.do?response_type=one_code&client_id=gis_xn_mobile&redirect_uri=https://murojaat.gis.uz/api/one-id/432fdsfHHDSFG213__LL-123QWE&scope=gis_xn_mobile&state=eyJtZXRob2QiOiJJRFBXIn0=",
        ),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isOneIdVerified) {
            _webViewController.clearCache();
            _webViewController.clearLocalStorage();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.MAIN, (route) => false);
          }
        },
        builder: (context, state) {
          return WebViewWidget(
            controller: _webViewController,
          );
        },
      ),
    );
  }
}
