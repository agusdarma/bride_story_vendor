class ResultMyBookingModel {
  String namaPernikahan;
  String namaPenanggungJawab1;
  String handPhone1;
  String namaPenanggungJawab2;
  String handPhone2;
  String userEmailBooking;
  String titleVenue;  	
  int dateTimeMilisecond;
  int bookingId;
  String emailUserLogin;  
  String fileNameImage;	

  String get getFileNameImage => fileNameImage;

  ResultMyBookingModel(
      this.namaPernikahan,
      this.namaPenanggungJawab1,
      this.handPhone1,
      this.namaPenanggungJawab2,
      this.handPhone2,
      this.userEmailBooking,
      this.titleVenue,
      this.dateTimeMilisecond,
      this.bookingId,
      this.emailUserLogin,
      this.fileNameImage);
}
