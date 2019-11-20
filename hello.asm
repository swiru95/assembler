format ELF64 executable 

;Tutaj (Powyzej /\) wybieramy jaki to ma byc plik ELF64 oznacza ze mamy architekture 64bit.
;Na 32 byloby po prostu ELF. Ogolnie ELF to rodzaj executa (executable and linkable format).

entry _start			

;Powyzej okreslamy poczatek naszego programu, ktory podzielony jest na dwie czesci (segmenty):
;pierwsza zaczyna sie ponizej:

segment readable executable

;Oznacza ona czesc wykonywalna (executable) i tutaj mamy zamieszczony kod dzialania naszego programu
;Rozpoczyna sie on w tym miejscu:

_start:

	mov rax, 1 			;Okreslamy adres RAX- w RAX mamy przechowywane adresy funkcji (1 to adres wypisania)
	mov rdi, 1 			;Ustawiamy wyjscie na ekran (RDI dla RAX=1, czyli funkcji wypisania RDI zawiera 'numer strumienia' wyjscia 
	mov rsi, text 		;RSI dla naszej funkcji (RAX=1) okresla 'dane wejsciowe' czyli w naszym wypadku jakas 'zmienna' text
	mov rdx, [dlugosc]	;RDX stanowi nasza druga zmienna- zakres wyswietlanych znakow - w naszym wypadku bedzie to zbior [dlugosc]
	syscall				;syscall oznacza wywolanie funkcji z RAX
	mov rax, 60			;Wybieramy kolejny numer funkcji w tym wypadku RAX=60 to exit()
	syscall				;konczymy program :)

;I przechodzimy do okreslenia naszych zmiennych:

segment readable writeable

text	db "HelloWorld!", 0ah, ;Tutaj okreslamy text jako db czyli databytes w ktorych umieszczamy string "HelloWorld!", czyli w zasadzie definiujemy ze w pamieci pojawi sie taki ciag znakow zakonczony 0ah.
dlugosc	dq $ - text		;dlugosc definiuje nam ilosc komorek pamieci- ile nasz string zawiera- jak dlugi jest. Jak to dziala?
						;Od miejsca w pamieci, gdzie mamy zdefiniowany dlugosc, odejmujemy mieisce w pamieci gdzie rozpoczyna sie text
						;|;text|.dlugosc|- z miejsca gdzie kropka liczymy ile pamieci jest do srednika przed text :)

