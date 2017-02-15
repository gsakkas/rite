
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
    let f a x = (a + x) / 10 in
    let base = 0 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
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
(19,12)-(19,28)
(19,16)-(19,28)
(19,17)-(19,18)
(19,26)-(19,28)
(20,4)-(21,68)
(20,15)-(20,16)
(21,15)-(21,17)
(21,21)-(21,68)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,28)
(19,16)-(19,23)
(19,17)-(19,18)
(21,21)-(21,68)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)
