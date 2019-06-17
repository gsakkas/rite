
let helper x r =
  let m = x r in match m with | r -> (r, false) | _ -> (r, true);;

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
(2,12)-(3,65)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (TuplePatG (fromList [EmptyPatG])) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,4)-(3,67)
(2,12)-(3,65)
(3,11)-(3,12)
(3,11)-(3,14)
(8,30)-(8,45)
(8,31)-(8,37)
(8,38)-(8,44)
*)
