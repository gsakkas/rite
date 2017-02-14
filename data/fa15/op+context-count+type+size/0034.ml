
let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul i l);;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      if val1 > 9 then (1, ((val1 - 10) :: a2)) else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let _ = bigAdd [9; 9; 9; 9] [9; 9; 9];;

*)

(* changed spans
(2,20)-(5,68)
(5,10)-(5,68)
(7,20)-(18,22)
(7,22)-(18,22)
(8,3)-(18,22)
(8,12)-(17,52)
(9,5)-(17,52)
(9,11)-(14,27)
(10,7)-(14,27)
(11,7)-(14,27)
(11,19)-(11,24)
(11,19)-(11,30)
(11,23)-(11,24)
(11,28)-(11,30)
(12,7)-(14,27)
(12,10)-(12,14)
(12,10)-(12,18)
(12,17)-(12,18)
(13,14)-(13,18)
(13,14)-(13,23)
(13,14)-(13,46)
(13,21)-(13,23)
(13,28)-(13,32)
(13,28)-(13,39)
(13,28)-(13,46)
(13,37)-(13,39)
(13,44)-(13,46)
(14,13)-(14,14)
(14,13)-(14,27)
(14,17)-(14,21)
(14,17)-(14,27)
(14,25)-(14,27)
(15,5)-(17,52)
(15,17)-(15,18)
(15,17)-(15,22)
(15,20)-(15,22)
(16,5)-(17,52)
(16,16)-(16,24)
(16,16)-(16,32)
(16,26)-(16,27)
(16,26)-(16,32)
(16,31)-(16,32)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,3)-(18,13)
(18,3)-(18,22)
(18,15)-(18,18)
(18,19)-(18,20)
(18,21)-(18,22)
*)

(* type error slice
(8,3)-(18,22)
(8,12)-(17,52)
(9,5)-(17,52)
(9,5)-(17,52)
(9,11)-(14,27)
(10,7)-(14,27)
(10,21)-(10,22)
(13,28)-(13,46)
(13,44)-(13,46)
(15,5)-(17,52)
(16,5)-(17,52)
(17,5)-(17,52)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,49)-(17,52)
(18,15)-(18,18)
(18,15)-(18,22)
*)
