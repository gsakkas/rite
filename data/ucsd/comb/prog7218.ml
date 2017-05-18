
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) = wwhile ((f b), b);;

let _ = fixpoint (collatz, 1);;
