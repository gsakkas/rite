
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

let rec mulByDigit i l =
  let rec helper i acc l =
    if i > 0 then (helper i) - (1 (bigAdd acc l) l) else acc in
  helper i [] l;;


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

let rec mulByDigit i l =
  let rec helper i acc l =
    if i > 0 then helper (i - 1) (bigAdd acc l) l else acc in
  helper i [] l;;

*)

(* changed spans
(24,19)-(24,52)
helper (i - 1) (bigAdd acc l)
       l
AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(4,4)-(7,80)
(4,13)-(7,78)
(7,51)-(7,67)
(7,52)-(7,63)
(7,64)-(7,66)
(11,4)-(20,37)
(11,12)-(20,35)
(20,19)-(20,34)
(20,20)-(20,27)
(20,28)-(20,30)
(23,3)-(25,16)
(23,18)-(24,61)
(23,20)-(24,61)
(24,5)-(24,61)
(24,19)-(24,29)
(24,19)-(24,52)
(24,20)-(24,26)
(24,32)-(24,52)
(24,33)-(24,34)
(24,35)-(24,49)
(24,36)-(24,42)
(24,43)-(24,46)
(24,58)-(24,61)
(25,3)-(25,9)
(25,3)-(25,16)
*)
