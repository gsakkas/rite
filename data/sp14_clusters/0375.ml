
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
        (List.length acc) =
          ((List.length (List.combine (padZero l1 l2))) - 1)
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
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
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = (List.length larger)
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
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
(18,6)-(27,38)
let larger =
  if List.length l1 > List.length l2
  then l1
  else l2 in
if List.length acc = List.length larger
then if rem = 1
     then (0 , [1 ; 0] @ acc)
     else (0 , acc)
else (let (el1 , el2) = x in
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
      (new_rem , norm_sum :: acc))
LetG NonRec [IteG EmptyG EmptyG EmptyG] (IteG EmptyG EmptyG EmptyG)

(19,8)-(20,60)
List.length l1 > List.length l2
BopG (AppG [EmptyG]) (AppG [EmptyG])

(20,10)-(20,60)
l1
VarG

(20,39)-(20,46)
l2
VarG

(21,15)-(21,18)
List.length
VarG

(21,15)-(21,18)
acc
VarG

(21,15)-(21,18)
List.length
VarG

(21,15)-(21,18)
larger
VarG

(21,15)-(21,18)
List.length acc
AppG [VarG]

(21,15)-(21,18)
List.length larger
AppG [VarG]

(21,15)-(21,18)
rem = 1
BopG VarG LitG

(21,15)-(21,18)
if rem = 1
then (0 , [1 ; 0] @ acc)
else (0 , acc)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

*)
