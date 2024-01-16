public class Study {
    public static void main() {
        // Müşteri seçimleri
        Boolean hamburgerSecimi = true; // true ise hamburger seçildi
        Boolean patatesAlmaSecimi = false; // true ise patates alınmadı
        Boolean icecekBoyutuBuyuk = true; // true ise içecek büyük boy seçildi

        // İndirim ve avantaj hesaplaması
        Double fiyat = 10.0; // Hamburger fiyatı
        Double indirimOrani = 0.0; // İndirim oranı

        // Hamburger seçimi
        if (hamburgerSecimi) {
            indirimOrani += 0.2; // Hamburger seçenlere %20 indirim
        }

        // Patates alma seçimi
        if (!patatesAlmaSecimi) {
            indirimOrani += 0.05; // Patates almayanlara %5 indirim
        }

        // İçecek boyutu seçimi
        if (icecekBoyutuBuyuk) {
            System.debug('Patates Bedava!'); // Patates bedava
        }

        // İndirim uygulama
        Double indirimMiktari = fiyat * indirimOrani;
        Double odemeMiktari = fiyat - indirimMiktari;

        // Sonuçları gösterme
        System.debug('İndirimli Fiyat: ' + odemeMiktari);
    }
}

