
let rec assoc (d,k,l) =
  let h::t = l in
  if h = []
  then d
  else (let (x,y) = h in if x = k then y else assoc (d, k, t));;


(* fix

let rec assoc (d,k,l) =
  if l = []
  then d
  else
    (let h::t = l in
     if t = []
     then d
     else (let (x,y) = h in if x = k then y else assoc (d, k, t)));;

*)

(* changed spans
(3,3)-(6,61)
(3,14)-(3,15)
(4,3)-(6,61)
(4,6)-(4,7)
(6,9)-(6,61)
(6,54)-(6,55)
(6,57)-(6,58)
(6,60)-(6,61)
*)

(* type error slice
(4,6)-(4,7)
(4,6)-(4,12)
(4,6)-(4,12)
(4,10)-(4,12)
(6,9)-(6,61)
(6,21)-(6,22)
*)
