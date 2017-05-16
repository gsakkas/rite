
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then (false, x) else (true, (f2 x)) in
  wwhile ((f1 f), b);;

let _ = fixpoint (collatz, 1);;
