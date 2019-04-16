
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,22)-(6,50)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(6,22)-(6,28)
(6,22)-(6,50)
(6,29)-(6,50)
(6,30)-(6,46)
*)
