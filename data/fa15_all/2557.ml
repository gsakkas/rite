
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ ("],[" ^ (pad @ l2))
  else (let pad = clone 0 (- sizDif) in (pad @ l1) ^ ("],[" ^ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,36)-(7,61)
(l1 , pad @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(8,41)-(8,66)
(pad @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(5,16)-(5,32)
(5,17)-(5,28)
(5,29)-(5,31)
(7,36)-(7,38)
(7,36)-(7,61)
(7,39)-(7,40)
(7,41)-(7,61)
(7,48)-(7,49)
(7,50)-(7,60)
(7,55)-(7,56)
(7,57)-(7,59)
(8,41)-(8,51)
(8,41)-(8,66)
(8,46)-(8,47)
(8,52)-(8,53)
(8,54)-(8,66)
(8,61)-(8,62)
(8,63)-(8,65)
*)
