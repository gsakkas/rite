
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
(4,30)-(4,36)
(4,34)-(4,36)
(8,7)-(8,68)
(8,15)-(8,18)
(8,17)-(8,18)
(8,22)-(8,68)
(8,28)-(8,29)
(8,43)-(8,51)
(8,72)-(8,73)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(4,49)-(4,55)
(4,49)-(4,62)
(4,57)-(4,58)
(4,57)-(4,62)
(7,3)-(7,9)
(7,3)-(8,73)
(8,7)-(8,68)
(8,7)-(8,73)
(8,22)-(8,68)
(8,43)-(8,51)
*)
