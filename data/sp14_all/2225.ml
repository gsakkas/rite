
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) = wwhile (((f b), (b <> (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,22)-(5,55)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,34)-(3,40)
(3,34)-(3,48)
(3,41)-(3,48)
(3,42)-(3,43)
(5,22)-(5,28)
(5,22)-(5,55)
(5,29)-(5,55)
(5,30)-(5,51)
*)
