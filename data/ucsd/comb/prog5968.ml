
let rec wwhile (f,b) = failwith "to be written";;

let fixpoint (f,b) = wwhile ((failwith "to be written"), b);;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  let x = wwhile (f b) in if x = b then fixpoint (f, x) else x;;

let _ = fixpoint (collatz, 3);;
