public with sharing class undefined {
    public undefined() {
public class ForLoopExample {
    public static void main() {
        // For döngüsü ile 23'ten 73'e kadar 4'er 4'er artan sayıları yazdırma
        for (Integer i = 23; i <= 73; i += 4) {
            System.debug(i);
        }
    }
}
//......................................................................................................................................
public class Main {
    public static void  {
        
        // create an array
        Integer[] numbers = new Integer[]{3, 7, 5, -5};
        
        // iterating through the array 
        for (Integer number : numbers) {
            System.debug(number);
        }
    }
}
//........................................................................................................................................

public class Main {
    public static void  {
        
        Integer sum = 0;
        Integer n = 1000;

        // for loop
        for (Integer i = 1; i <= n; i++) {
            // body inside for loop
            sum += i;  // sum = sum + i
        }
       
        System.debug('Sum = ' + sum);
    }
}


//......................................................................................................................................

public class TrianglePattern {
    public static void  {
        Integer i, k; // Değişkenlerimizi tanımladık.
        Integer symbol = 1; // Yıldızımızın program başlangıcında, kaç tane yıldız yazdıracağını belirtiriz.

        for (k = 0; k < 9; k++) { // Döngümüzün kaç kere döneceğini ve kaça kadar yıldız yazdıracağını belirtir.
            for (i = 0; i < symbol; i++) { // Yıldızımızın satırlarda kaçar kaçar basılacağını belirttik.
                System.debug('*'); // Sembolümüzü belirttik.
            }
            System.debug(''); // Yıldızlarımız basıldıktan sonra alt satıra geçilmesini sağlıyoruz.
            symbol++; // Yıldızımızın birer birer artmasını sağlarız.
        }
    }
}
//...........................................................................................................


public class ReverseTrianglePattern {
    public static void {
        Integer i, k; // Değişkenlerimizi tanımladık.
        Integer symbol = 9; // Yıldız sembolümüzün program başlangıçta, 9 tane yıldız yazdıracağını belirtiriz.

        for (k = 0; k < 9; k++) { // Döngümüzün kaç kere döneceğini ve kaça kadar yıldız yazdıracağını belirtir.
            for (i = 0; i < symbol; i++) { // Yıldızımızın satırlarda kaçar kaçar basılacağını belirttik.
                System.debug('*'); // Sembolümüzü belirttik.
            }
            System.debug(''); // Yıldızlarımız basıldıktan sonra alt satıra geçilmesini sağlıyoruz.
            symbol--; // Yıldızımızın birer birer azalmasını sağlarız.
        }
    }
}
//............................................................................................................................................

public class TrianglePattern {
    public static void  {
        Integer i, j, k; // Değişkenlerimizi tanımladık.

        for (i = 1; i < 10; i++) { // Döngümüzün ne kadar döneceğini belirtir.
            for (j = i; j < 10; j++) { // Üçgenimizi yaparken ekran çıktısının sol tarafındaki boşluğu belirtir.
                System.debug(' '); // Boşluğumuzu belirtiyoruz.
            }
            for (k = 1; k <= i; k++) { // Yıldız sembolümüzün yazılmasını sağlar.
                System.debug('*'); // Sembolümüzü belirledik ve çıktısını sağladık.
                System.debug(' '); // Yıldız sembolümüzün arasına boşluk koyulmasını sağlar.
            }
            System.debug(' '); // Döngüden sonra diğer satıra atlamamızı sağlar.
        }
    }
}
//..................................................................................................................................................


public class ReverseTrianglePattern {
    public static void  {
        Integer i, j, k; // Değişkenlerimizi tanımladık.

        for (i = 10; i > 0; i--) { // Döngümüzün ne kadar döneceğini belirtir.
            for (j = i; j < 10; j++) { // Üçgenimizi yaparken ekran çıktısının sol tarafındaki boşluğu belirtir.
                System.debug(' '); // Boşluğumuzu belirtiyoruz.
            }
            for (k = 1; k <= i; k++) { // Yıldız sembolümüzün yazılmasını sağlar.
                System.debug('*'); // Sembolümüzü belirledik ve çıktısını sağladık.
                System.debug(' '); // Yıldız sembolümüzün arasına boşluk koyulmasını sağlar.
            }
            System.debug(''); // Döngüden sonra diğer satıra atlamamızı sağlar.
        }
    }
}
//.........................................................................................................................................................

Bir cümlenin her kelimesinin baş harflerini renklendiren apex kodu


public class CapitalizeFirstLetters {

    public static String capitalizeWords(String input) {
        if (input == null || input.trim().isEmpty()) {
            return input;
        }

        String[] words = input.split(' ');
        String result = '';

        for (Integer i = 0; i < words.size(); i++) {
            String word = words[i];
            String capitalizedWord = capitalizeFirstLetter(word);

            if (i == 0) {
                result += capitalizedWord;
            } else {
                result += ' ' + capitalizedWord;
            }
        }

        return result;
    }

    private static String capitalizeFirstLetter(String word) {
        if (word == null || word.isEmpty()) {
            return word;
        }

        return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
    }

    public static void main(String[] args) {
        String sentence = 'merhaba dünya';
        String capitalizedSentence = capitalizeWords(sentence);

        System.debug('Original Sentence: ' + sentence);
        System.debug('Capitalized Sentence: ' + capitalizedSentence);
    }
}

//......................................
public class ForLoopStarExample {
    public static void main() {
        // For döngüsü ile 1'den başlayarak 15 adım alt alta yıldız yazdırma
        for (Integer i = 1; i <= 15; i++) {
            System.debug('*');
        }
    }
}
//..........................................................................................................................................
public class ForLoopDecrementExample {
    public static void main() {
        String cumle = 'Merhaba Dünya';

        for (Integer i = cumle.length(); i >= 1; i--) {
            System.debug(cumle.substring(0, i));
        }
    }
}
//.........................................................................................................................................
verilen bir kelimenin harflerinin ascı kodunu yazdıran apex kodu
public class AsciiCodeOfLetters {

    public static void printAsciiCodes(String word) {
        if (word != null && !word.isEmpty()) {
            for (Integer i = 0; i < word.length(); i++) {
                char letter = word.charAt(i);
                Integer asciiCode = (Integer) letter;
                System.debug('ASCII code for \'' + letter + '\': ' + asciiCode);
            }
        } else {
            System.debug('Input word is null or empty.');
        }
    }

    public static void main(String[] args) {
        String sampleWord = 'hello';
        printAsciiCodes(sampleWord);
    }
}


//.....................................................................................................
opportunity objectindeki tüm müşteri ve telefonlarını alt alta uazdıran apex kodu
public class OpportunityCustomerPhoneList {

    public static void displayCustomerPhoneList() {
        List<Opportunity> opportunities = [SELECT Id, Name, Account.Name, Account.Phone FROM Opportunity];

        for (Opportunity opp : opportunities) {
            String customerName = opp.Account != null ? opp.Account.Name : 'Müşteri Bulunamadı';
            String customerPhone = opp.Account != null ? opp.Account.Phone : 'Telefon Bulunamadı';

            System.debug('Opportunity Adı: ' + opp.Name);
            System.debug('Müşteri Adı: ' + customerName);
            System.debug('Telefon: ' + customerPhone);
            System.debug('------------------------');
        }
    }
}
//...................................................................................................................
opportunity stage closed wone olan müşterileri ve şirket isimlerini alt alta yazdıran apex kodu
public class ClosedWonOpportunityList {

    public static void displayClosedWonOpportunities() {
        List<Opportunity> closedWonOpportunities = [SELECT Id, Name, Account.Name FROM Opportunity WHERE StageName = 'Closed - Won'];

        for (Opportunity opp : closedWonOpportunities) {
            if (opp.Account != null) {
                System.debug('Müşteri Adı: ' + opp.Account.Name);
                System.debug('Şirket Adı: ' + opp.Account.Name);
                System.debug('------------------------');
            }
        }
    }
}
//........................................................................................................................................
User
account objecti içinde endustry fieldi içinde oil geçen accountları alt alta yazdıran apex kodu
public class OilIndustryAccountList {

    public static void displayOilIndustryAccounts() {
        List<Account> oilIndustryAccounts = [SELECT Id, Name, Industry FROM Account WHERE Industry LIKE '%Oil%'];

        for (Account acc : oilIndustryAccounts) {
            System.debug('Hesap Adı: ' + acc.Name);
            System.debug('Endüstri: ' + acc.Industry);
            System.debug('------------------------');
        }
    }
}
//.......................................................................................................................................................
account objecti içinde SLA Expiration Date değeri son 3 yıl olan accountları apex kodu
public class SLAExpirationDateList {

    public static void displaySLAExpirationDateAccounts() {
        Date threeYearsAgo = Date.today().addYears(-3);

        List<Account> accountsWithSLAExpiry = [SELECT Id, Name, SLA_Expiration_Date__c FROM Account WHERE SLA_Expiration_Date__c >= :threeYearsAgo];

        for (Account acc : accountsWithSLAExpiry) {
            System.debug('Hesap Adı: ' + acc.Name);
            System.debug('SLA Expiration Date: ' + acc.SLA_Expiration_Date__c);
            System.debug('------------------------');
        }
    }
}
//........................................................................................................................................................
lead objecti içinde website url bilgisi dolu olan telefon bilgisi boş olan leadleri apex kodu
public class WebsiteWithoutPhoneLeadList {

    public static void displayLeads() {
        List<Lead> leads = [SELECT Id, Name, Website, Phone FROM Lead WHERE Website != null AND Phone = null];

        for (Lead ld : leads) {
            System.debug('Lead Adı: ' + ld.Name);
            System.debug('Website: ' + ld.Website);
            System.debug('Telefon: Bilgi Yok');
            System.debug('------------------------');
        }
    }
}
//..........................................................................................................................................................
misafir objectinde soyadı aynı olan,en az 3kere otelde konaklayan ,5000 dolardan fazla konaklama ücreti ödeyen kişileri bir listede sıralayan apex kodu
public class GuestList {

    public static void displayGuests() {
        Map<String, Integer> guestLastNameCount = new Map<String, Integer>();
        List<Guest__c> eligibleGuests = new List<Guest__c>();

        // Misafirleri çek
        List<Guest__c> guests = [SELECT Id, FirstName__c, LastName__c, StayCount__c, TotalPayment__c FROM Guest__c];

        // Soyadı aynı olan misafir sayısını ve toplam ödemeyi hesapla
        for (Guest__c guest : guests) {
            if (guestLastNameCount.containsKey(guest.LastName__c)) {
                guestLastNameCount.put(guest.LastName__c, guestLastNameCount.get(guest.LastName__c) + 1);
            } else {
                guestLastNameCount.put(guest.LastName__c, 1);
            }
        }

        // Soyadı aynı olan en az 3 kez konaklayan ve toplam ödeme 5000 dolardan fazla olan misafirleri seç
        for (Guest__c guest : guests) {
            if (guestLastNameCount.get(guest.LastName__c) >= 3 && guest.TotalPayment__c > 5000) {
                eligibleGuests.add(guest);
            }
        }

        // Sonuçları ekrana yazdır
        for (Guest__c guest : eligibleGuests) {
            System.debug('Misafir Adı: ' + guest.FirstName__c + ' ' + guest.LastName__c);
            System.debug('Toplam Konaklama Sayısı: ' + guest.StayCount__c);
            System.debug('Toplam Ödeme: ' + guest.TotalPayment__c);
            System.debug('------------------------');
        }
    }
}
//.....................................................................................................................................................
opportunity objecti içinde amountu 500000 dolardan fazla olan,
probability değeri 70 ve üstünde olan,closed kısmı evet olan opportunniyleri  yazdıran apex kodu

public class HighValueOpportunityList {

    public static void displayHighValueOpportunities() {
        List<Opportunity> highValueOpportunities = [SELECT Id, Name, Amount, Probability, IsClosed FROM Opportunity 
                                                     WHERE Amount > 500000 AND Probability >= 70 AND IsClosed = true];

        for (Opportunity opp : highValueOpportunities) {
            System.debug('Fırsat Adı: ' + opp.Name);
            System.debug('Miktar: ' + opp.Amount);
            System.debug('Probability: ' + opp.Probability);
            System.debug('Kapalı mı? ' + opp.IsClosed);
            System.debug('------------------------');
        }
    }
}
//.....................................................................................................................................................................
contact objectinde,3 ten fazla case açılan,2 den fazla mail atılan ve flow ile işlem yapılan contactları gösteren apex kodu
public class ContactDetails {

    public static void displayContacts() {
        List<Contact> contacts = [SELECT Id, Name 
                                  FROM Contact 
                                  WHERE Id IN (SELECT ContactId FROM Case GROUP BY ContactId HAVING COUNT(Id) > 3)
                                  AND Id IN (SELECT WhoId FROM EmailMessage WHERE MessageDate = LAST_N_DAYS: 30 GROUP BY WhoId HAVING COUNT(Id) > 2)];

        for (Contact con : contacts) {
            System.debug('İletişim Adı: ' + con.Name);
            // Diğer gerekli bilgileri ekleyebilirsiniz
            System.debug('------------------------');
        }
    }
}
//.............................................................................................................................................................................
opportunitiy objectinde  stage değeri Qualification olan,close date tarihi 2023 şubat ile ağustos arasında olan,
probability yüzde 15 altında olan hesapları gösteren apex kodu

public class QualificationOpportunityList {

    public static void displayQualificationOpportunities() {
        List<Opportunity> qualificationOpportunities = [SELECT Id, Name, StageName, CloseDate, Probability FROM Opportunity 
                                                         WHERE StageName = 'Qualification' 
                                                         AND CloseDate >= 2023-02-01 AND CloseDate <= 2023-08-31 
                                                         AND Probability < 15];

        for (Opportunity opp : qualificationOpportunities) {
            System.debug('Fırsat Adı: ' + opp.Name);
            System.debug('Aşama: ' + opp.StageName);
            System.debug('Kapanış Tarihi: ' + opp.CloseDate);
            System.debug('Olasılık: ' + opp.Probability);
            System.debug('------------------------');
        }
    }
}
//............................................................................................................................................................................
campaigns objectinde attachment kısmına dosya yüklenmiş olan,type kısmı direct mail olmayan,campaign currency US DOLAR olan,ve aktive kısmı evet olan,
status kısmı completed olmayan campaign değerlerini yazdıran apex kodu
public class CampaignList {

    public static void displayCampaigns() {
        List<Campaign> campaigns = [SELECT Id, Name, Type, CurrencyIsoCode, IsActive, Status FROM Campaign 
                                    WHERE Id IN (SELECT LinkedEntityId FROM ContentDocumentLink WHERE ContentDocument.FileType != 'SNOTE' AND LinkedEntity.Type = 'Campaign')
                                    AND Type != 'Direct Mail' 
                                    AND CurrencyIsoCode = 'USD' 
                                    AND IsActive = true 
                                    AND Status != 'Completed'];

        for (Campaign camp : campaigns) {
            System.debug('Kampanya Adı: ' + camp.Name);
            System.debug('Tip: ' + camp.Type);
            System.debug('Para Birimi: ' + camp.CurrencyIsoCode);
            System.debug('Aktif mi? ' + camp.IsActive);
            System.debug('Durum: ' + camp.Status);
            System.debug('------------------------');
        }
    }
}
//..............................................................................................................................................................................
task objecti içinde today task değerlerini getiren,ve flow ile otomatik yanıtlanan,validation rule içeren taskleri apex kodu 
public class TaskList {

    public static void displayTasks() {
        Date today = Date.today();
        List<Task> tasks = [SELECT Id, Subject, Status, IsClosed, ActivityDate, Owner.Name FROM Task 
                            WHERE ActivityDate = :today AND IsClosed = true];

        for (Task tsk : tasks) {
            System.debug('Görev Adı: ' + tsk.Subject);
            System.debug('Durum: ' + tsk.Status);
            System.debug('Kapalı mı? ' + tsk.IsClosed);
            System.debug('Atanan Kullanıcı: ' + tsk.Owner.Name);
            System.debug('------------------------');
        }
    }
}
//...............................................................................................................................................................
account objectinde account aktif değeri aktif olmayacak şekilde değiştiğinde  tüm account sahiplerine otomatik mail atan apex kodu
// Account Trigger
trigger AccountTrigger on Account (after update) {
    // Liste, güncellenmiş hesapların ID'lerini saklar
    List<Id> updatedAccountIds = new List<Id>();
    
    // Hesapları kontrol et ve durumu değişenleri listeleyin
    for (Account acc : Trigger.new) {
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if (acc.IsActive != oldAcc.IsActive) {
            updatedAccountIds.add(acc.Id);
        }
    }
    
    // Eğer durumu değişen hesaplar varsa, e-posta gönder
    if (!updatedAccountIds.isEmpty()) {
        sendEmails(updatedAccountIds);
    }
}
//....................................................................................................................................................................
case objectinde,subject bölümünde contact kuran kişi lauren boyle olan,statusu closed olan,
priority bölümü high yada medium olan,date time tarihi son 3 ay olan caselerin listesini gösteren apex kodu
public class CaseQuery {

    public static List<Case> getFilteredCases() {
        // Liste, belirli kriterlere uyan Case kayıtlarını saklar
        List<Case> filteredCases = new List<Case>();

        // Tarih aralığını belirle: Son 3 ay
        Date threeMonthsAgo = Date.today().addMonths(-3);

        // Case kayıtlarını sorgula
        for (Case c : [SELECT Id, Subject, Contact.Name, Status, Priority, CreatedDate
                       FROM Case
                       WHERE Contact.Name = 'Lauren Boyle'
                       AND Status = 'Closed'
                       AND (Priority = 'High' OR Priority = 'Medium')
                       AND CreatedDate >= :threeMonthsAgo]) {
            filteredCases.add(c);
        }

        return filteredCases;
    }

    public static void displayFilteredCases() {
        List<Case> cases = getFilteredCases();

        // Sorgulanan Case kayıtlarını ekrana yazdır
        for (Case c : cases) {
            System.debug('Case ID: ' + c.Id);
            System.debug('Subject: ' + c.Subject);
            System.debug('Contact: ' + c.Contact.Name);
            System.debug('Status: ' + c.Status);
            System.debug('Priority: ' + c.Priority);
            System.debug('Created Date: ' + c.CreatedDate);
        }
    }
}
//........................................................................................................................................................
opportunity objectinde amount değeri 500000 dolar ve üstü olan,
stage değeri closed won olan,close date tarihi son bir ay olan opportunity listesini admine otomatik mail atan apex kodu
public class OpportunityEmailNotification {

    public static void sendNotificationToAdmin() {
        // Liste, belirli kriterlere uyan Opportunity kayıtlarını saklar
        List<Opportunity> filteredOpportunities = new List<Opportunity>();

        // Tarih aralığını belirle: Son 1 ay
        Date oneMonthAgo = Date.today().addMonths(-1);

        // Opportunity kayıtlarını sorgula
        for (Opportunity opp : [SELECT Id, Name, Amount, StageName, CloseDate
                                FROM Opportunity
                                WHERE Amount >= 500000
                                AND StageName = 'Closed Won'
                                AND CloseDate >= :oneMonthAgo]) {
            filteredOpportunities.add(opp);
        }

        // Eğer kriterlere uyan Opportunity kayıtları varsa, e-posta gönder
        if (!filteredOpportunities.isEmpty()) {
            sendEmailToAdmin(filteredOpportunities);
        }
    }

    private static void sendEmailToAdmin(List<Opportunity> opportunities) {
        // Burada e-posta gönderme mantığını ekleyin
        // Örnek olarak, Messaging.SingleEmailMessage kullanabilirsiniz
        // Bu örnekte e-posta gönderme mantığı eklenmedi
        // Gerçek uygulamada, uygun e-posta gönderme yöntemini uygulamalısınız
        // Örneğin, e-posta gönderme servisine API çağrısı yapabilirsiniz
        // veya e-posta gönderme kuyruğu oluşturabilir ve asenkron olarak işleyebilirsiniz
        // Bu örnekte sadece bir consol logu yazdık.
        
        String emailBody = 'Aşağıdaki Opportunities, belirtilen kriterlere uyan fırsatları temsil eder:\n\n';
        for (Opportunity opp : opportunities) {
            emailBody += 'Opportunity Name: ' + opp.Name + '\n';
            emailBody += 'Amount: $' + opp.Amount + '\n';
            emailBody += 'Stage: ' + opp.StageName + '\n';
            emailBody += 'Close Date: ' + opp.CloseDate + '\n\n';
        }
        
        System.debug('Email sent to admin:\n' + emailBody);
        // Burada gerçek e-posta gönderme kodunu ekleyebilirsiniz.
    }
}
//.........................................................................................................................................................
account objesinde,billing state değeri CA olan,type değeri customer-direct olan,
telefon numarası olmayan accountları listeleyen apex kodu
public class AccountQuery {

    public static List<Account> getFilteredAccounts() {
        // Liste, belirli kriterlere uyan Account kayıtlarını saklar
        List<Account> filteredAccounts = new List<Account>();

        // Account kayıtlarını sorgula
        for (Account acc : [SELECT Id, Name, BillingState, Type, Phone
                            FROM Account
                            WHERE BillingState = 'CA'
                            AND Type = 'Customer - Direct'
                            AND (Phone = null OR Phone = '')]) {
            filteredAccounts.add(acc);
        }

        return filteredAccounts;
    }

    public static void displayFilteredAccounts() {
        List<Account> accounts = getFilteredAccounts();

        // Sorgulanan Account kayıtlarını ekrana yazdır
        for (Account acc : accounts) {
            System.debug('Account ID: ' + acc.Id);
            System.debug('Name: ' + acc.Name);
            System.debug('Billing State: ' + acc.BillingState);
            System.debug('Type: ' + acc.Type);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

    }
}