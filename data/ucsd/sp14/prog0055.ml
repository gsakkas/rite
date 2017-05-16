
type nat =
  | Zero
  | Succ of nat;;

let rec to_int n = match n with | Zero  -> 0 | Succ m -> 1 + (to_int m);;

let b = to_int Succ Zero;;
