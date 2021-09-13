class ObjectFood {
  int id;
  String fname;
  double fprice;
  String fphoto;
  String fberat;
  String imageUrls;
  int qty;

  ObjectFood(
      {required this.id,
      required this.fname,
      required this.fprice,
      required this.fphoto,
      required this.fberat,
      required this.imageUrls,
      required this.qty});
}

List<ObjectFood> foodList = [
  ObjectFood(
      id: 1,
      fname: 'Basreng',
      fprice: 5000,
      fphoto: 'image/bas.jpg',
      fberat: '20',
      imageUrls:
          'https://cdn.idntimes.com/content-images/post/20210618/198629997-934416724009757-7887903785623892961-n-f6c0c5b7bd2982c39674da7e192c85f3_600x400.jpg',
      qty: 1),
  ObjectFood(
    id: 2,
    fname: 'Cuanki',
    fprice: 5000,
    fphoto: 'image/cuangki.jpg',
    fberat: '20',
    imageUrls: 'https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2019/12/080812121313/1-2-Cuanki-Bandung-by-alejenes.jpg',
    qty: 1,
  ),
];
