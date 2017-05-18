
let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = g 0.739085;;
