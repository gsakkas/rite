
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
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args l1 l2 = match l1 with | [] -> [] | h1::t1 -> t1 in
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
(17,17)-(17,25)
(17,17)-(17,45)
(17,26)-(17,45)
(18,5)-(20,52)
(18,16)-(18,24)
(18,16)-(18,44)
(18,25)-(18,44)
(19,5)-(20,52)
(19,14)-(19,61)
(19,17)-(19,61)
(19,22)-(19,61)
(19,28)-(19,30)
(19,44)-(19,46)
(19,59)-(19,61)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
(20,49)-(20,52)
(21,3)-(21,13)
(21,3)-(21,33)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
*)

(* type error slice
(19,5)-(20,52)
(19,14)-(19,61)
(20,19)-(20,33)
(20,19)-(20,45)
(20,41)-(20,45)
*)
