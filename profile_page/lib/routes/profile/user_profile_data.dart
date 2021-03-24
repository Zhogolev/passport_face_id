import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../enum/data_status.dart';
import '../../../enum/sex.dart';
import '../../../widgets/form_field/project_form_field.dart';
import '../../../widgets/radio_group/group_radio_button.dart';
import '../../base/base_route.dart';
import 'data_pages/defaults.dart';
import 'data_pages/profile_page_app_bar.dart';

part 'data_pages/inn_data.dart';

part 'data_pages/medical_book_data.dart';

part 'data_pages/passport_data.dart';

part 'data_pages/personal_information.dart';

part 'data_pages/registration_data.dart';

class UserProfileData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: _UserProfileHeader(
            dataFilled: 0.15,
            rating: 3.5,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _UserProfileData(
          onPressed: () => _goToPersonalData(context),
          title: 'Персональные данный',
          subtitle: 'На проверке',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          onPressed: () => _goToPassportData(context),
          title: 'Паспорт',
          subtitle: 'На проверке',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          onPressed: () => _goToRegistrationData(context),
          title: 'Регистрация',
          subtitle: 'На проверке',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          onPressed: () => _goToINNData(context),
          title: 'ИНН',
          subtitle: 'На проверке',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          onPressed: () => _goToMedicalBook(context),
          title: 'Медицинская книжка',
          subtitle: 'действительна до 12.02.21',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          title: 'Денежные выплаты',
          subtitle: 'Банк: Сбербанк',
          status: DataStatus.progress,
        ),
        _UserProfileData(
          title: 'Работодатели',
          subtitle: 'Одобрено: 0,\tНа проверке: 2',
          status: DataStatus.progress,
        ),
      ],
    );
  }

  Future<void> _goToPersonalData(BuildContext context) async {
    final result =
        await Navigator.of(context).push(_BaseInformationPage.route());
    print(result);
  }

  Future<void> _goToPassportData(BuildContext context) async {
    final result = await Navigator.of(context).push(_PassportData.route());
    print(result);
  }

  Future<void> _goToRegistrationData(BuildContext context) async {
    final result =
        await Navigator.of(context).push(_RegistrationData.route(() {}));
    print(result);
  }

  Future<void> _goToINNData(BuildContext context) async {
    final result = await Navigator.of(context).push(_InnData.route(() {}));
    print(result);
  }

  Future<void> _goToMedicalBook(BuildContext context) async {
    final result = await Navigator.of(context).push(_MedicalBookData.route(() {}));
    print(result);
  }
}

final dataTitleStyle = GoogleFonts.roboto(fontSize: 16, height: 1.5);
final dataSubtitleStyle = GoogleFonts.inter(
    fontSize: 14,
    color: Colors.black.withAlpha(125),
    letterSpacing: 0.5,
    height: 1.5);

class _UserProfileData extends StatelessWidget {
  final String title;
  final String subtitle;
  final DataStatus status;
  final VoidCallback onPressed;

  const _UserProfileData(
      {Key key,
      @required this.title,
      @required this.subtitle,
      this.status = DataStatus.ready,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (status) {
      case DataStatus.ready:
        icon = Icons.check_outlined;
        break;
      case DataStatus.progress:
        icon = Icons.access_time;
        break;
      default:
        icon = Icons.question_answer_outlined;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: MaterialButton(
          padding: EdgeInsets.zero,
          color: Color(0xffC4C4C4),
          onPressed: onPressed ?? () {},
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CircleAvatar(
                    minRadius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      icon,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: dataTitleStyle,
                        ),
                        Text(
                          subtitle,
                          style: dataSubtitleStyle,
                        )
                      ]),
                ),
                Icon(
                  Icons.chevron_right_sharp,
                  size: 50,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}

class _UserProfileHeader extends StatelessWidget {
  final String name;
  final double rating;
  final double dataFilled;

  const _UserProfileHeader(
      {Key key, this.name = 'Неизвестно', this.rating = 0, this.dataFilled = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.roboto(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      height: 16,
                      child: Row(
                        children: [
                          RatingBarIndicator(
                            itemSize: 15,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            rating: rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            width: 17.5,
                          ),
                          Text(
                            '${rating.toStringAsFixed(1)}',
                            style: GoogleFonts.roboto(
                                color: Colors.grey, fontSize: 14),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 70,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      minRadius: 40,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                            'assets/images/profile/profile_empty_photo.svg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {
                        print('start making photo');
                      },
                      child: CircleAvatar(
                        minRadius: 12,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 10,
            child: LinearPercentIndicator(
              padding: EdgeInsets.symmetric(horizontal: 6),
              lineHeight: 10,
              percent: dataFilled,
              progressColor: Theme.of(context).accentColor,
            )),
        Text(
          'Заполнены не все блок для откликов',
          style: GoogleFonts.roboto(fontSize: 12, height: 2),
        )
      ],
    );
  }
}
