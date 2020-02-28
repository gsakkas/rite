
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,29)-(5,75)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG,VarG]

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,46)-(3,52)
(3,46)-(3,59)
(3,53)-(3,59)
(3,54)-(3,55)
(5,29)-(5,75)
(5,33)-(5,34)
(5,33)-(5,41)
(5,37)-(5,41)
(5,47)-(5,48)
(5,54)-(5,74)
(5,55)-(5,70)
(5,56)-(5,62)
(5,63)-(5,69)
(5,64)-(5,65)
(5,72)-(5,73)
*)
