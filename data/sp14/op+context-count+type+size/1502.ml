
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
(19,20)-(19,38)
(19,21)-(19,28)
(19,31)-(19,32)
(20,4)-(21,63)
(20,15)-(20,16)
(21,37)-(21,63)
(22,2)-(22,34)
*)

(* type error slice
(15,2)-(15,57)
(15,2)-(15,57)
(15,36)-(15,46)
(15,36)-(15,48)
(15,47)-(15,48)
(18,2)-(22,34)
(18,11)-(21,63)
(19,4)-(21,63)
(19,4)-(21,63)
(19,10)-(19,38)
(19,20)-(19,33)
(19,31)-(19,32)
(20,4)-(21,63)
(21,4)-(21,63)
(21,37)-(21,51)
(21,37)-(21,63)
(21,52)-(21,53)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
*)
