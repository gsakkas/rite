
let fptest x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = fptest fptest 0;;
