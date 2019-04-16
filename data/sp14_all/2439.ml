
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2)
    then clone ((0 :: l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(6,8)-(6,29)
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (TupleG (fromList [EmptyG]))

(9,10)-(9,31)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,50)-(2,67)
(2,51)-(2,56)
(8,5)-(10,18)
(9,10)-(9,15)
(9,10)-(9,31)
(10,10)-(10,18)
*)
