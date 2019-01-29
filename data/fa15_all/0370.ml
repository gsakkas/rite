
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let y x = x + 1;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,_) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      (new_rem, (norm_sum :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(24,32)
let (rem , acc) = a in
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
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(24,29)-(24,30)
acc
VarG

*)
