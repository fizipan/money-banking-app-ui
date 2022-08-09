import 'package:flutter/material.dart';
import 'package:flutter_slicing_app_2/constants/colors.dart';
import 'package:flutter_slicing_app_2/models/card_model.dart';
import 'package:flutter_slicing_app_2/models/operation_model.dart';
import 'package:flutter_slicing_app_2/models/transaction_model.dart';

// Plugins
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current Selected
  int current = 0;

  // Handler Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            // Custom Apppbar
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/drawer_icon.svg'),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/user_image.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
    
            const SizedBox(
              height: 25,
            ),
    
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor),
                  ),
                  Text(
                    'Amanda Alex',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  )
                ],
              ),
            ),
    
            // Card Section
            Container(
              height: 199,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 199,
                      width: 344,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(cards[index].cardBackground)),
                      child: Stack(
                        children: [
                          Positioned(
                            child: SvgPicture.asset(
                              cards[index].cardElementTop,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child:
                                SvgPicture.asset(cards[index].cardElementBottom),
                          ),
                          Positioned(
                            left: 29,
                            top: 48,
                            child: Text(
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 65,
                            child: Text(
                              cards[index].cardNumber,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            right: 21,
                            child: Image.asset(
                              'assets/images/mastercard_logo.png',
                              width: 27,
                              height: 27,
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 45,
                            child: Text(
                              'CARD HOLDERNAME',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 21,
                            child: Text(
                              cards[index].user,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 21,
                            child: Text(
                              cards[index].cardExpired,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
    
            // Operation Section
            Padding(
                padding:
                    EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Operations',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor),
                    ),
                    Row(
                      children: map<Widget>(operations, (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                )),
            Container(
              height: 123,
              child: ListView.builder(
                  itemCount: operations.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                        operation: operations[index].operation,
                        selectedIcon: operations[index].selectedIcon,
                        unSelectedIcon: operations[index].unSelectedIcon,
                        isSelected: current == index,
                      ),
                    );
                  }),
            ),
    
            // Transaction Section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
              child: Text(
                'Transaction Histories',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor
                ),
              ),
            ),
            ListView.builder(
              itemCount: transactions.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 76,
                  margin: EdgeInsets.only(bottom: 13),
                  padding: EdgeInsets.only(left: 13, top: 12, bottom: 12, right: 13),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: kTenBlackColor,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(8.0, 8.0),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(transactions[index].photo),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                transactions[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor),
                              ),
                              Text(
                                transactions[index].date,
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(transactions[index].amount, style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kBlueColor
                          ),)
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unSelectedIcon;
  final bool isSelected;

  OperationCard(
      {this.operation = '',
      this.selectedIcon = '',
      this.unSelectedIcon = '',
      this.isSelected = false });

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.only(left: 6, right: 6),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(8.0, 8.0)),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? kBlueColor : kWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unSelectedIcon),
          const SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          )
        ],
      ),
    );
  }
}
