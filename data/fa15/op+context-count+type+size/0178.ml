
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
      let (p,q) = a in (((num1 + num2) / 10), ((num1 + num2) mod 10)) in
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
(15,6)-(15,69)
(15,26)-(15,30)
(15,41)-(15,43)
(15,46)-(15,68)
(15,48)-(15,52)
(15,65)-(15,67)
(16,4)-(18,51)
(16,15)-(16,21)
(16,19)-(16,20)
(17,4)-(18,51)
(17,15)-(17,33)
(18,4)-(18,51)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)

(* type error slice
(9,2)-(9,74)
(9,2)-(9,74)
(9,50)-(9,60)
(9,50)-(9,62)
(9,61)-(9,62)
(12,2)-(19,34)
(12,11)-(18,51)
(13,4)-(18,51)
(13,4)-(18,51)
(13,10)-(15,69)
(13,12)-(15,69)
(14,6)-(15,69)
(15,6)-(15,69)
(15,23)-(15,69)
(15,46)-(15,68)
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
