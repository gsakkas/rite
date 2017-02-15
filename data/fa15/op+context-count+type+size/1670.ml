
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
        if sec' = 1
        then (1, ([(fst', sec')] @ digits))
        else (0, ([(fst', sec')] @ digits)) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
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
(25,18)-(25,32)
(25,19)-(25,31)
(25,26)-(25,30)
(25,35)-(25,41)
(26,18)-(26,32)
(26,19)-(26,31)
(26,26)-(26,30)
(26,35)-(26,41)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
(31,19)-(31,26)
*)

(* type error slice
(14,2)-(14,68)
(14,2)-(14,68)
(14,38)-(14,39)
(14,38)-(14,43)
(14,38)-(14,43)
(14,42)-(14,43)
(14,49)-(14,59)
(14,49)-(14,61)
(14,60)-(14,61)
(17,2)-(31,34)
(17,11)-(30,51)
(18,4)-(30,51)
(18,4)-(30,51)
(18,10)-(27,23)
(22,6)-(27,23)
(22,27)-(22,28)
(25,17)-(25,42)
(25,18)-(25,32)
(25,18)-(25,32)
(25,19)-(25,31)
(25,33)-(25,34)
(25,35)-(25,41)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,48)-(30,51)
(31,2)-(31,12)
(31,2)-(31,34)
(31,13)-(31,34)
(31,14)-(31,17)
*)
