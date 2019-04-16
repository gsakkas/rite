
let helper x r = let m = x r in match m with | r -> (r, false);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,12)-(2,63)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (TuplePatG (fromList [VarPatG])) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,4)-(2,65)
(2,12)-(2,63)
(2,26)-(2,27)
(2,26)-(2,29)
(7,30)-(7,45)
(7,31)-(7,37)
(7,38)-(7,44)
*)
