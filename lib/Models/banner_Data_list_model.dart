// To parse this JSON data, do
//
//     final bannerDataViewModel = bannerDataViewModelFromJson(jsonString);

import 'dart:convert';

BannerDataViewModel bannerDataViewModelFromJson(String str) => BannerDataViewModel.fromJson(json.decode(str));

String bannerDataViewModelToJson(BannerDataViewModel data) => json.encode(data.toJson());

class BannerDataViewModel {
    final String? statusCode;
    final String? message;
    final List<BannerList>? bannerList;

    BannerDataViewModel({
        this.statusCode,
        this.message,
        this.bannerList,
    });

    factory BannerDataViewModel.fromJson(Map<String, dynamic> json) => BannerDataViewModel(
        statusCode: json["status_code"],
        message: json["message"],
        bannerList: json["Banner_list"] == null ? [] : List<BannerList>.from(json["Banner_list"]!.map((x) => BannerList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "Banner_list": bannerList == null ? [] : List<dynamic>.from(bannerList!.map((x) => x.toJson())),
    };
}

class BannerList {
    final String? id;
    final String? type;
    final String? banerImage;

    BannerList({
        this.id,
        this.type,
        this.banerImage,
    });

    factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        id: json["id"],
        type: json["type"],
        banerImage: json["baner_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "baner_image": banerImage,
    };
}
