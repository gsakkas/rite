
let pi = 4.0 *. (atan 1.0);;

let x = 0.1;;

let y = 0.2;;

let _ = x < ((y (?:: sin) (pi * x)) * (cos (pi * ((x + y) / 2))));;
