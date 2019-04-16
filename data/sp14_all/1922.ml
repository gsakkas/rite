
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = x in wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,22)-(7,50)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,26)
(3,3)-(5,26)
(3,19)-(4,62)
(4,29)-(4,35)
(4,29)-(4,48)
(4,43)-(4,48)
(4,44)-(4,45)
(4,46)-(4,47)
(5,3)-(5,9)
(5,3)-(5,26)
(5,10)-(5,16)
(5,11)-(5,12)
(5,14)-(5,15)
(5,17)-(5,26)
(5,18)-(5,19)
(7,22)-(7,50)
(7,28)-(7,33)
(7,32)-(7,33)
(7,37)-(7,43)
(7,37)-(7,50)
(7,44)-(7,50)
(7,45)-(7,46)
*)
