/*
-- 1.Scrivi una query per verificare che il campo ProductKey 
nella tabella DimProduct sia una chiave primaria. 
Quali considerazioni/ragionamenti è necessario che tu faccia?
*/
select count(productkey) as numero_righe,
	count(distinct Productkey) as conteggio_distinct 
from AdventureWorksDW.dimproduct;

/*
-- 2.Scrivi una query per verificare che la combinazione 
dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK;
*/
Select 
	count(*)
    From
    factresellersales
    group by SalesOrderNumber, SalesOrderLineNumber
    Having count(*)>1;
    
   /*
   -- 3.Conta il numero transazioni (SalesOrderLineNumber) 
    realizzate ogni giorno a partire dal 1 Gennaio 2020;
    */
    Select 
    OrderDate,
    count(Distinct Salesorderlinenumber) as numero_ordini
    from factresellersales
    where OrderDate >= "2020.01.01."
    Group by OrderDate 
    order by OrderDate
/*
4.Calcola il fatturato totale (FactResellerSales.SalesAmount), 
la quantità totale venduta (FactResellerSales.OrderQuantity) 
e il prezzo medio di vendita (FactResellerSales.UnitPrice) 
per prodotto (DimProduct) a partire dal 1 Gennaio 2020. 
Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, 
la quantità totale venduta e il prezzo medio di vendita.
 I campi in output devono essere parlanti!
 */
 ;
 Select 
 P.EnglishProductName, P.ProductKey,
 sum(S.SalesAmount) as FatturatoTotale,
 sum(S.Orderquantity) as Quantitatotale,
 AVG(S.Unitprice) as Prezzomedio
	from 
  factresellersales as S
	join 
 dimproduct P on S.Productkey= P.Productkey
 where 
	S.Orderdate >= '2020.01.01'
 Group by P.EnglishProductName, P.ProductKey;
    /*
    -- 5.Calcola il fatturato totale (FactResellerSales.SalesAmount) 
    e la quantità totale venduta (FactResellerSales.OrderQuantity) 
    per Categoria prodotto (DimProductCategory). 
    Il result set deve esporre pertanto il nome della categoria prodotto, 
    il fatturato totale e la quantità totale venduta. 
    I campi in output devono essere parlanti!
    */
    Select 
    dpc.Englishproductcategoryname as Nome_categoria,
    sum(frs.Salesamount) as Fatturato_Totale,
    sum(frs.Orderquantity) as Quantita_totale_venduta,
    avg(frs.Unitprice) as Prezzo_Medio_Vendita
    from
    dimproductcategory as dpc
    left join
    dimproductsubcategory as dpsc on dpc.ProductCategoryKey= dpsc.ProductCategoryKey
    left join
    dimproduct as dp on dpsc.ProductSubcategoryKey= dp.ProductSubcategoryKey
    left join
    factresellersales as frs on dp.ProductKey= frs.ProductKey
    group by dpc.EnglishProductCategoryName; 
    /*
    -- 6.Calcola il fatturato totale per area città (DimGeography.City) 
    realizzato a partire dal 1 Gennaio 2020. 
    Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
    */
    Select
    dimgeography.City,
    sum(factresellersales.Salesamount) as Totale_Fatturato
    from
    factresellersales
    join
    dimreseller on factresellersales.ResellerKey= dimreseller.resellerkey
    join 
    dimgeography on dimreseller.GeographyKey= dimgeography.GeographyKey
    where
    factresellersales.orderdate >= '2020.01.01'
    group by dimgeography.city;
    