
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if f = true then b else ((wwhile ((f b), b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,10)-(6,60)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])

*)

(* type error slice
(6,10)-(6,60)
(6,14)-(6,15)
(6,14)-(6,22)
(6,18)-(6,22)
(6,28)-(6,29)
(6,35)-(6,59)
(6,45)-(6,50)
(6,46)-(6,47)
(6,57)-(6,58)
*)
