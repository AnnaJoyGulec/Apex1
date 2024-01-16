public with sharing class Study2 {
    public Study2() public static void main() {
        //do-while ile geçerli yaş bilgisi kontrolü
        Integer yas;
        
        do {
            // Kullanıcıdan yaş bilgisini al
            System.debug('Lütfen yaşınızı girin: ');
            yas = Integer.valueOf(System.readLine());
            
            // Girilen yaş negatifse veya 0 ise uyarı ver
            if (yas <= 0) {
                System.debug('Geçerli bir yaş giriniz.');
            }
        } while (yas <= 0);
        
        // Yaşın geçerli olduğu varsayılıyor, istediğiniz işlemleri burada yapabilirsiniz.
        System.debug('Girilen yaş: ' + yas);
    }
}

