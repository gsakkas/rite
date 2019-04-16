
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,temp) = a in
      let s = (x1 + x2) + carry in
      let carry' = s / 10 in
      let rem = s mod 10 in
      let acc = rem :: temp in
      if (List.length acc) = (List.length l1)
      then (0, (carry' :: acc))
      else (carry', acc) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,22)
let (x1 , x2) = x in
let (carry , temp) = a in
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(20,16)-(20,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(21,16)-(21,21)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(4,4)-(10,79)
(4,13)-(10,77)
(4,16)-(10,77)
(5,3)-(10,77)
(6,3)-(10,77)
(7,3)-(10,77)
(8,9)-(8,37)
(8,32)-(8,33)
(8,34)-(8,36)
(10,5)-(10,77)
(10,69)-(10,77)
(10,70)-(10,72)
(18,3)-(22,35)
(18,12)-(21,72)
(19,5)-(21,72)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(20,5)-(21,72)
(20,16)-(20,18)
(21,16)-(21,18)
(21,16)-(21,21)
(21,39)-(21,53)
(21,39)-(21,65)
(21,54)-(21,55)
(21,56)-(21,60)
(22,14)-(22,35)
(22,15)-(22,18)
(22,19)-(22,34)
(22,20)-(22,27)
*)
