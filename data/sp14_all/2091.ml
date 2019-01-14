
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone List.hd l1 ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone List.hd l2 ((List.length l2) - (List.length l1)) in
       (z, l1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = clone (List.hd l1) ((List.length l1) - (List.length l2)) in
       (y, l2))
    else
      (let z = clone (List.hd l2) ((List.length l2) - (List.length l1)) in
       (z, l1));;

*)

(* changed spans
(10,15)-(10,69)
clone (List.hd l1)
      (List.length l1 - List.length l2)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(10,21)-(10,28)
List.hd l1
AppG (fromList [VarG])

(13,15)-(13,69)
clone (List.hd l2)
      (List.length l2 - List.length l1)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(13,21)-(13,28)
List.hd l2
AppG (fromList [VarG])

*)
