
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "TBD" in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,25)
(18,17)-(18,31)
(18,26)-(18,31)
(19,5)-(21,52)
(19,20)-(19,21)
(20,26)-(20,38)
(20,39)-(20,41)
(20,42)-(20,44)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
(21,49)-(21,52)
(22,3)-(22,13)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(4,4)-(11,48)
(4,13)-(11,45)
(4,16)-(11,45)
(5,3)-(11,45)
(5,13)-(5,24)
(5,13)-(5,27)
(5,25)-(5,27)
(5,32)-(5,43)
(5,32)-(5,46)
(5,44)-(5,46)
(6,3)-(11,45)
(7,11)-(7,13)
(7,11)-(7,17)
(7,15)-(7,17)
(14,3)-(14,76)
(14,52)-(14,62)
(14,52)-(14,64)
(14,63)-(14,64)
(17,3)-(22,33)
(17,12)-(21,52)
(18,5)-(21,52)
(18,11)-(18,31)
(18,13)-(18,31)
(19,5)-(21,52)
(19,17)-(19,18)
(19,17)-(19,21)
(19,20)-(19,21)
(20,5)-(21,52)
(20,16)-(20,24)
(20,16)-(20,44)
(20,26)-(20,38)
(20,26)-(20,44)
(20,39)-(20,41)
(20,42)-(20,44)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
(21,49)-(21,52)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)
