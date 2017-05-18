
let pi = 4.0 *. (atan 1.0);;

let x = 1;;

let y = 1;;

let _ = x < ((y (?:: sin) (pi * x)) * (cos (pi * ((x + y) / 2))));;
