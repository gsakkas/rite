
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) -> if (b + c) > 9 then (((b + c) - 10), 1) else ((b + c), 0) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(20,74)
(20,17)-(20,74)
(20,21)-(20,22)
(20,25)-(20,26)
(20,30)-(20,31)
(20,40)-(20,41)
(20,44)-(20,45)
(20,49)-(20,51)
(20,64)-(20,65)
(20,68)-(20,69)
(20,72)-(20,73)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,23)
(22,15)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,12)
(24,2)-(24,34)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)

(* type error slice
(18,4)-(23,51)
(18,10)-(20,74)
(18,12)-(20,74)
(19,6)-(20,74)
(20,17)-(20,74)
(20,37)-(20,56)
(20,54)-(20,55)
(21,4)-(23,51)
(21,15)-(21,22)
(21,19)-(21,21)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
*)
