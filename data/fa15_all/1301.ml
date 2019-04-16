
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
    let f a x = x + a in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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

(20,16)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(21,16)-(21,18)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(19,5)-(21,69)
(19,11)-(19,22)
(19,17)-(19,22)
(19,21)-(19,22)
(21,22)-(21,69)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
*)
