
let helper (f,a,y) =
  let x = f a in if x = y then ((f, x, y), false) else ((f, x, y), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((helper (f, b, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(7,29)-(7,37)
b'
VarG

(9,30)-(9,48)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,4)-(3,75)
(2,13)-(3,73)
(3,3)-(3,73)
(3,18)-(3,73)
(3,56)-(3,73)
(6,17)-(6,18)
(6,17)-(6,20)
(7,49)-(7,55)
(7,49)-(7,63)
(7,56)-(7,63)
(7,57)-(7,58)
(9,22)-(9,28)
(9,22)-(9,52)
(9,29)-(9,52)
(9,30)-(9,48)
(9,31)-(9,37)
*)
