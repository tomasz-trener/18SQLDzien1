CREATE TABLE zawodnicy(
	id_zawodnika int NULL,
	id_trenera int  NULL,
	imie varchar(255) NULL,
	nazwisko varchar(255) NULL,
	kraj varchar(255) NULL,
	data_ur DATE NULL,
	wzrost int  NULL,
	waga int  NULL
) 

 select * from zawodnicy


 select 5 , 6  , 7+2, 7-1, 2*3, 10.0/3


 select 5, imie, nazwisko, wzrost+5 as nowyWzrost, wzrost from zawodnicy
  select 5, imie, nazwisko, wzrost+5 [nowy Wzrost], wzrost from zawodnicy
   select 5, imie, nazwisko, wzrost+5 as 'nowy Wzrost', wzrost from zawodnicy

   select imie, nazwisko, (wzrost*2)/3
   from zawodnicy

   -- str 8 , cw 4-5

   --1 
    select imie, nazwisko, wzrost*1.46 [max dl nart]
	from zawodnicy
   -- 2 
   select imie, nazwisko, waga/(wzrost/100.0 * wzrost/100.0) bmi
   from zawodnicy

	select wzrost, wzrost/100 from zawodnicy

	-- funkcje 
	-- potêgowanie : power
	-- zaokr¹galnie : round
	-- formatowanie : format 

	select imie, nazwisko, waga / power(wzrost/100.0,2) bmi
	from zawodnicy

	
	select imie, nazwisko, round(waga / power(wzrost/100.0,2),2) bmi
	from zawodnicy

	select imie, nazwisko, format(round(waga / power(wzrost/100.0,2),2),'00.00') bmi
	from zawodnicy

	select imie, nazwisko, format(waga / power(wzrost/100.0,2),'0.00') bmi
	from zawodnicy

	-- zad nr 6 
	select imie + ' ' + nazwisko   + ' hej'
	from zawodnicy

	select nazwisko + ', ' + imie + ' (' + kraj + ')'
	from zawodnicy

	-- zad nr 7 

	select distinct kraj from zawodnicy

	-- funkcje matematyczne 

	select abs(-5) , abs(5) , ceiling(2.3), floor(2.7), POWER(2,3), 
		sqrt(9), sign(3), sign(-4), sign(0) 

		--https://www.w3schools.com/sql/

	-- funkcje tekstowe 

	select len('ala ma kota'), -- d³ugoœæ  tekstu
	       upper('ala ma kota'), -- zmiana na duze literki
		   LOWER('ala ma kota'), -- zamiana na ma³e
		   CHARINDEX('ma','ala ma kota'),
		              --   12345
		   LEFT('ala ma kota',3),
		   UPPER(LEFT('ala ma kota',1)),
		   RIGHT('ala ma kota',2),
		   LTRIM('    ala ma kota'),
		   RTRIM('    ala ma kota'),
		   REPLACE('ala ma kota','ma','bêdzie mia³a'),
		   SUBSTRING('ala ma kota',5,2)
		            --12345
	--str 15 : 29-31

	select imie + ' ' + 
		upper(LEFT(nazwisko,1)) +  -- pierwszy znak
		lower(RIGHT(nazwisko, len(nazwisko)-1)) -- pozosta³e
	from zawodnicy

	select imie + ' ' + 
		 upper(SUBSTRING(nazwisko,1,1))+  -- pierwszy znak
		 LOWER(SUBSTRING(nazwisko,2,LEN(nazwisko)-1)) -- pozosta³e
	from zawodnicy


	select imie + ' ' + LEFT(nazwisko,1) + '.'
	from zawodnicy

	select imie + nazwisko from zawodnicy
	select imie , nazwisko from zawodnicy

	select nazwisko, kraj, data_ur
	from zawodnicy

	select imie + ' ' + nazwisko + ' wa¿y ' + FORMAT(waga,'000') + ' kg' 
	from zawodnicy

	select imie + ' ' + nazwisko + ' wa¿y ' + convert(varchar,waga) + ' kg' 
	from zawodnicy

	
	select imie + ' ' + nazwisko + ' wa¿y ' + CAST(waga as varchar) + ' kg' 
	from zawodnicy

	select CONVERT(int , '4')+6
	select CONVERT(varchar,4) + '6'

	-- wypisz wszystkich zawodników ale tak, ¿e
	-- zamieñ litrekê 'a' na 'e' natomiast 'e' zamieñ na 'a' w nazwiskach 

	-- ale  -> ela -> ale

	select REPLACE(REPLACE(nazwisko,'A','E'),'E','A')
	from zawodnicy

	select REPLACE(
			REPLACE(
				REPLACE(nazwisko,'A','_'),
				'E',
				'A'),
			'_',
			'E')
	 from zawodnicy

	 select REPLACE(REPLACE(REPLACE(nazwisko,'A','_'),'E','A'),'_','E')
	 from zawodnicy
	 -- BACHLEDA -> 
	 -- BECHLADE

	 -- przerwa do godz 12 


	 -- funkcje przetwrzaj¹ce date 

	 select GETDATE(), 
	        DATEFROMPARTS(2022,12,7),
			DATEADD(m,2,GETDATE()),      -- m miesiac, d- dzien , y - rok
			DATEDIFF(d, GETDATE(), datefromparts(2022,12,31)),
			DAY(getdate()), 
			MONTH(getdate()),
			YEAR(getdate())
 
 -- 1) podaj wiek zawodników

select imie, nazwisko, DATEDIFF(year, data_ur, getdate()) wiek
from zawodnicy

 -- 2) dla kazdego zawodnika podaj date ich urodzin w aktualnym roku
 
 select imie, nazwisko , 
	DATEFROMPARTS(
		year(getdate()), 
		MONTH(data_ur),
		day(data_ur)) [data urodzin]
 from zawodnicy

 -- 3) podaj ile dni ma miesiac w którym dany zawodnik siê urodzi³
 
 select imie, nazwisko, 
	--                        +1 miesiac   -1 dzien     -> wziac dzien
	-- 07.12.2022 -> 1.12.2022 -> 1.01.2023 -> 31.12.2022
	DAY(
		DATEADD(D,-1,
			DATEADD(M,1,
				DATEFROMPARTS(year(2022), MONTH(data_ur), 1))))
 from zawodnicy


 -- 4) podaj kiedy s¹ najbli¿sze urodziny zawodnika wraz z podaniem za ile 
        -- dni one bed¹ 

select * from zawodnicy
 

 select imie, nazwisko , data_ur, 
	datefromparts(
		year(getdate())+
			(SIGN(
				DATEDIFF(d, 
					DATEFROMPARTS(
						year(getdate()), 
						MONTH(data_ur),
						day(data_ur)),
					 GETDATE()))+1)	/2,
		MONTH(data_ur), 
		day(data_ur))
 from zawodnicy

 -- jezeli zawodnik mial urodziny w 
 -- tym roku to do daty urodziny dodajemy 1 
 -- a jak nie mial urodzin to dodajemy 0 

 -- jak sprawdzic czy mial urodziny ? 
 -- sprawdz roznice w dniach pomiedzy dzisijsza data a data jego urodzin
 -- jak roznica jest dodania to wtedy 0 wpp. dodajemy 

 -- daty, tekst i liczby 

 --https://github.com/tomasz-trener/18SQLDzien



select *
from zawodnicy 
where kraj='pol' and wzrost >= 180

-- ktorzy zawodnicy maja wzrost 
-- w przedziale 60 a 175 

select * 
from zawodnicy
where wzrost > 60 and wzrost < 175

-- wypisz tylko niemieckojezycznych zawodnikow

select imie, nazwisko 
from zawodnicy
where kraj = 'ger' or kraj = 'aut'

select *
from zawodnicy
where waga /2 > 30


select *
from zawodnicy
where POWER(waga,2) > 300

-- wypisz zawodnikow, gorzy maja bmi mniejsze niz 20

select *, waga/POWER(wzrost/100.0,2) bmi
from zawodnicy
where waga/POWER(wzrost/100.0,2) < 20

select *, waga/POWER(wzrost/100.0,2) bmi
from zawodnicy
where bmi < 20

-- zad 1) wypisz zawodnikow, ktorzy maja
-- czteroliterowe imie 

select *
from zawodnicy
where LEN(imie)=4
-- zad 2) wypisz zawodnikow urodzonych 
-- w sezonie od listopada do marca 

select * from  zawodnicy
where MONTH(data_ur) >= 11 or MONTH(data_ur)<=3

select * from  zawodnicy
where MONTH(data_ur) > 10 or MONTH(data_ur)<4

select * from zawodnicy
where MONTH(data_ur) in (11,12,1,2,3)

select * from zawodnicy
where MONTH(data_ur) not between 4 and 10

-- zad 3) wypisz zawodnikow zawierajacych litery N lub W
-- w imieniu lub nazwisku 

select CHARINDEX('xx','ala ma kota')

select * from zawodnicy
where CHARINDEX('n',nazwisko)>0 or 
	  CHARINDEX('w',nazwisko)>0

-- like 
select * from zawodnicy
where nazwisko like '%w%' or nazwisko like '%n%'

select * from zawodnicy
where imie like 'Mar_in'

select * from zawodnicy
where imie like 'Mar[tcw]in'

select * from zawodnicy
where imie like 'Mar[^tw]in'

select * from zawodnicy
where nazwisko like '%[nw]%'
 
 insert into zawodnicy (imie,nazwisko)  values ('jan','kowalski')

 select * from zawodnicy

 select * from zawodnicy
 where kraj is not null

 -- 1) potrafimy uzywac select , który 
  -- s³u¿y do wyœwietlania danych i ewentualnie przekszta³cenia 
  -- tych danych  (nie modyfikuje danych Ÿród³owych) 

-- 2) ¿eby przefiltrowaæ dane mozemy uzyc sekcji where 

-- 3) a gdy chcemy posortowac dane to uzyjemy sekcji ORDER BY 

select * from zawodnicy
ORDER BY wzrost desc

select * from zawodnicy
order by kraj, wzrost desc, waga asc


select * from zawodnicy
order by kraj, waga , wzrost desc

select * from zawodnicy
order by waga/2

-- posortuj zawodnikow po BMI 

select *, waga/POWER(wzrost/100.0,2) bmi from zawodnicy
where waga/POWER(wzrost/100.0,2) is not null
order by bmi

-- aliasy zdefiniowane w sekcji select 
-- nie sa dostepne w sekcji where 
-- ale sa dostepne w sekcji order by 

-- kolejnosc intrepertacji silnika bazodanowego 
-- 1) where 
-- 2) select
-- 3) order by 

-- kolejnosc tworzenia zapytania 
-- 1) select
-- 2) from 
-- 3) where
-- 4) order by 

select *
from zawodnicy
where wzrost > 165
order by waga

select top 3 *
from zawodnicy
order by wzrost desc, waga 

select top 50 percent * 
from zawodnicy 
order by wzrost

select *
from zawodnicy
order by wzrost desc
offset 2 row
fetch next 3 row only 

 -- SELECT 

 select imie, nazwisko , IIF(wzrost>180,'wysoki','niski')
 from zawodnicy

 -- ponizej 170 to niski, wiecej niz 180 to wyoski a pomiedzy to sredni

 select imie, nazwisko, IIF(wzrost>180,'wysoki',
							iif(wzrost<170,'niski','œredni')) typ
 from zawodnicy

 select imie, nazwisko ,wzrost,
	case
		when wzrost<170 then 'niski'
		when wzrost> 185 then 'bardzo wysoki'
		when wzrost > 180 then 'wysoki'
		--else 'œredni'
	end typ
 from zawodnicy

 -- podaj dla zwodnikow informacje czy waga jest znana
 -- pisz¹ca znana lub nieznana 

 select imie, nazwisko, waga, IIF(waga is null,'nieznana','znana')
 from zawodnicy

 -- wypisz wage dla zawodnikow ale gdy jest nieznana to napisz 'nieznana'

 select imie, nazwisko, waga, IIF(waga is null, 'nieznana',format(waga,'0'))
 from zawodnicy

 -- str 17 zad 32, 35, 36 

 select *, waga/POWER(wzrost/100.0,2) bmi, 
		IIF(waga/POWER(wzrost/100.0,2) >=20,'ok','zle') kategoria
 from zawodnicy

 select 
	case
	 when kraj='pol' then 'Pan '
	 when kraj in ('ger','aut') then 'herr '
	 when kraj='usa' then 'Mr '
	 else ''
	end +
 imie + ' ' + nazwisko
 from zawodnicy

 select imie, nazwisko,
	IIF(getdate() < datefromparts(year(getdate()),month(data_ur),day(data_ur)),
		'nie mial', 'mial')
 from zawodnicy














