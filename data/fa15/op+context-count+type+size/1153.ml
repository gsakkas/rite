
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
(3,2)-(6,62)
(3,13)-(3,14)
(4,2)-(6,62)
(4,5)-(4,6)
(6,7)-(6,62)
(6,53)-(6,54)
(6,56)-(6,57)
(6,59)-(6,60)
*)

(* type error slice
(4,5)-(4,6)
(4,5)-(4,11)
(4,5)-(4,11)
(4,9)-(4,11)
(6,7)-(6,62)
(6,20)-(6,21)
*)
