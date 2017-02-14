
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
      if ((num1 + num2) + carry) >= 10
      then 1
      else (0, ((((num1 + num2) + carry) mod 10) :: sum)) in
    let base = (0, []) in
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
(16,6)-(18,57)
(16,9)-(16,32)
(16,9)-(16,38)
(17,11)-(17,12)
(18,11)-(18,57)
(18,12)-(18,13)
(19,4)-(21,51)
(20,4)-(21,51)
(21,4)-(21,51)
*)

(* type error slice
(13,4)-(21,51)
(13,10)-(18,57)
(13,12)-(18,57)
(14,6)-(18,57)
(15,6)-(18,57)
(15,6)-(18,57)
(15,24)-(15,25)
(16,6)-(18,57)
(16,6)-(18,57)
(17,11)-(17,12)
(18,11)-(18,57)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
