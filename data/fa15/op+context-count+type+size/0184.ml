
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
      [(((num1 + num2) / 10), ((num1 + num2) mod 10)); a] in
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
(15,6)-(15,57)
(15,7)-(15,53)
(15,10)-(15,14)
(15,25)-(15,27)
(15,30)-(15,52)
(15,32)-(15,36)
(15,49)-(15,51)
(15,55)-(15,56)
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
(13,4)-(18,51)
(13,10)-(15,57)
(13,12)-(15,57)
(14,6)-(15,57)
(15,6)-(15,57)
(15,6)-(15,57)
(15,55)-(15,56)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
*)
