       identification division.
       program-id. calculetteTVA.

       environment division.
       configuration section.

       data division.
       working-storage section.
           01 price          pic 9(7)v99.
           01 priceHT       pic 9(5)v99.   
           01 tva-type      pic 9.
           01 tva-rate      pic 9(2)v99.

           01 tva1          pic 9(2)v99 value 20.  *> 20% de TVA
           01 tva2          pic 9(2)v99 value 10.  *> 10% de TVA
           01 tva3          pic 9(2)v99 value 5.   *> 5% de TVA.

       procedure division.
           display 'Entrez le prix : '.
           accept price.
           display 'Prix saisi : ' price.
           display 'Entrez le type de TVA (1, 2 ou 3) : '.
           accept tva-type.
           display 'Type de TVA saisi : ' tva-type.

           perform calculate-priceHT.

           display 'Le prix HT est : ' priceHT.
           goback.

       calculate-priceHT.
           if tva-type = 1
               move tva1 to tva-rate
           else if tva-type = 2
               move tva2 to tva-rate
           else if tva-type = 3
               move tva3 to tva-rate
           else
               display 'Type de TVA invalide'
               stop run.

           compute priceHT = price / (1 + (tva-rate / 100)).

       end program calculetteTVA.
       
