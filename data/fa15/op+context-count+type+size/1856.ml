
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
      match (x, a) with
      | ((fst,sec),_) ->
          if (fst + sec) > 9
          then (((fst + sec) - 10), 1)
          else ((fst + sec), 0)
      | ((fst,sec),(carry,digits)) ->
          if sec = 1
          then (1, (digits @ (fst, sec)))
          else (0, (digits @ (fst, sec))) in
    let base = (0, []) in
    let args = [(0, 0)] @ (List.rev (List.combine l1 l2)) in
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
(19,7)-(27,39)
(19,14)-(19,18)
(19,17)-(19,18)
(25,11)-(27,39)
(25,14)-(25,17)
(26,31)-(26,34)
(26,31)-(26,39)
(26,36)-(26,39)
(27,17)-(27,39)
(27,31)-(27,34)
(27,31)-(27,39)
(27,36)-(27,39)
(28,5)-(30,52)
(28,17)-(28,22)
(29,5)-(30,52)
(29,16)-(29,24)
(29,18)-(29,19)
(29,18)-(29,22)
(29,21)-(29,22)
(30,5)-(30,52)
(30,19)-(30,45)
*)

(* type error slice
(18,5)-(30,52)
(18,11)-(27,39)
(18,13)-(27,39)
(19,7)-(27,39)
(19,7)-(27,39)
(19,14)-(19,18)
(19,17)-(19,18)
(21,11)-(23,31)
(22,19)-(22,38)
(22,37)-(22,38)
(26,21)-(26,39)
(26,28)-(26,29)
(26,31)-(26,39)
(27,21)-(27,27)
(27,21)-(27,39)
(27,28)-(27,29)
(27,31)-(27,39)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
*)
