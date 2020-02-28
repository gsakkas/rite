
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
(25,19)-(25,33)
digits
VarG

(25,36)-(25,42)
[fst']
ListG [VarG]

(26,19)-(26,33)
digits
VarG

(26,36)-(26,42)
[fst']
ListG [VarG]

*)

(* type error slice
(14,3)-(14,69)
(14,39)-(14,40)
(14,39)-(14,44)
(14,43)-(14,44)
(14,50)-(14,60)
(14,50)-(14,62)
(14,61)-(14,62)
(17,3)-(31,35)
(17,12)-(30,52)
(18,5)-(30,52)
(18,11)-(27,24)
(22,7)-(27,24)
(22,28)-(22,29)
(25,18)-(25,43)
(25,19)-(25,33)
(25,20)-(25,32)
(25,34)-(25,35)
(25,36)-(25,42)
(28,5)-(30,52)
(29,5)-(30,52)
(30,5)-(30,52)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,49)-(30,52)
(31,3)-(31,13)
(31,3)-(31,35)
(31,14)-(31,35)
(31,15)-(31,18)
*)
