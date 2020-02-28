
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in ((((x1 + x2) + a) / 10), (((x1 + x2) + a) mod 10)) in
    let base = 0 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,26)-(18,76)
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])

(19,16)-(19,17)
(0 , [])
TupleG [LitG,ListG []]

*)

(* type error slice
(17,5)-(21,52)
(17,11)-(18,76)
(17,13)-(18,76)
(18,7)-(18,76)
(18,26)-(18,76)
(18,28)-(18,43)
(18,41)-(18,42)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
