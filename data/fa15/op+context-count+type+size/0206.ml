
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (num1,num2) = x in ((a * 10) + num1) + num2 in
    let base = failwith "to be implemented" in
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
(13,17)-(13,64)
(13,42)-(13,43)
(13,42)-(13,48)
(13,42)-(13,64)
(13,46)-(13,48)
(13,52)-(13,56)
(14,5)-(16,52)
(14,16)-(14,24)
(14,16)-(14,44)
(14,25)-(14,44)
(15,5)-(16,52)
(15,16)-(15,34)
(16,5)-(16,52)
(17,3)-(17,13)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,27)
(17,20)-(17,33)
(17,28)-(17,30)
(17,31)-(17,33)
*)

(* type error slice
(13,5)-(16,52)
(13,11)-(13,64)
(13,42)-(13,43)
(13,42)-(13,48)
(16,5)-(16,52)
(16,19)-(16,33)
(16,19)-(16,45)
(16,34)-(16,35)
*)
