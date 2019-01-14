
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
(9,52)-(9,54)
f
VarG

*)
