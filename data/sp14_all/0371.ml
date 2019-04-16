
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if x = []
      then
        (if rem = 1
         then (0, (1 :: acc))
         else
           (let (el1,el2) = x in
            let new_sum = (rem + el1) + el2 in
            let new_rem = if new_sum > 9 then 1 else 0 in
            let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
            (new_rem, (norm_sum :: acc)))) in
    let base = (0, []) in
    let args = List.rev ([] @ (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        ((List.length acc) = (List.length l1)) ||
          ((List.length acc) = (List.length l2))
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,10)-(18,16)
(List.length acc = List.length l1) || (List.length acc = List.length l2)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(23,12)-(27,42)
(0 , acc)
TupleG (fromList [VarG,LitG])

(27,43)-(27,43)
let (el1 , el2) = x in
let new_sum =
  (rem + el1) + el2 in
let new_rem =
  if new_sum > 9
  then 1
  else 0 in
let norm_sum =
  if new_sum > 9
  then new_sum - 10
  else new_sum in
(new_rem , norm_sum :: acc)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

(29,25)-(29,52)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(18,7)-(27,43)
(18,10)-(18,11)
(18,10)-(18,16)
(18,14)-(18,16)
(20,9)-(27,43)
(23,12)-(27,42)
(23,29)-(23,30)
(24,13)-(27,41)
(25,13)-(27,41)
(26,13)-(27,41)
(27,13)-(27,41)
(27,43)-(27,43)
*)
