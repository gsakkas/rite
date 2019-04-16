
let helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,3)-(3,65)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

(8,30)-(8,42)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,67)
(2,13)-(3,65)
(3,3)-(3,65)
(3,18)-(3,65)
(3,38)-(3,48)
(8,30)-(8,42)
(8,31)-(8,37)
*)
