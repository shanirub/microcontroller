-flash-led
marker -flash-led
$ff8a constant latb
$ff93 constant trisb
$ff81 constant portb
: init 1 trisb mclr ; \ want RB0 as output for LED
$80 trisb mset \ want RB7 as input for Button
: do_output latb c@ 1 xor latb c! ; \ toggle RB0
: buttonpressed? portb c@ 1 = ;
: ledon 0 latb c! ;
: ledoff 1 latb c! ;
: main
init
begin
\ do_output
\ #100 ms \ wait
\ do_output
buttonpressed? 
if ledon else ledoff then 
 #100 ms \ wait
key? until
;
