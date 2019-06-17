
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g = f in ((g b), (b = (g b)))), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (fOfB, (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(6,30)-(6,65)
let whilesFun =
  fun f' ->
    fun b' ->
      (let fOfB = f' b' in
       (fOfB , fOfB = b')) in
whilesFun f
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,53)-(4,59)
(4,53)-(4,67)
(4,60)-(4,67)
(4,61)-(4,62)
(6,22)-(6,28)
(6,22)-(6,69)
(6,29)-(6,69)
(6,30)-(6,65)
(6,44)-(6,64)
*)
