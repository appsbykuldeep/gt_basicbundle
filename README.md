
Collection of basic funtion/requremnt for creating flutter app


## Note :  Use GetMaterialApp For Error Free Experience


## Installation
```dart
import 'package:gt_basicbundle/gt_basicbundle.dart';
```

# RegExp

## Some Regular Exp

```dart
gtexpNameAllow
gtexpTextAllow
gtextTextIntAllowWithoutspace
gtexpIntAllow
gtexpdoubleAllow
```

# Dialogues

## Some Most Used dialogues

```dart
Future<bool> gtMakeconfirmation(
  String? titel,
  String content = "Are you sure ?",
  bool focusonyes = true,
)


Future<GtFilePickerModel> gtRunFilePicker(
  List<String>? extenstions,
  String? dialogTitle,
)


Future<GtFilePickerModel> runimagePicker(
  required bool fromcamera,
  bool compress = false,
  bool showloading = false,
  int compressQuality = 85,
)

void gtShowLoading(
  String? lable,
  String? heroid,
  bool lablebyctrl = false,
)

Future<DateTime?> gtShowDatePickerDilogue(
  required context,
  String? lable,
  String? savelable,
  DateTime? iniitalDate,
  DateTime? firstDate,
  DateTime? lastDate,
  bool canchangedate = true,
)


Future<DateTimeRange?> gtShowDateRangePickerDilogue(
  required context,
  String? lable,
  DateTimeRange? iniitalDateRange,
  DateTime? firstDate,
  DateTime? lastDate,
  bool canchangedate = true,
)
```



# Powerfull Extensions

## Color Extensions
```dart
void gtsetStatusBarColor /// Changes Status Bar Color
```

## BuildContext Extensions
```dart
gtHideKeys() /// Hining Keyboard

gtShowKeys() /// Showing Keyboard
```

## dynamic Extensions
```dart
Double togtdouble  //! retruns 0 on null

int togtint  //! retruns 0 on null

String togtString  //! retruns "" on null

String spelling   //! retruns Spelling of number

Future<void> gtDelay   //! Use it for create delay

// Data Run Type
bool isString   

bool isint

bool isdouble

bool isList

Widget gtAnimateNumber( String? family,
      double fontsize = 12,
      Color? fontcolor,
      int fractionDigits = 2,
      String prefix = "₹ ",
      Alignment alignment = Alignment.centerLeft,
      Duration duration = const Duration(milliseconds: 400)) 

Sring gtCurrencyText  /// Return in ₹ ##,##,###.## format

Sring gtThousentText  /// Return in ##,##,###.## format

/// Use Below functions on DateTime / String of DateTime  

Sring gtDateddMMyyformat  /// Return Date in dd-MMM-yyy or -

Sring gtDateddmmyyyyhmformat  /// Return Date in dd-MMM-yyy hh:mm a or -

Sring gtTimehhmmformat  /// Return Date in hh:mm or -

Sring gtTimehhmmAPformat  /// Return Date in hh:mm a or -

Sring gtDatemmmyyyyformat  /// Return Date in MMM-yyy or -

Sring gtDatemmmmyyyyformat  /// Return Date in MMMM-yyy or -

Sring datemmmmformat  /// Return Date in MMMM or -

Sring gtDateapiformat  /// Return Date in dd/MM/yyyy or -

String custumDateFormat(String fomat) /// Return Date in your format or -

```

## String Extensions
```dart
  Widget gtApptitel(
    double? size,
    Color? color,
    int? maxline,
  )

 Widget gtApptitelWithRange(DateTimeRange? date)

 Widget gtTextbody(
    double? size,
    Color? color,
    int? maxline,
    TextAlign? textAlign,
    int? weight,
    bool speak = true,
  )

  void get  gtShowtost

 String get gtFileExt

 String get gtProperCase 

 Future<bool> get gtIsFileExists

 Future<List<int>> get gtUnit8ListByPath

 Future<String> get gtBase64ByPath 
```

## Widget Extensions
```dart
  Widget gtDelayDisplay(
      int delay = 150,
      int fadedelay = 300,
      int delaymuliple = 1,
      DelayInFrom infrom = DelayInFrom.bottom)
```
## List of String Extensions (Fetch Data From Api Response/Map)
```dart
 String fetchString(Map<String, dynamic> jsondata)

 double fetchdouble(Map<String, dynamic> jsondata)

 int fetchint(Map<String, dynamic> jsondata)

 dynamic fetchdynamic(Map<String, dynamic> jsondata)
```


# Important Functions

## Api Call
```dart
Future<GTApiResponse> gtBaseApiCall(
  required String url,
  Map<String, dynamic>? apibody,
  Map<String, String>? apiheders,
  bool? bygetmethod,
)
```

## Byte Data Shortner
```dart
String gtByteDataShortner(required int bytes, int decimals = 2)
```

## Download File By Url
```dart
Future<DownloadFile> gtDownloadFileByUrl(
  required String url,
  bool? innewtab,
  String? name,
  String? savePath,
  Function(int, int)? onReceiveProgress,
)
```

## Upload File By Url
```dart
Future<GTApiResponse> gtUploadFile(
  required String filename,
  required String url,
  List<GtFilePickerModel>? files,
  String fileKey = 'file',
  bool onlySingleFile = false,
  Map<String, dynamic>? otherdata,
  Map<String, dynamic>? headerdata,
  Function(int, int)? onSentProgress,
)
```

## Get Device Ip 
```dart
Future<String> get gtLocalIpAddress
```

## Device Orientation 
```dart
void get gtPortraitModeOnly // Lock Orientation in Portrait Mode

void get gtLandscapeModeOnly // Lock Landscape in Portrait Mode

void get gtEnableRotation // Unlock Rotation

```

## Search Data In List 
```dart
List<int> gtSearchInList(
  required List<Map<String, dynamic>> datalist,
  required String inputvalue,
  List<String>? ignorekey,
  List<String>? inkeys,
  bool? exactmatch,
)

```


# Some Widgets


## Action Bar Item
```dart
ActionItem(
 final String label;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
)
```

## Animated List
```dart
AnimatedListWidget(
  final int itemCount;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
   final Widget Function(
      BuildContext context, int index, Animation<double> animation) itembuilder;
)


//Use Tile for animation
AnimatedListTile(
 final Widget child;
  final bool cananimate;
  final Animation<double> animation;
)

```




## Additional information
A Startup bundle created by Kuldeep Gupta 
This package is made for to reduce time loss for create new setup
For any suggestion/Contact feel free to mail me on kuldeepgupta983@gmail.com

