
let rec digitsOfInt xs n =
  (match n with | 0 -> xs | h::t -> xs :: ((n % (10 digitsOfInt n)) / 10) : 
  int list);;
