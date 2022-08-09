class OperationModel {
  String operation;
  String selectedIcon;
  String unSelectedIcon;
  bool isSelected;

  OperationModel(this.operation, this.selectedIcon, this.unSelectedIcon, this.isSelected);
}

List<OperationModel> operations = operationData
    .map(
      (item) => OperationModel(
        item['operation'] as String,
        item['selectedIcon'] as String,
        item['unSelectedIcon'] as String,
        item['isSelected'] as bool,
      ),
    )
    .toList();

var operationData = [
  {
    "operation": "Money Transfer",
    "selectedIcon": "assets/svg/money_transfer_white.svg",
    "unSelectedIcon": "assets/svg/money_transfer_blue.svg",
    "isSelected": false
  },
  {
    "operation": "Insights Tracking",
    "selectedIcon": "assets/svg/insights_tracking_white.svg",
    "unSelectedIcon": "assets/svg/insights_tracking_blue.svg",
    "isSelected": false
  },
  {
    "operation": "Bank Withdraw",
    "selectedIcon": "assets/svg/bank_withdraw_white.svg",
    "unSelectedIcon": "assets/svg/bank_withdraw_blue.svg",
    "isSelected": false
  },
];
