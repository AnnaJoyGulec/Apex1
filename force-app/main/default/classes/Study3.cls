public class Study {
    public static void main() {
        List<String> kullaniciListesi = new List<String>{'Ahmet', 'Zeynep', 'Mehmet', 'Ayşe', 'Can'};
        
        // Listeyi alfabetik sıraya göre sırala
        kullaniciListesi.sort();
        
        // Sıralanmış listeyi ekrana yazdır
        System.debug('Siralanmis Kullanici Listesi: ' + kullaniciListesi);
    }
}


