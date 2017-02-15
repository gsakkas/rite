
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in let (p,q) = a in (0, (((a * 10) + num1) + num2)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,29)-(14,77)
(14,47)-(14,48)
(14,52)-(14,60)
(14,53)-(14,54)
(14,57)-(14,59)
(14,63)-(14,67)
(15,4)-(17,51)
(15,15)-(15,21)
(15,19)-(15,20)
(16,4)-(17,51)
(16,15)-(16,33)
(17,4)-(17,51)
(18,2)-(18,12)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(9,2)-(9,74)
(9,2)-(9,74)
(9,50)-(9,60)
(9,50)-(9,62)
(9,61)-(9,62)
(12,2)-(18,34)
(12,11)-(17,51)
(13,4)-(17,51)
(13,4)-(17,51)
(13,10)-(14,77)
(13,12)-(14,77)
(14,6)-(14,77)
(14,29)-(14,77)
(14,29)-(14,77)
(14,41)-(14,42)
(14,46)-(14,77)
(14,50)-(14,76)
(14,52)-(14,60)
(14,53)-(14,54)
(15,4)-(17,51)
(16,4)-(17,51)
(17,4)-(17,51)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,48)-(17,51)
(18,2)-(18,12)
(18,2)-(18,34)
(18,13)-(18,34)
(18,14)-(18,17)
*)
