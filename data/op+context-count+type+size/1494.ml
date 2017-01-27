
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) + a) / 10 in
    let base = 0 in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,23)-(19,28)
(19,23)-(19,39)
(19,32)-(19,33)
(20,5)-(21,64)
(20,16)-(20,17)
(21,38)-(21,64)
(22,3)-(22,33)
*)

(* type error slice
(5,4)-(12,57)
(5,13)-(12,53)
(5,16)-(12,53)
(6,3)-(12,53)
(6,10)-(6,21)
(6,10)-(6,24)
(6,22)-(6,24)
(6,29)-(6,40)
(6,29)-(6,43)
(6,41)-(6,43)
(7,15)-(7,17)
(7,15)-(7,21)
(7,19)-(7,21)
(15,3)-(15,58)
(15,37)-(15,47)
(15,37)-(15,49)
(15,48)-(15,49)
(18,3)-(22,33)
(18,12)-(21,64)
(19,5)-(21,64)
(19,11)-(19,39)
(19,14)-(19,39)
(19,23)-(19,24)
(19,23)-(19,28)
(19,23)-(19,33)
(19,23)-(19,39)
(19,27)-(19,28)
(19,32)-(19,33)
(20,5)-(21,64)
(20,16)-(20,17)
(21,5)-(21,64)
(21,16)-(21,28)
(21,16)-(21,34)
(21,29)-(21,31)
(21,32)-(21,34)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,55)-(21,59)
(21,60)-(21,64)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)
