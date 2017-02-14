
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
(16,41)-(16,43)
*)

(* type error slice
(5,3)-(8,64)
(5,12)-(8,62)
(5,15)-(8,62)
(6,2)-(8,62)
(7,2)-(8,62)
(8,2)-(8,62)
(8,3)-(8,31)
(8,4)-(8,25)
(8,5)-(8,10)
(8,26)-(8,27)
(8,33)-(8,61)
(8,34)-(8,55)
(8,35)-(8,40)
(8,56)-(8,57)
(14,2)-(22,34)
(14,11)-(21,51)
(15,4)-(21,51)
(15,11)-(18,69)
(15,18)-(18,69)
(16,28)-(16,44)
(16,29)-(16,40)
(16,41)-(16,43)
(17,17)-(17,32)
(17,18)-(17,26)
(17,23)-(17,25)
(17,29)-(17,31)
(17,44)-(17,52)
(17,49)-(17,51)
(18,14)-(18,22)
(18,19)-(18,21)
(18,39)-(18,47)
(18,44)-(18,46)
(20,4)-(21,51)
(20,15)-(20,23)
(20,15)-(20,44)
(20,24)-(20,44)
(20,25)-(20,37)
(20,38)-(20,40)
(20,41)-(20,43)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,40)-(21,44)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)
