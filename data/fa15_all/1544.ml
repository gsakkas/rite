
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b' = if (f b') = b then (b, true) else ((f b'), false) in f' b),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(7,13)-(7,67)
fun x ->
  if f x = b
  then (b , true)
  else (f x , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,24)-(7,26)
x
VarG

(7,56)-(7,58)
x
VarG

*)
