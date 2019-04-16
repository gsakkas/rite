
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let y = f b in match y with | b -> (y, false) | _ -> (y, true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(4,29)-(4,37)
b'
VarG

(8,6)-(8,70)
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
(3,17)-(3,18)
(3,17)-(3,20)
(4,49)-(4,55)
(4,49)-(4,63)
(4,56)-(4,63)
(4,57)-(4,58)
(7,3)-(7,9)
(7,3)-(8,74)
(8,5)-(8,74)
(8,6)-(8,70)
(8,22)-(8,69)
(8,42)-(8,52)
*)
