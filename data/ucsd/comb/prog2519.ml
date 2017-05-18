
let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let f b = let g' = g b in (b, (b = g'));;

let _ = f collatz;;
