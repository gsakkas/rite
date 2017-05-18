
let fptest = ((fun x  -> truncate (1e6 *. (cos (1e-6 *. (float x))))), 0);;

let _ = fptest 0;;
