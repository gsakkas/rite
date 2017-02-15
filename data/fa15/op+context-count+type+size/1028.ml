
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let x = f b in match x with | b -> (x, false) | _ -> (x, true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(4,28)-(4,36)
(4,33)-(4,35)
(8,5)-(8,69)
(8,14)-(8,17)
(8,16)-(8,17)
(8,21)-(8,68)
(8,41)-(8,51)
(8,42)-(8,43)
(8,45)-(8,50)
(8,60)-(8,61)
(8,71)-(8,72)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(4,48)-(4,54)
(4,48)-(4,62)
(4,55)-(4,62)
(4,56)-(4,57)
(7,2)-(7,8)
(7,2)-(8,73)
(8,4)-(8,73)
(8,5)-(8,69)
(8,21)-(8,68)
(8,41)-(8,51)
*)
