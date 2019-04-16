
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a,b) = List.hd x in ([(List.hd a) + 1], [(List.hd b) + 2]) in
    let base = ([], []) in
    let args = [(l1, l2)] in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(20,70)
([x + 1] , [x + 2])
TupleG (fromList [ListG (fromList [EmptyG])])

(22,16)-(22,26)
l1
VarG

*)

(* type error slice
(19,5)-(23,54)
(19,11)-(20,70)
(19,13)-(20,70)
(20,19)-(20,26)
(20,19)-(20,28)
(20,27)-(20,28)
(22,5)-(23,54)
(22,16)-(22,26)
(22,17)-(22,25)
(23,21)-(23,35)
(23,21)-(23,47)
(23,36)-(23,37)
(23,43)-(23,47)
*)
