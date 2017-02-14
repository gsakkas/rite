
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
(16,7)-(18,56)
(16,12)-(16,32)
(16,12)-(16,39)
(17,12)-(17,13)
(18,13)-(18,14)
(18,13)-(18,56)
(19,5)-(21,52)
(20,5)-(21,52)
(21,5)-(21,52)
*)

(* type error slice
(13,5)-(21,52)
(13,11)-(18,56)
(13,13)-(18,56)
(14,7)-(18,56)
(15,7)-(18,56)
(15,7)-(18,56)
(15,25)-(15,26)
(16,7)-(18,56)
(16,7)-(18,56)
(17,12)-(17,13)
(18,13)-(18,56)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
