
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (add1,add2) ->
          ((((add1 + add2) + a) mod 10), (((add1 + add2) + a) / 10)) in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(18,67)
(18,15)-(18,39)
(18,30)-(18,31)
(18,45)-(18,61)
(18,45)-(18,67)
(18,60)-(18,61)
(19,5)-(21,52)
(19,20)-(19,21)
(22,20)-(22,27)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(15,5)-(21,52)
(15,11)-(18,67)
(15,13)-(18,67)
(16,7)-(18,67)
(16,13)-(16,14)
(18,15)-(18,19)
(18,15)-(18,26)
(18,15)-(18,31)
(18,15)-(18,39)
(18,15)-(18,67)
(18,22)-(18,26)
(18,30)-(18,31)
(18,45)-(18,67)
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
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
*)
