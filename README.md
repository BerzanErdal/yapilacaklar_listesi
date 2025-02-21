📌 Yapılacaklar Listesi Uygulaması 

Bu uygulama, BLoC mimarisi kullanılarak geliştirilmiş, SQLite veritabanı ile çalışan kullanıcı dostu bir Yapılacaklar Listesi uygulamasıdır. Kullanıcılar, görevleri ekleyebilir, güncelleyebilir, silebilir, arayabilir ve sıralayabilir.  




🚀 Özellikler 

✅ Görev Ekleme: Yeni yapılacakları ekleyebilirsiniz.  
✅ Görev Güncelleme: Mevcut görevleri düzenleyebilirsiniz.  
✅ Görev Silme: İstemediğiniz ya da bitirdiğiniz görevleri silebilirsiniz.  
✅ Görev Arama: Kayıtlı görevler arasında hızlıca arama yapabilirsiniz.  
✅ SQLite Kullanımı: Veriler SQLite veritabanını kulanılarak saklanır.  
✅ Bloc Mimarisi: Ekran ve iş mantığı ayrılmıştır, böylece kod daha düzenlidir.  
✅ Kullanıcı Dostu Arayüz: Şık ve sade bir tasarım sunar.  




🛠 Kullanılan Teknolojiler  

- Flutter – Mobil UI geliştirme  
- Bloc (Business Logic Component) – Durum yönetimi  
- SQLite – Veri saklama



 📲 Kurulum  

1️⃣ Projeyi klonlayın:

git clone https://github.com/BerzanErdal/yapilacaklar_listesi.git
cd yapilacaklar_listesi


2️⃣ Bağımlılıkları yükleyin:  

flutter pub get

3️⃣ Uygulamayı çalıştırın:  

flutter run






📂 Proje Dizini Yapısı

lib/

│-- main.dart          # Uygulamanın giriş noktası


│-- data/              📌 Veriler ve Veri Katmanı

│   ├──  entity/        # Veritabanı varlıkları (Entity)

│   │   ├──   yapilacaklar.dart  # Yapılacaklar veri modeli

│   ├──   repo/          # Veri erişim ve işleme (Repository)

│   │   ├──   yapilacaklardao_repository.dart  # Yapılacaklar için DAO (Data Access Object)

│   ├──   sqlite/        # SQLite ile ilgili işlemler (Eğer dosya varsa)

│    │    ├──   veritabani_yardimcisi.dart  # Veri tabanına erişme

│--   ui/                📌 Kullanıcı Arayüzü (UI)

│   ├──   cubit/         # BLoC Cubit dosyaları (Durum yönetimi)

│   │   ├──   anasayfacubit.dart   # Anasayfa Cubit

│   │   ├──   detaySayfaCubit.dart # Detay sayfası Cubit

│   │   ├──   kayitSayfaCubit.dart # Kayıt sayfası Cubit

│   ├──   views/         # Ekranlar (Views)

│   │   ├──   anasayfa.dart       # Anasayfa UI

│   │   ├──   detaySayfa.dart     # Detay sayfası UI

│   │   ├──   kayitSayfa.dart     # Kayıt sayfası UI






🎯 Nasıl Kullanılır? 

- Görev eklemek için "+" butonuna tıklayın.  
- Görevleri düzenlemek için üzerine tıklayın.
- Görevleri silmek için "X" butonuna tıklayın
- Arama yapmak için arama butonunu kullanın.





 📸 Ekran Görüntüleri 

📌 Ana Sayfa:

![Ekran görüntüsü 2025-02-21 194519](https://github.com/user-attachments/assets/636e2103-d9a1-4e16-9fd4-a3515a14f1dd)    ![Ekran görüntüsü 2025-02-21 194601](https://github.com/user-attachments/assets/c87ad700-f8c4-40c3-a5d1-826e5fa02bba)    ![Ekran görüntüsü 2025-02-21 194623](https://github.com/user-attachments/assets/b9c271e8-9ddd-41e5-821d-efe11c76ec74) 






  
📌 Görev Güncelleme Ekranı:



![Ekran görüntüsü 2025-02-21 194652](https://github.com/user-attachments/assets/c6383d89-e758-44aa-8b8d-dfe736b40ca6)



📌 Görev Ekleme Ekranı: 




![Ekran görüntüsü 2025-02-21 194731](https://github.com/user-attachments/assets/90c9a2b6-56da-4a9b-8df0-f275fbae9d8e)


