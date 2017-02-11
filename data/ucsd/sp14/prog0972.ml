
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> 3 * 1;;

let fixpoint (f,b) = wwhile (f b b);;

let _ = fixpoint (collatz, 9001);;
