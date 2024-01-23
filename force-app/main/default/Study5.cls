public with sharing class Study5 {
    public Study5() {
//opportunity objectinde ,amount değeri 500000 dolar üstü olan,
//satge değeri closed won olan ve close date tarihi 2023 ocak ve 2023 kasım arasında olan opportunityleri gösteren SOQL sorgusu

SELECT Id, Name, Amount, CloseDate, StageName
FROM Opportunity
WHERE Amount >= 500000
    AND StageName = 'Closed Won'
    AND CloseDate >= 2023-01-01
    AND CloseDate <= 2023-11-30
//-----------------------------------------------------------------------------------------------------
//opportunity objectinde,probability yüzdesi %60 ile %85 arasında olan,
//delivery kısmı completed olan,lead osurce değer web olmayan opportunityleri gösteren SOQL sorgusu

SELECT Id, Name, Probability, Delivery_Status__c, LeadSource
FROM Opportunity
WHERE Probability >= 60
    AND Probability <= 85
    AND Delivery_Status__c = 'Completed'
    AND LeadSource != 'Web'
//-------------------------------------------------------------------------------------------------------
//account objectinde,billing state değeri CA olan,customer kısmı customer-direct olan,
//telefon kısmı boş olmayan accountları gösteren SOQL sorgusu

SELECT Id, Name, BillingState, Customer_Type__c, Phone
FROM Account
WHERE BillingState = 'CA'
    AND Customer_Type__c = 'customer-direct'
    AND Phone != null
//-------------------------------------------------------------------------------------------------------
//account objectinde,billing state değeri CA olan,customer kısmı customer-direct olan,
//telefon kısmı boş olmayan accountları gösteren ve bunları bir listede listeleyen SOQL sorgusu
List<Account> accountList = [SELECT Id, Name, BillingState, Customer_Type__c, Phone
                             FROM Account
                             WHERE BillingState = 'CA'
                             AND Customer_Type__c = 'customer-direct'
                             AND Phone != null];
//------------------------------------------------------------------------------------------------------
//Account objectinde UN ile başlayan ve daha önce 
//flow aracılığıyla otomatik mail atılan acoountları bir listede  gösteren SOQL sorgusu
List<Account> accountList = [SELECT Id, Name
                             FROM Account
                             WHERE Name LIKE 'UN%'
                             AND Last_Email_Sent__c != null];
//---------------------------------------------------------------------------------------------------------
//account objectinde,SLA değeri gold olan,ındustry bilgisi education olan,
//rating değeri warm olan hesapların account isminin sonuna ünlem ekleyen SOQL sorgusu

List<Account> accountsToUpdate = [SELECT Id, Name, SLA__c, Industry, Rating
                                  FROM Account
                                  WHERE SLA__c = 'Gold'
                                  AND Industry = 'Education'
                                  AND Rating = 'Warm'];

for (Account acc : accountsToUpdate) {
    acc.Name = acc.Name + '!';
}

update accountsToUpdate;
//-----------------------------------------------------------------------------------------------------------
//opportunity objectindeki tüm müşteri ve telefonlarını alt alta yazdıran  SOQL sorgusu

SELECT Account.Name, Account.Phone, Name, CloseDate, StageName
FROM Opportunity
/---------------------------------------------------------------------------------------------------------------------
//opportunity stage closed wone olan müşterileri ve şirket isimlerini listeleyen  ve bir listede tutan SOQL sorgusu

List<Opportunity> closedWonOpportunities = [SELECT Account.Name, Name, CloseDate
                                           FROM Opportunity
                                           WHERE StageName = 'Closed Won'];

List<String> customerAndCompanyList = new List<String>();

for (Opportunity opp : closedWonOpportunities) {
    customerAndCompanyList.add('Müşteri: ' + opp.Account.Name + ', Şirket İsmi: ' + opp.Name + ', Kapanma Tarihi: ' + opp.CloseDate);
}

// -----------------------------------------------------------------------------------------------------------------------------
misafir objectinde soyadı aynı olan,en az 3kere otelde konaklayan ,
5000 dolardan fazla konaklama ücreti ödeyen kişileri bir listede tutan SOQL sorgusu

List<String> lastNameList = new List<String>();

// SOQL sorgusu: Misafirleri soyadlarına göre gruplayarak, en az 3 kez konaklamış olanları ve toplam ücreti 5000 dolardan fazla olanları seçiyoruz.
for (AggregateResult result : [SELECT LastName, COUNT(Id) stays, SUM(AmountPaid__c) totalAmount
                                FROM Guest__c
                                GROUP BY LastName
                                HAVING COUNT(Id) >= 3 AND SUM(AmountPaid__c) > 5000]) {

    String lastName = (String)result.get('LastName');
    lastNameList.add('Soyadı: ' + lastName + ', Konaklama Sayısı: ' + result.get('stays') + ', Toplam Ücret: ' + result.get('totalAmount'));
}

// --------------------------------------------------------------------------------------------------------------------------------------------
//campaigns objectinde,type kısmı webinar olan,leads in champaign değeri 30 ve üstü olan,
//end date değeri 10.01.2022-10.06.2023 arasında olan,Expected Revenue in Campaign değeri 3000000 üstü olan campaign namelerin tamamını gösteren
 //SQQL sorgusu ile listeleyip,listenin update edilmiş halini her hafta pazartesi admine mail atan  kod

global class WeeklyCampaignEmail implements Schedulable {

    global void execute(SchedulableContext sc) {
        List<Campaign> campaignsToUpdate = [SELECT Id, Name
                                           FROM Campaign
                                           WHERE Type = 'Webinar'
                                           AND Leads_in_Campaign__c >= 30
                                           AND End_Date__c >= 2022-01-10
                                           AND End_Date__c <= 2023-06-10
                                           AND Expected_Revenue_in_Campaign__c >= 3000000];

        // Her hafta pazartesi günü çalıştırıldığında e-posta göndermek için kullanıcı bilgileri
        String adminUserId = 'AdminUserId'; // Admin kullanıcının Salesforce kullanıcı kimliği
        User adminUser = [SELECT Id, Email FROM User WHERE Id = :adminUserId LIMIT 1];

        // Liste üzerinde istediğiniz işlemleri gerçekleştirin (örneğin, liste güncellemek veya e-posta göndermek)
        for (Campaign campaign : campaignsToUpdate) {
            // Liste üzerinde gerekli işlemleri gerçekleştirin
            // Örneğin: System.debug('Campaign Name: ' + campaign.Name);
        }

        // E-posta gönderme işlemi (örneğin, Messaging.SingleEmailMessage sınıfı kullanılarak)
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{adminUser.Email});
        mail.setSubject('Haftalık Kampanya Güncelleme');
        mail.setPlainTextBody('Merhaba,\n\nBu hafta güncellenen kampanya listesi ekteki dosyada bulunmaktadır.');

        // E-posta ekini eklemek için gerektiğiniz işlemleri gerçekleştirin (örneğin, dosya oluşturma ve ek ekleme)

        // E-postayı gönderin
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}
//------------------------------------------------------------------------------------------------------------------------
//campaigns objectinde,Won Opportunities in Campaign değeri 3 ten fazla olan campaigns değerlerini SOQL sorgusuyla listeleyip
// bir listede tutan ve bu liste için otomatik  account  oluşturan kod

global class CreateAccountsFromCampaigns implements Database.Batchable<SObject>, Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Won Opportunities in Campaign değeri 3'ten fazla olan Campaign kayıtlarını listeleyen SOQL sorgusu
        return Database.getQueryLocator('SELECT Id, Name, Won_Opportunities_in_Campaign__c FROM Campaign WHERE Won_Opportunities_in_Campaign__c > 3');
    }

    global void execute(Database.BatchableContext BC, List<Campaign> scope) {
        List<Account> newAccounts = new List<Account>();

        for (Campaign campaign : scope) {
            // Her bir Campaign için yeni bir Account oluştur
            Account newAccount = new Account();
            newAccount.Name = campaign.Name + ' Account';
            newAccount.Description = 'Created from Campaign: ' + campaign.Name;
            // Diğer gerekli alanları doldurabilirsiniz

            newAccounts.add(newAccount);
        }

        // Yeni Account kayıtlarını veritabanına ekleyin
        insert newAccounts;
    }

    global void finish(Database.BatchableContext BC) {
        // Batch işlemi tamamlandığında ek işlemler yapabilirsiniz
    }

    // Schedulable interface'ini uygulamak için execute metodunu uygulayın
    global void execute(SchedulableContext sc) {
        // Apex Scheduled Job tarafından çağrıldığında batch işlemi başlatın
        Database.executeBatch(this);
    }
}

//-------------------------------------------------------------------------------------------------------
//report objectinde,private report oluşturulan opportunityleri SQQL sorgusu ile listeleyip bir listede tutan kod

global class PrivateReportsOpportunities implements Database.Batchable<SObject>, Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Özel raporlara ilişkilendirilmiş fırsatları listeleyen SOQL sorgusu
        return Database.getQueryLocator('SELECT Id, Name, Account.Name, CloseDate FROM Opportunity WHERE Report_Field__c = true');
    }

    global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
        List<String> opportunityList = new List<String>();

        for (Opportunity opp : scope) {
            opportunityList.add('Opportunity Name: ' + opp.Name + ', Account Name: ' + opp.Account.Name + ', Close Date: ' + opp.CloseDate);
        }

        // opportunityList içerisinde istediğiniz bilgiler bulunmaktadır.
    }

    global void finish(Database.BatchableContext BC) {
        // Batch işlemi tamamlandığında ek işlemler yapabilirsiniz
    }

    // Schedulable interface'ini uygulamak için execute metodunu uygulayın
    global void execute(SchedulableContext sc) {
        // Apex Scheduled Job tarafından çağrıldığında batch işlemi başlatın
        Database.executeBatch(this);
    }
}
//---------------------------------------------------------------------------------------------------------------------
//Card Payment Methods objectinde kredi kartı ile ve 5 taksitten fazla olan ödemeleri SQQL sorgusuyla listeleyen 
//ve bu ödemelerin aylık toplam değerini her ay otomatik toplayarak Card Payment Methods objectinde toplam fieldi olarak güncelleyen kod

SELECT Id, Amount, Installments
FROM Card_Payment_Method__c
WHERE Payment_Type__c = 'Credit Card'
    AND Installments > 5
global class MonthlyPaymentUpdater implements Database.Batchable<SObject>, Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Belirli koşulları karşılayan ödemeleri listeleyen SOQL sorgusu
        return Database.getQueryLocator('SELECT Id, Amount, Installments FROM Card_Payment_Method__c WHERE Payment_Type__c = \'Credit Card\' AND Installments > 5');
    }

    global void execute(Database.BatchableContext BC, List<Card_Payment_Method__c> scope) {
        // Aylık toplam değeri hesaplayacak değişken
        Decimal monthlyTotal = 0;

        // Belirtilen koşulları karşılayan her bir ödeme kaydını işleyin
        for (Card_Payment_Method__c payment : scope) {
            // Aylık toplam değeri hesapla
            monthlyTotal += payment.Amount;
        }

        // Card Payment Methods objesindeki toplam alanını güncelle
        if (monthlyTotal > 0) {
            Card_Payment_Method__c totalRecord = [SELECT Id, Total_Amount__c FROM Card_Payment_Method__c LIMIT 1];
            totalRecord.Total_Amount__c += monthlyTotal;
            update totalRecord;
        }
    }

    global void finish(Database.BatchableContext BC) {
        // Batch işlemi tamamlandığında ek işlemler yapabilirsiniz
    }

    // Schedulable interface'ini uygulamak için execute metodunu uygulayın
    global void execute(SchedulableContext sc) {
        // Apex Scheduled Job tarafından çağrıldığında batch işlemi başlatın
        Database.executeBatch(this);
    }
}
//--------------------------------------------------------------------------------------------------------------------------------
//opportunity objectinde,opportunity name ile current  generator değerini bir mapta tutan SOQL sorgusu
Map<String, Decimal> opportunityMap = new Map<String, Decimal>();

// SOQL sorgusu: Opportunity objesinden Opportunity Name ve Current Generator alanlarını al
for (Opportunity opp : [SELECT Name, Current_Generator__c FROM Opportunity LIMIT 10]) {
    opportunityMap.put(opp.Name, opp.Current_Generator__c);
}

// Harita üzerinde işlem yapma örneği
for (String oppName : opportunityMap.keySet()) {
    Decimal currentGeneratorValue = opportunityMap.get(oppName);
    System.debug('Opportunity Name: ' + oppName + ', Current Generator: ' + currentGeneratorValue);
}


//-------------------------------------------------------------------------------------------------------------------
//Opportunity objesinde ,probability değeri %80 ve üstünü  bir mapte tutan SOQL sorgusu
Map<Id, Opportunity> highProbabilityOpportunities = new Map<Id, Opportunity>();

// SOQL sorgusu: Probability değeri %80 ve üstü olan Opportunity kayıtlarını al
for (Opportunity opp : [SELECT Id, Name, Probability FROM Opportunity WHERE Probability >= 80]) {
    highProbabilityOpportunities.put(opp.Id, opp);
}

// Harita üzerinde işlem yapma örneği
for (Id oppId : highProbabilityOpportunities.keySet()) {
    Opportunity opp = highProbabilityOpportunities.get(oppId);
    System.debug('Opportunity Name: ' + opp.Name + ', Probability: ' + opp.Probability);
   
}
//--------------------------------------------------------------------------------------------------------------------
//account objecti için  account güncelleme dml sorgusu


// Yeni bir Account oluşturmak için
Account newAccount = new Account();
newAccount.Name = 'Yeni Müşteri';
newAccount.Industry = 'Teknoloji';


insert newAccount;

// Account güncellemek için
Account existingAccount = [SELECT Id, Name, Industry FROM Account WHERE Name = 'Bir Müşteri' LIMIT 1];
existingAccount.Industry = 'Yeni Endüstri';


update existingAccount;

// Account silmek için
Account accountToDelete = [SELECT Id FROM Account WHERE Name = 'Silinecek Müşteri' LIMIT 1];

if (accountToDelete != null) {
    delete accountToDelete;
}
//----------------------------------------------------------------------------------------------------------------
//misafir objectinde otele3.kez gelen misafirlerin toplam amount değerini %15 indirim yapacak şekilde 
//güncelleyen ve bu güncellenmiş kişileri  yeni bir listede tutan SOQL sorgusu

List<Guest__c> updatedGuestList = new List<Guest__c>();

// SOQL sorgusu: Otele 3 kez veya daha fazla gelen misafirleri seç
List<Guest__c> guestsToUpdate = [SELECT Id, Name, Visit_Count__c, Amount__c FROM Guest__c WHERE Visit_Count__c >= 3];

// Güncellenmiş misafirleri bir listeye ekleyen ve %15 indirim uygulayan kod
for (Guest__c guest : guestsToUpdate) {
    guest.Amount__c *= 0.85; // %15 indirim
    updatedGuestList.add(guest);
}

// Güncellenmiş misafirleri veritabanına geri yazma
update updatedGuestList;
//----------------------------------------------------------------------------------------------------------









    }
}