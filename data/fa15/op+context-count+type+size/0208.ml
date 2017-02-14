
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in (((num1 + num2) / 10), ((num1 + num2) mod 10))
        :: a in
    let base = [(0, 0)] in
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
(14,33)-(14,37)
(14,33)-(14,74)
(14,33)-(15,13)
(14,48)-(14,50)
(14,55)-(14,59)
(14,55)-(14,74)
(14,72)-(14,74)
(15,12)-(15,13)
(16,5)-(18,52)
(16,16)-(16,24)
(16,18)-(16,22)
(16,21)-(16,22)
(17,5)-(18,52)
(17,16)-(17,34)
(18,5)-(18,52)
(19,20)-(19,27)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(13,5)-(18,52)
(13,11)-(15,13)
(14,33)-(15,13)
(15,12)-(15,13)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
*)
