
let fpHelper (f,x,y) =
  let n = f x in match n with | y -> (n, false) | _ -> (n, false);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fpHelper (f, b)), b);;


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

(9,30)-(9,47)
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
(2,4)-(3,68)
(2,15)-(3,66)
(9,30)-(9,47)
(9,31)-(9,39)
(9,40)-(9,46)
*)
