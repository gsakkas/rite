
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g x = f b in ((f b), ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = let g x = let n = f x in (n, (n = x)) in wwhile (g, b);;

*)

(* changed spans
(5,22)-(5,73)
let g =
  fun x ->
    (let n = f x in
     (n , n = x)) in
wwhile (g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,64)-(3,70)
(3,64)-(3,78)
(3,71)-(3,78)
(3,72)-(3,73)
(5,22)-(5,28)
(5,22)-(5,73)
(5,29)-(5,73)
(5,30)-(5,69)
(5,48)-(5,68)
*)
