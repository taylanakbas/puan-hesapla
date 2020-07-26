//
//  Constants.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 30.06.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import Foundation
import UIKit

struct K {
    
    static let detailBlogSegue = "DetailVC"
    
    struct XIB {
        struct Table {
            static let title = "TitleTableViewCell"
            static let titleHeight : CGFloat = 80.0
            static let banner = "BannerTableViewCell"
            static let bannerHeight : CGFloat  = 280.0
            static let university = "UniversityTableViewCell"
            static let universityHeight : CGFloat  = 230.0
            static let article = "ArticleTableViewCell"
            static let articleHeight : CGFloat = 830.0
            static let tyt = "CalculateTYTTableViewCell"
            static let tytHeight : CGFloat = 400.0
            static let tytResult = "ResultTYTTableViewCell"
            static let tytResultHeight : CGFloat = 150.0
            static let ayt = "CalculateAYTTableViewCell"
            static let aytHeight : CGFloat = 280.0
            static let aytResult = "ResultAYTTableViewCell"
            static let aytResultHeight : CGFloat = 200.0
            static let calculate = "CalculateButtonTableViewCell"
            static let calculateHeight : CGFloat = 60.0
            
            static let firstBlog = "FirstTableViewCell"
            static let firstBlogHeight : CGFloat = 240.0
            static let blog = "BlogTableViewCell"
            static let blogHeight : CGFloat = 140.0
            
            
        }
        struct Collection {
            static let estimatedWidth : CGFloat  = 160.0
            static let cellMarginSize : CGFloat  = 16.0
            static let university = "UniversityCollectionViewCell"
            static let universityHeight : CGFloat  = 230.0
            static let article = "ArticleCollectionViewCell"
            static let articleHeight : CGFloat  = 200.0
        }

    }
    
    struct SB {
        static let main = "Main"
        static let alert = "AlertStoryboard"
        static let web = "WebViewStoryboard"
    }
    struct VC {
        static let home = "HomeViewController"
        static let blog = "BlogViewController"
        static let calculator = "CalculatorViewController"
        static let web = "WebViewController"
        static let login = "LoginViewController"
        static let register = "RegisterViewController"
    }
    struct URL {
        static let main = "https://univerlist.com/tr/"
        static let universities = "https://univerlist.com/tr/universiteler/"
        static let blog = "https://univerlist.com/tr/blog/"
        struct Scheme {
            static let university = "app://uni"
            static let blog  = "app://blog"
            static let seperator = "?"
        }
    }
    struct FStore {
        struct user {
            static let collectionName = "users"
            static let emailField = "email"
            static let passwordField = "password"
            static let phoneField = "phone"
            static let isSubscribed = "subscription"
        }
    }
    
    struct API {
        static let url = "https://furkanerkorkmaz.com/stajyer/"
        static let uni = "university"
        static let blog = "blog"
        static let ext = ".json"
        static let response = "results"
    }
    struct Resources {
        struct Font {
            static let black = "Montserrat-Black"
            static let bold = "Montserrat-Bold"
            static let extraBold = "Montserrat-ExtraBold"
            static let extraLight = "Montserrat-ExtraLight"
            static let light = "Montserrat-Light"
            static let medium = "Montserrat-Medium"
            static let regular = "Montserrat-Regular"
            static let semiBold = "Montserrat-SemiBold"
            static let thin = "Montserrat-Thin"
        }
        struct Icon {
            static let mail = "envelope"
            static let password = "password"
            static let phone = "phone"
        }
        struct Color {
            static let blue = "BlueColor"
            static let lightBlue = "LightBlueColor"
            static let purple = "PurpleColor"
        }
        struct Animation {
            static let loading = "loading"
        }
        struct Image {
            static let firstBlog = "vet"
            static let onboard1 = "onboard1"
            static let onboard2 = "onboard2"
            static let onboard3 = "onboard3"
        }
        static let video = "univerlist"
        static let videoExt = "mp4"
        static let html = "<p><span style=\"font-size:18px\">Veterinerlik alanında eğitim almak isteyen &uuml;niversite &ouml;ğrencileri i&ccedil;in, d&uuml;nya genelinde verilen &uuml;niversite burslarını derledik. Yazımızın devamında, veteriner olmak isteyen fakat ek finansmana ihtiyacı olan &ouml;ğrenciler i&ccedil;in; ABD, Avrupa, Avustralya ve diğer &uuml;lkelerdeki veterinerlik burslarına değindik.</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:18px\"><strong>AKC Humane Fund John D. Spurling Bursu</strong>&nbsp; - Akredite edilmiş bir ABD kurumunda veterinerlik bilimi, hayvan davranışı veya benzer bir derece veya sertifika programına kayıtlı &ouml;ğrenciler i&ccedil;in yılda beş burs (yılda toplam 10.000 dolar ) bulunmaktadır. &Ouml;d&uuml;ller; akademik değer, tavsiye mektupları ve sorumlu evcil hayvan sahipliğiyle topluluk deneyimine dayanarak verilir.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Amerikan Holistik Veteriner Hekimleri Birliği Bursları</strong> - AHVMF &Ouml;ğrenci Araştırma Fonu, veterinerlik &ouml;ğrencilerine b&uuml;t&uuml;nleştirici veteriner tıbbi araştırmalarındaki eğitimlerine, 1500 dolar ve Lorraine Tiekert Bursu olarak 25.000 dolar&nbsp; sunmakta.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Amerikan Veteriner Tıp Vakfı Bursları</strong> - ABD&#39;de akredite bir &uuml;niversitede &ouml;ğrenim g&ouml;rd&uuml;kleri ilk, ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yıllarında veterinerlik &ouml;ğrencilerine y&ouml;nelik bir dizi burs sağlanmakta.<br />\r\n<br />\r\n<a href=\"https://univerlist.com/tr/bolumler/veteriner-fakultesi/\" target=\"_blank\"><strong>VETERİNER FAK&Uuml;LTESİ HAKKINDA BİLGİ ALMAK İ&Ccedil;İN TIKLAYINIZ!</strong></a></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Cornell &Uuml;niversitesi Veteriner Fak&uuml;ltesi </strong>- &Uuml;niversitede okumak i&ccedil;in &ccedil;eşitli veteriner bursları.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Oregon Eyalet &Uuml;niversitesi Veteriner Fak&uuml;ltesi</strong> - &Uuml;niversitenin mevcut Qualtrics anketini tamamlayan &ouml;ğrenciler i&ccedil;in verilen veteriner bursları.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Bug&uuml;n Pet Life Hayvanlar İ&ccedil;in Empati (EFA) Burs &Ouml;d&uuml;l&uuml;</strong> - Uluslararası &ouml;ğrenciler i&ccedil;in ge&ccedil;erli olan ve ABD&#39;de veterinerlik, hayvan bilimleri veya benzeri bir programa kayıtlı lisans &ouml;ğrencileri i&ccedil;in verilen burstur.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Georgia &Uuml;niversitesi Veterinerlik Burs Programı</strong> - Bir veterinerlik m&uuml;fredatının ilk veya ikinci yılını tamamlamış olan uluslararası &ouml;ğrencilere biyomedikal araştırma yapma şartıyla ek finansman sağlanır.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Zoetis / AAVMC Veteriner &Ouml;ğrenci Burs Programı</strong> - ABD veterinerlik okulundaki bir programın ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yılında olan uluslararası veterinerlik &ouml;ğrencilerine her biri 2.000 dolarlık toplamda 300 burs hibesi verilmektedir.</span></p>\r\n\r\n<hr />\r\n<h2><span style=\"font-size:18px\"><strong>Avrupa&#39;da Veterinerlik Bursları</strong></span><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 5\" src=\"/media/uploads/2020/07/08/photo-1518914781460-a3ada465edec.jpg\" style=\"height:500px; width:750px\" /></h2>\r\n\r\n<p><span style=\"font-size:18px\"><strong>MERCK Hayvan Sağlığı ve Avrupa Veterinerler Federasyonu (FVE) Veterinerlik Bursu</strong>, Avrupa Veteriner Eğitim Kurumları Birliği&#39;nin (EAEVE) veterinerlik fak&uuml;ltesinde okuyan ve okulda ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yılında olan; Avrupalı, T&uuml;rk ve &Uuml;rd&uuml;nl&uuml; ​​&ouml;ğrenciler i&ccedil;in toplamda 10 farklı burs verilmektedir.</span></p>\r\n\r\n<hr />\r\n<h3><span style=\"font-size:18px\"><strong><a href=\"https://univerlist.com/tr/ingiltere/\" target=\"_blank\">Birleşik Krallık</a><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 2\" src=\"/media/uploads/2020/07/08/bristol-universitesi-birlesik-krallk.jpg\" style=\"height:685px; width:1024px\" /></strong></span></h3>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Kraliyet Veteriner Koleji, Londra &Uuml;niversitesi</strong> - Yerel veya uluslararası &ouml;ğrencilerinin &uuml;niversitede &ouml;ğrenim g&ouml;rmesi i&ccedil;in &ccedil;eşitli burslar ve fon olanakları sağlar.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Nottingham &Uuml;niversitesi Veteriner ve Bilim Okulu</strong> - Okula kabul s&uuml;recinde iyi performans g&ouml;steren se&ccedil;ilmiş &ouml;ğrenciler, okuldaki beş yıllık lisans dereceleri i&ccedil;in eğitim &uuml;cretlerde % 10 indirim bursu yakalarlar.<br />\r\n<br />\r\n<a href=\"https://univerlist.com/tr/ulkeler/\" target=\"_blank\"><strong>&Uuml;LKELER VE &Uuml;NİVERSİTELERİ HAKKINDA BİLGİ ALMAK İ&Ccedil;İN TIKLAYINIZ!</strong></a></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Bristol &Uuml;niversitesi Tıp ve Veterinerlik Fak&uuml;ltesi Uluslararası burslar</strong> - &Uuml;niversitelere ve Kolejlere Kabul Servisi (UCAS) aracılığıyla fak&uuml;lte programına yer alan uluslararası lisans &ouml;ğrencilerine yıllık 2000 Sterlin burs başvurusu yapma fırsatı verilecektir.</span></p>\r\n\r\n<hr />\r\n<h3><span style=\"font-size:18px\"><strong><a href=\"https://univerlist.com/tr/isvec/\" target=\"_blank\">İsve&ccedil;</a></strong></span><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 4\" src=\"/media/uploads/2020/07/08/sweden.jpg\" style=\"height:500px; width:750px\" /></h3>\r\n\r\n<p><span style=\"font-size:18px\"><strong>İsve&ccedil; Tarım Bilimleri &Uuml;niversitesi</strong> - Avrupa Birliği dışında yer alan &ouml;ğrenciler i&ccedil;in &uuml;niversitede, - &ouml;rneğin hayvan biliminde- y&uuml;ksek lisans eğitimi almak i&ccedil;in sağlanan bir dizi &ouml;ğrenim &uuml;creti bursu bulunmakta.</span></p>\r\n\r\n<hr />\r\n<h2><span style=\"font-size:18px\"><strong>Avustralya veya Yeni Zelanda İ&ccedil;in<br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 3\" src=\"/media/uploads/2020/07/08/avustralya.jpeg\" style=\"height:768px; width:1024px\" /></strong></span></h2>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Massey &Uuml;niversitesi Veteriner Bursları</strong> - Lisans ve y&uuml;ksek lisans d&uuml;zeyinde veterinerlik &ouml;ğrencileri i&ccedil;in, bazıları sadece Yeni Zelanda vatandaşları i&ccedil;in ge&ccedil;erli olan &ccedil;eşitli burslar yer almakta. Se&ccedil;enekler arasında hayvan sağlığı ve refahı alanında eğitim alan lisans&uuml;st&uuml; &ouml;ğrencileri i&ccedil;in Veterinerlik Bilimi Joan Berry Bursları bulunuyor.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Sydney &Uuml;niversitesi Veterinerlik Bilimi Okulu</strong> - uluslararası &ouml;ğrenciler i&ccedil;in oluşturulmuş iki burs vardır: Fen Fak&uuml;ltesi&#39;nde okuyan y&uuml;ksek lisans &ouml;ğrencileri i&ccedil;in 3500 Dolar&#39;a kadar burs imkanı sağlanıyor.</span></p>"
    }
    
    struct Error {
        
        struct Register {
            static let invalidInput = " bilgilerinizi kontrol ediniz!"
            static let error = "Bir hata oluştu!"
            static let switchOff = "Devam edebilmek için gizlilik sözleşmemizi kabul etmeniz gerekmektedir."
            static let invalidEmail = "Geçersİz mail adresİ"
            static let invalidPassword = "Parolanız en az 8 karakterden oluşmalı"
        }
        
        struct API {
            static let parse = "Json Parse Error : "
        }
        struct Resources {
            static let notFound = " not found!"
        }
        struct XIB {
            static let notExists = "XIB not exists in storyboard0"
        }
        struct Calc {
            static let tyt : [Int : String] = [
                1 : "TYT-Türkçe",
                2 : "TYT-Matematik",
                3 : "TYT-Sosyal",
                4 : "TYT-Fen",
                5 : "Diploma",
                6 : "Diploma",
                7 : "TYT-Fen",
                8 : "TYT-Sosyal",
                9 : "TYT-Matematik",
                10 : "TYT-Türkçe",
            ]
            static let ayt : [Int : String] = [
                13 : "AYT-Edebiyat",
                14 : "AYT-Sosyal Bilgiler",
                15 : "AYT-Matematik",
                16 : "AYT-Fen Bilgisi",
                17 : "AYT-Yabancı Dil",
                18 : "Diploma",
                19 : "Diploma",
                20 : "AYT-Yabancı Dil",
                21 : "AYT-Fen Bilgisi",
                22 : "AYT-Matematik",
                23 : "AYT-Sosyal Bilgiler",
                24 : "AYT-Edebiyat"
            ]
            
        }
        
    }
    
}
