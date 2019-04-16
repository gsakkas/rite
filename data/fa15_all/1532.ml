
let f' f b = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(7,30)-(7,38)
let f' =
  fun b ->
    if f b = b
    then (b , true)
    else (f b , false) in
f'
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,4)-(2,25)
(2,8)-(2,23)
(2,10)-(2,23)
(2,14)-(2,23)
(5,9)-(5,10)
(5,9)-(5,12)
(5,42)-(5,48)
(5,42)-(5,56)
(5,49)-(5,56)
(5,50)-(5,51)
(7,22)-(7,28)
(7,22)-(7,42)
(7,29)-(7,42)
(7,30)-(7,38)
(7,31)-(7,33)
*)
