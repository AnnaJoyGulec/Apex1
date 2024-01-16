public class Study {
    public static void main() {
        String kelime = 'merhaba'; // İşlem yapılacak kelime
        Integer harfSayisiAzalmaMiktari = 2; // Azaltılacak harf sayısı

        String azalmisKelime = sonHarfleriAzalt(kelime, harfSayisiAzalmaMiktari);
        System.debug('Azaltılmış Kelime: ' + azalmisKelime);
    }

    public static String sonHarfleriAzalt(String kelime, Integer azalmaMiktari) {
        if (kelime != null && azalmaMiktari > 0) {
            Integer kelimeUzunlugu = kelime.length();
            
            // Azaltma miktarı kelimenin uzunluğundan büyükse, kelimenin tamamını boşalt
            if (azalmaMiktari >= kelimeUzunlugu) {
                return '';
            }

            // Son harfleri azaltma
            String azalmisKelime = '';
            for (Integer i = 0; i < kelimeUzunlugu - azalmaMiktari; i++) {
                azalmisKelime += kelime.substring(i, i + 1);
            }

            return azalmisKelime;
        } else {
            // Geçersiz giriş durumunda doğrudan kelimeyi geri döndür
            return kelime;
        }
    }
}

