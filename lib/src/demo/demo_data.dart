class DemoData {
  static List getAccountList() {
    return [
      {
        'iban': "SI56  1920  0123  4567  892",
        'amount': 705.39,
        'type': "TRR",
      },
      {
        'iban': "SI56  1920  0123  4567  892",
        'amount': 215.61,
        'type': "Prepaid",
      },
      {
        'iban': "SI56  1920  0123  4567  892",
        'amount': 24361.37,
        'type': "Golden booklet",
      },
    ];
  }

  static List getRecentTransactionList() {
    return [
      {
        'date': '2024-10-27',
        'description': '',
        'title': 'Google Payment IE LTD, Dublin',
        'amount': -9.99,
        'account': 'Prepaid',
      },
      {
        'date': '2024-10-25',
        'description': '',
        'title': 'Dublin, Google Payment IE LTD',
        'amount': -12.0,
        'account': 'Prepaid',
      },
      {
        'date': '2024-10-25',
        'description': 'FLIK-PRIMOŽ GABERŠČEK, MUDNO',
        'title': 'PRIMOŽ GABERŠČEK',
        'amount': -10.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-24',
        'description': 'FLIK-ANDRAŽ KLANJŠČEK, ZVEZDA',
        'title': 'ANDRAŽ KLANJŠČEK',
        'amount': -7.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-23',
        'description': 'FLIK-LUKA ŽERJAL, GURMAN',
        'title': 'LUKA ŽERJAL',
        'amount': -7.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-22',
        'description': 'BS MOST NA SOČI, MOST NA SOČI',
        'title': 'BS MOST NA SOČI, MOST NA SOČI',
        'amount': -66.47,
        'account': 'TRR',
      },
      {
        'date': '2024-10-22',
        'description': 'FLIK-ANDRAŽ KLANJŠČEK, ZVEZDA',
        'title': 'ANDRAŽ KLANJŠČEK',
        'amount': -7.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-21',
        'description': 'FLIK-ANDRAŽ KLANJŠČEK, GURMAN',
        'title': 'ANDRAŽ KLANJŠČEK',
        'amount': 7.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-21',
        'description': 'FLIK-LUKA ŽERJAL, GURMAN',
        'title': 'LUKA ŽERJAL',
        'amount': 7.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-21',
        'description': 'RESTAVRACIJA GURMAN, NOVA GORICA',
        'title': 'RESTAVRACIJA GURMAN, NOVA GORICA',
        'amount': -22.5,
        'account': 'TRR',
      },
      {
        'date': '2024-10-21',
        'description': '35314369001, PAYPAL *NETFLIX.COM',
        'title': '35314369001, PAYPAL *NETFLIX.COM',
        'amount': -9.99,
        'account': 'Prepaid',
      },
    ];
  }
}
