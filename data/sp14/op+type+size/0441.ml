
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
(15,52)-(15,76)
(16,4)-(18,51)
(16,15)-(16,21)
(16,19)-(16,20)
(17,4)-(18,51)
(17,15)-(17,33)
(18,4)-(18,51)
*)

(* type error slice
(11,2)-(11,75)
(11,2)-(11,75)
(11,40)-(11,50)
(11,40)-(11,52)
(11,51)-(11,52)
(14,2)-(19,34)
(14,11)-(18,51)
(15,4)-(18,51)
(15,4)-(18,51)
(15,11)-(15,77)
(15,18)-(15,77)
(15,27)-(15,77)
(15,52)-(15,76)
(16,4)-(18,51)
(17,4)-(18,51)
(18,4)-(18,51)
(18,4)-(18,51)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
(18,48)-(18,51)
(19,2)-(19,12)
(19,2)-(19,34)
(19,13)-(19,34)
(19,14)-(19,17)
*)

(* all spans
(2,14)-(3,76)
(2,16)-(3,76)
(3,2)-(3,76)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,76)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,68)
(3,46)-(3,47)
(3,51)-(3,68)
(3,52)-(3,57)
(3,58)-(3,59)
(3,60)-(3,67)
(3,61)-(3,62)
(3,65)-(3,66)
(3,74)-(3,76)
(5,12)-(8,62)
(5,15)-(8,62)
(6,2)-(8,62)
(6,12)-(6,26)
(6,12)-(6,23)
(6,24)-(6,26)
(7,2)-(8,62)
(7,12)-(7,26)
(7,12)-(7,23)
(7,24)-(7,26)
(8,2)-(8,62)
(8,3)-(8,31)
(8,26)-(8,27)
(8,4)-(8,25)
(8,5)-(8,10)
(8,11)-(8,12)
(8,13)-(8,24)
(8,14)-(8,17)
(8,20)-(8,23)
(8,28)-(8,30)
(8,33)-(8,61)
(8,56)-(8,57)
(8,34)-(8,55)
(8,35)-(8,40)
(8,41)-(8,42)
(8,43)-(8,54)
(8,44)-(8,47)
(8,50)-(8,53)
(8,58)-(8,60)
(10,19)-(11,75)
(11,2)-(11,75)
(11,8)-(11,9)
(11,25)-(11,64)
(11,28)-(11,34)
(11,28)-(11,29)
(11,33)-(11,34)
(11,40)-(11,52)
(11,40)-(11,50)
(11,51)-(11,52)
(11,58)-(11,64)
(11,58)-(11,59)
(11,63)-(11,64)
(11,73)-(11,75)
(13,11)-(19,34)
(13,14)-(19,34)
(14,2)-(19,34)
(14,11)-(18,51)
(15,4)-(18,51)
(15,11)-(15,77)
(15,18)-(15,77)
(15,27)-(15,77)
(15,28)-(15,50)
(15,29)-(15,44)
(15,30)-(15,38)
(15,31)-(15,32)
(15,35)-(15,37)
(15,41)-(15,43)
(15,47)-(15,49)
(15,52)-(15,76)
(15,53)-(15,68)
(15,54)-(15,62)
(15,55)-(15,56)
(15,59)-(15,61)
(15,65)-(15,67)
(15,73)-(15,75)
(16,4)-(18,51)
(16,15)-(16,21)
(16,16)-(16,17)
(16,19)-(16,20)
(17,4)-(18,51)
(17,15)-(17,33)
(17,15)-(17,27)
(17,28)-(17,30)
(17,31)-(17,33)
(18,4)-(18,51)
(18,18)-(18,44)
(18,18)-(18,32)
(18,33)-(18,34)
(18,35)-(18,39)
(18,40)-(18,44)
(18,48)-(18,51)
(19,2)-(19,34)
(19,2)-(19,12)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)
