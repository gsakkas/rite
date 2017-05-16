
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) = wwhile ((f b), b);;

let _ = fixpoint (collatz, 1);;
