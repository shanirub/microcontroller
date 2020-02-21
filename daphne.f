-flash-led
marker -flash-led
$ff8a constant latb
$ff93 constant trisb
: init 1 trisb mclr ; \ want RB0 as output
: do_output latb c@ 1 xor latb c! ; \ toggle RB0
: main
init
begin
 do_output
 #100 ms \ wait
 do_output
 #200 ms \ wait
key? until
;


