
let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let func b = match f b with | b -> (b, false) | x -> (x, true) in
     ((func b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let g x = match f x with | x -> (x, false) | y -> (y, true) in (g, b));;

*)

(* changed spans
(7,5)-(8,20)
let g =
  fun x ->
    match f x with
    | x -> (x , false)
    | y -> (y , true) in
(g , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,46)
(3,40)-(3,46)
(3,41)-(3,42)
(6,3)-(6,9)
(6,3)-(8,20)
(7,5)-(8,20)
(7,15)-(7,68)
(7,19)-(7,68)
(7,41)-(7,51)
(8,6)-(8,19)
(8,7)-(8,15)
(8,8)-(8,12)
*)
