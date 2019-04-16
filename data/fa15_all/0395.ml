
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fx x = if x = 0 then 0 else if x > 1 then x - 1 else x + 1 in
  wwhile ((fx b), f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(8,21)
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
(7,3)-(8,21)
(7,10)-(7,65)
(7,14)-(7,65)
(7,35)-(7,65)
(7,60)-(7,65)
(8,3)-(8,9)
(8,3)-(8,21)
(8,10)-(8,21)
(8,11)-(8,17)
(8,12)-(8,14)
*)
