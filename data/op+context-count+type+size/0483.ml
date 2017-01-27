
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
    let f (c,ds) (x1,x2) = ((((c + x1) + x2) / 10), (((c + x1) + x2) mod 10)) in
    let base = (0, 1) in
    let args = List.combine l1 l2 in
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
      ((((c + x1) + x2) / 10), ((((c + x1) + x2) mod 10) :: ds)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,56)-(15,76)
(16,5)-(18,52)
(16,20)-(16,21)
*)

(* type error slice
(3,53)-(3,58)
(3,53)-(3,67)
(3,59)-(3,60)
(3,62)-(3,67)
(5,4)-(8,65)
(5,13)-(8,61)
(5,16)-(8,61)
(6,3)-(8,61)
(6,13)-(6,24)
(6,13)-(6,27)
(6,25)-(6,27)
(7,3)-(8,61)
(7,13)-(7,24)
(7,13)-(7,27)
(7,25)-(7,27)
(8,6)-(8,11)
(8,6)-(8,24)
(8,6)-(8,31)
(8,6)-(8,61)
(8,12)-(8,13)
(8,15)-(8,24)
(8,27)-(8,28)
(8,29)-(8,31)
(8,36)-(8,41)
(8,36)-(8,54)
(8,36)-(8,61)
(8,42)-(8,43)
(8,45)-(8,54)
(8,57)-(8,58)
(8,59)-(8,61)
(11,3)-(11,76)
(11,41)-(11,51)
(11,41)-(11,53)
(11,52)-(11,53)
(14,3)-(19,33)
(14,12)-(18,52)
(15,5)-(18,52)
(15,12)-(15,76)
(15,19)-(15,76)
(15,32)-(15,33)
(15,32)-(15,38)
(15,32)-(15,44)
(15,32)-(15,50)
(15,32)-(15,76)
(15,36)-(15,38)
(15,42)-(15,44)
(15,56)-(15,76)
(16,5)-(18,52)
(16,17)-(16,18)
(16,17)-(16,21)
(16,20)-(16,21)
(17,5)-(18,52)
(17,16)-(17,28)
(17,16)-(17,34)
(17,29)-(17,31)
(17,32)-(17,34)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,36)-(18,40)
(18,41)-(18,45)
(18,49)-(18,52)
(19,3)-(19,13)
(19,3)-(19,33)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)
