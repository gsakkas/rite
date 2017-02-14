
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let ha::_ = a in
      let (a1,a2) = ha in
      let tens = (x1 + x2) + (a1 / 10) in
      let ones = (x1 + x2) + (a1 mod 10) in (tens, ones) :: a in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,7)-(24,62)
(22,7)-(24,62)
(22,21)-(22,23)
(23,7)-(24,62)
(23,31)-(23,33)
(24,31)-(24,33)
(24,46)-(24,50)
(24,46)-(24,62)
(24,52)-(24,56)
(24,61)-(24,62)
(25,16)-(25,24)
(25,18)-(25,19)
(25,21)-(25,22)
(26,5)-(27,52)
*)

(* type error slice
(19,5)-(27,52)
(19,11)-(24,62)
(24,46)-(24,62)
(24,61)-(24,62)
(27,5)-(27,52)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
*)
