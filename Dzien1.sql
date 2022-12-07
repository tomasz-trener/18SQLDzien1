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




