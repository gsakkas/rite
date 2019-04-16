
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f' x), false) in f' 1),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(9,52)-(9,58)
f x
AppG (fromList [VarG])

(9,70)-(9,74)
f'
VarG

*)

(* type error slice
(2,4)-(2,27)
(2,9)-(2,25)
(9,6)-(9,75)
(9,14)-(9,66)
(9,52)-(9,58)
(9,53)-(9,55)
(9,56)-(9,57)
(9,70)-(9,72)
(9,70)-(9,74)
(9,73)-(9,74)
*)
