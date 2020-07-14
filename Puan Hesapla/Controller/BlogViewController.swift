//
//  BlogViewController.swift
//  Puan Hesapla
//
//  Created by taylanakbas on 8.07.2020.
//  Copyright © 2020 Yasar University. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BlogTableViewCell")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 20)!]
    }
}

extension BlogViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 10
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("FirstTableViewCell", owner: self, options: nil)?.first as! FirstTableViewCell
            return cell
        }else {
            let cell = Bundle.main.loadNibNamed("BlogTableViewCell", owner: self, options: nil)?.first as! BlogTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 240.0
        case 1:
            return 120.0
        default:
            return 0.0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let html = "<p><span style=\"font-size:18px\">Veterinerlik alanında eğitim almak isteyen &uuml;niversite &ouml;ğrencileri i&ccedil;in, d&uuml;nya genelinde verilen &uuml;niversite burslarını derledik. Yazımızın devamında, veteriner olmak isteyen fakat ek finansmana ihtiyacı olan &ouml;ğrenciler i&ccedil;in; ABD, Avrupa, Avustralya ve diğer &uuml;lkelerdeki veterinerlik burslarına değindik.</span></p>\r\n\r\n<hr />\r\n<h2><span style=\"font-size:18px\"><strong><a href=\"https://univerlist.com/tr/amerika-birlesik-devletleri/\" target=\"_blank\">Amerika Birleşik Devletleri</a><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 1\" src=\"/media/uploads/2020/07/08/georgia-uni-abd.jpg\" style=\"height:767px; width:1024px\" /></strong></span></h2>\r\n\r\n<p><span style=\"font-size:18px\"><strong>AKC Humane Fund John D. Spurling Bursu</strong>&nbsp; - Akredite edilmiş bir ABD kurumunda veterinerlik bilimi, hayvan davranışı veya benzer bir derece veya sertifika programına kayıtlı &ouml;ğrenciler i&ccedil;in yılda beş burs (yılda toplam 10.000 dolar ) bulunmaktadır. &Ouml;d&uuml;ller; akademik değer, tavsiye mektupları ve sorumlu evcil hayvan sahipliğiyle topluluk deneyimine dayanarak verilir.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Amerikan Holistik Veteriner Hekimleri Birliği Bursları</strong> - AHVMF &Ouml;ğrenci Araştırma Fonu, veterinerlik &ouml;ğrencilerine b&uuml;t&uuml;nleştirici veteriner tıbbi araştırmalarındaki eğitimlerine, 1500 dolar ve Lorraine Tiekert Bursu olarak 25.000 dolar&nbsp; sunmakta.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Amerikan Veteriner Tıp Vakfı Bursları</strong> - ABD&#39;de akredite bir &uuml;niversitede &ouml;ğrenim g&ouml;rd&uuml;kleri ilk, ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yıllarında veterinerlik &ouml;ğrencilerine y&ouml;nelik bir dizi burs sağlanmakta.<br />\r\n<br />\r\n<a href=\"https://univerlist.com/tr/bolumler/veteriner-fakultesi/\" target=\"_blank\"><strong>VETERİNER FAK&Uuml;LTESİ HAKKINDA BİLGİ ALMAK İ&Ccedil;İN TIKLAYINIZ!</strong></a></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Cornell &Uuml;niversitesi Veteriner Fak&uuml;ltesi </strong>- &Uuml;niversitede okumak i&ccedil;in &ccedil;eşitli veteriner bursları.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Oregon Eyalet &Uuml;niversitesi Veteriner Fak&uuml;ltesi</strong> - &Uuml;niversitenin mevcut Qualtrics anketini tamamlayan &ouml;ğrenciler i&ccedil;in verilen veteriner bursları.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Bug&uuml;n Pet Life Hayvanlar İ&ccedil;in Empati (EFA) Burs &Ouml;d&uuml;l&uuml;</strong> - Uluslararası &ouml;ğrenciler i&ccedil;in ge&ccedil;erli olan ve ABD&#39;de veterinerlik, hayvan bilimleri veya benzeri bir programa kayıtlı lisans &ouml;ğrencileri i&ccedil;in verilen burstur.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Georgia &Uuml;niversitesi Veterinerlik Burs Programı</strong> - Bir veterinerlik m&uuml;fredatının ilk veya ikinci yılını tamamlamış olan uluslararası &ouml;ğrencilere biyomedikal araştırma yapma şartıyla ek finansman sağlanır.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Zoetis / AAVMC Veteriner &Ouml;ğrenci Burs Programı</strong> - ABD veterinerlik okulundaki bir programın ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yılında olan uluslararası veterinerlik &ouml;ğrencilerine her biri 2.000 dolarlık toplamda 300 burs hibesi verilmektedir.</span></p>\r\n\r\n<hr />\r\n<h2><span style=\"font-size:18px\"><strong>Avrupa&#39;da Veterinerlik Bursları</strong></span><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 5\" src=\"/media/uploads/2020/07/08/photo-1518914781460-a3ada465edec.jpg\" style=\"height:500px; width:750px\" /></h2>\r\n\r\n<p><span style=\"font-size:18px\"><strong>MERCK Hayvan Sağlığı ve Avrupa Veterinerler Federasyonu (FVE) Veterinerlik Bursu</strong>, Avrupa Veteriner Eğitim Kurumları Birliği&#39;nin (EAEVE) veterinerlik fak&uuml;ltesinde okuyan ve okulda ikinci veya &uuml;&ccedil;&uuml;nc&uuml; yılında olan; Avrupalı, T&uuml;rk ve &Uuml;rd&uuml;nl&uuml; ​​&ouml;ğrenciler i&ccedil;in toplamda 10 farklı burs verilmektedir.</span></p>\r\n\r\n<hr />\r\n<h3><span style=\"font-size:18px\"><strong><a href=\"https://univerlist.com/tr/ingiltere/\" target=\"_blank\">Birleşik Krallık</a><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 2\" src=\"/media/uploads/2020/07/08/bristol-universitesi-birlesik-krallk.jpg\" style=\"height:685px; width:1024px\" /></strong></span></h3>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Kraliyet Veteriner Koleji, Londra &Uuml;niversitesi</strong> - Yerel veya uluslararası &ouml;ğrencilerinin &uuml;niversitede &ouml;ğrenim g&ouml;rmesi i&ccedil;in &ccedil;eşitli burslar ve fon olanakları sağlar.</span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Nottingham &Uuml;niversitesi Veteriner ve Bilim Okulu</strong> - Okula kabul s&uuml;recinde iyi performans g&ouml;steren se&ccedil;ilmiş &ouml;ğrenciler, okuldaki beş yıllık lisans dereceleri i&ccedil;in eğitim &uuml;cretlerde % 10 indirim bursu yakalarlar.<br />\r\n<br />\r\n<a href=\"https://univerlist.com/tr/ulkeler/\" target=\"_blank\"><strong>&Uuml;LKELER VE &Uuml;NİVERSİTELERİ HAKKINDA BİLGİ ALMAK İ&Ccedil;İN TIKLAYINIZ!</strong></a></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Bristol &Uuml;niversitesi Tıp ve Veterinerlik Fak&uuml;ltesi Uluslararası burslar</strong> - &Uuml;niversitelere ve Kolejlere Kabul Servisi (UCAS) aracılığıyla fak&uuml;lte programına yer alan uluslararası lisans &ouml;ğrencilerine yıllık 2000 Sterlin burs başvurusu yapma fırsatı verilecektir.</span></p>\r\n\r\n<hr />\r\n<h3><span style=\"font-size:18px\"><strong><a href=\"https://univerlist.com/tr/isvec/\" target=\"_blank\">İsve&ccedil;</a></strong></span><br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 4\" src=\"/media/uploads/2020/07/08/sweden.jpg\" style=\"height:500px; width:750px\" /></h3>\r\n\r\n<p><span style=\"font-size:18px\"><strong>İsve&ccedil; Tarım Bilimleri &Uuml;niversitesi</strong> - Avrupa Birliği dışında yer alan &ouml;ğrenciler i&ccedil;in &uuml;niversitede, - &ouml;rneğin hayvan biliminde- y&uuml;ksek lisans eğitimi almak i&ccedil;in sağlanan bir dizi &ouml;ğrenim &uuml;creti bursu bulunmakta.</span></p>\r\n\r\n<hr />\r\n<h2><span style=\"font-size:18px\"><strong>Avustralya veya Yeni Zelanda İ&ccedil;in<br />\r\n<img alt=\"Dünyada Genelinde Uluslararası Öğrencilere Yönelik Veteriner Bursları 3\" src=\"/media/uploads/2020/07/08/avustralya.jpeg\" style=\"height:768px; width:1024px\" /></strong></span></h2>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Massey &Uuml;niversitesi Veteriner Bursları</strong> - Lisans ve y&uuml;ksek lisans d&uuml;zeyinde veterinerlik &ouml;ğrencileri i&ccedil;in, bazıları sadece Yeni Zelanda vatandaşları i&ccedil;in ge&ccedil;erli olan &ccedil;eşitli burslar yer almakta. Se&ccedil;enekler arasında hayvan sağlığı ve refahı alanında eğitim alan lisans&uuml;st&uuml; &ouml;ğrencileri i&ccedil;in Veterinerlik Bilimi Joan Berry Bursları bulunuyor.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:18px\"><strong>Sydney &Uuml;niversitesi Veterinerlik Bilimi Okulu</strong> - uluslararası &ouml;ğrenciler i&ccedil;in oluşturulmuş iki burs vardır: Fen Fak&uuml;ltesi&#39;nde okuyan y&uuml;ksek lisans &ouml;ğrencileri i&ccedil;in 3500 Dolar&#39;a kadar burs imkanı sağlanıyor.</span></p>"
        performSegue(withIdentifier: "DetailVC", sender: html)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! BlogDetailViewController
        detailVC.str = sender as! String
    }
    
    
}
