
let helper (f,a,y) = let x = f a in if x = y then (x, false) else (x, true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (helper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(6,29)-(6,37)
b'
VarG

(8,30)-(8,36)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,4)-(2,78)
(2,13)-(2,76)
(2,22)-(2,76)
(2,37)-(2,76)
(2,40)-(2,41)
(2,40)-(2,45)
(2,44)-(2,45)
(2,67)-(2,76)
(2,68)-(2,69)
(4,4)-(6,65)
(4,17)-(6,63)
(5,3)-(6,63)
(5,17)-(5,18)
(5,17)-(5,20)
(5,19)-(5,20)
(6,49)-(6,55)
(6,49)-(6,63)
(6,56)-(6,63)
(6,60)-(6,62)
(8,22)-(8,28)
(8,22)-(8,40)
(8,29)-(8,40)
(8,30)-(8,36)
*)
