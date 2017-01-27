
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
           | (_,_) -> carry :: rest
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
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
(18,12)-(22,59)
(19,23)-(19,28)
(19,23)-(19,36)
(19,32)-(19,36)
*)

(* type error slice
(15,5)-(25,52)
(15,11)-(22,59)
(15,13)-(22,59)
(16,7)-(22,59)
(16,13)-(16,14)
(18,12)-(22,59)
(18,18)-(18,19)
(19,23)-(19,28)
(19,23)-(19,36)
(19,32)-(19,36)
(21,20)-(21,40)
(21,20)-(21,46)
(21,20)-(22,59)
(21,35)-(21,40)
(22,22)-(22,59)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,22)
(23,20)-(23,22)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,44)
(24,26)-(24,38)
(24,26)-(24,44)
(24,39)-(24,41)
(24,42)-(24,44)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
*)
