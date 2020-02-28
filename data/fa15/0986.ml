
let helper (x,r) = let m = x r in match m with | r -> (r, false);;

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
(2,13)-(2,65)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (TuplePatG (fromList [EmptyPatG])) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,4)-(2,67)
(2,13)-(2,65)
(2,20)-(2,65)
(2,35)-(2,65)
(2,55)-(2,65)
(5,15)-(5,16)
(5,15)-(5,18)
(5,60)-(5,66)
(5,60)-(5,73)
(5,67)-(5,73)
(5,68)-(5,69)
(7,22)-(7,28)
(7,22)-(7,49)
(7,29)-(7,49)
(7,30)-(7,45)
(7,31)-(7,37)
*)
