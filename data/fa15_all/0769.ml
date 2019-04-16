
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 :: (((a1 + x1) + x2) - 10)))
      else (0, (a2 :: ((a1 + x1) + x2))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((a1 + x1) + x2) >= 10
      then (1, (a2 @ [((a1 + x1) + x2) - 10]))
      else (0, (a2 @ [(a1 + x1) + x2])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,47)
a2 @ [((a1 + x1) + x2) - 10]
AppG (fromList [VarG,ListG (fromList [EmptyG])])

(19,16)-(19,40)
a2 @ [(a1 + x1) + x2]
AppG (fromList [VarG,ListG (fromList [EmptyG])])

*)

(* type error slice
(14,5)-(22,52)
(14,11)-(19,41)
(14,13)-(19,41)
(15,7)-(19,41)
(16,7)-(19,41)
(16,21)-(16,22)
(17,7)-(19,41)
(18,16)-(18,47)
(18,23)-(18,46)
(19,12)-(19,41)
(19,16)-(19,40)
(19,17)-(19,19)
(19,23)-(19,39)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)
