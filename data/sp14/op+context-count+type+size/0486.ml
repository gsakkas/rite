
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) =
      if (List.length ds) = (List.length x1)
      then (0, ((((c + x1) + x2) / 10) :: (((c + x1) + x2) mod 10) :: ds))
      else ((((c + x1) + x2) / 10), ((((c + x1) + x2) mod 10) :: ds)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

let rec removeZero l =
  match l with | h::t -> if h == 0 then removeZero t else h :: t | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f (c,ds) (x1,x2) =
      if (List.length ds) = (List.length l1)
      then (0, ((((c + x1) + x2) / 10) :: (((c + x1) + x2) mod 10) :: ds))
      else ((((c + x1) + x2) / 10), ((((c + x1) + x2) mod 10) :: ds)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,42)-(16,44)
*)

(* type error slice
(5,4)-(8,65)
(5,13)-(8,61)
(5,16)-(8,61)
(6,3)-(8,61)
(7,3)-(8,61)
(8,6)-(8,11)
(8,6)-(8,24)
(8,6)-(8,31)
(8,6)-(8,61)
(8,27)-(8,28)
(8,36)-(8,41)
(8,36)-(8,54)
(8,36)-(8,61)
(8,57)-(8,58)
(14,3)-(22,33)
(14,12)-(21,52)
(15,5)-(21,52)
(15,12)-(18,68)
(15,19)-(18,68)
(16,30)-(16,41)
(16,30)-(16,44)
(16,42)-(16,44)
(17,20)-(17,26)
(17,20)-(17,32)
(17,24)-(17,26)
(17,30)-(17,32)
(17,46)-(17,52)
(17,50)-(17,52)
(18,16)-(18,22)
(18,20)-(18,22)
(18,41)-(18,47)
(18,45)-(18,47)
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
(21,41)-(21,45)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
*)
