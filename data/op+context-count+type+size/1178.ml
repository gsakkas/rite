
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev ((List.combine (0 :: l1) 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,27)-(18,58)
(18,50)-(18,51)
*)

(* type error slice
(13,5)-(19,52)
(13,11)-(16,62)
(13,13)-(16,62)
(14,7)-(16,62)
(14,14)-(14,18)
(14,17)-(14,18)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,58)
(18,27)-(18,39)
(18,27)-(18,51)
(18,27)-(18,58)
(18,27)-(18,58)
(18,50)-(18,51)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,41)-(19,45)
*)
