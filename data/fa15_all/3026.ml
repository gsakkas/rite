
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
(14,30)-(14,78)
let (carry , sum) = a in
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])

(15,20)-(15,21)
[]
ListG []

*)

(* type error slice
(9,3)-(9,75)
(9,51)-(9,61)
(9,51)-(9,63)
(9,62)-(9,63)
(12,3)-(18,35)
(12,12)-(17,52)
(13,5)-(17,52)
(13,11)-(14,78)
(13,13)-(14,78)
(14,7)-(14,78)
(14,30)-(14,78)
(14,42)-(14,43)
(14,47)-(14,78)
(14,51)-(14,77)
(14,53)-(14,61)
(14,54)-(14,55)
(15,5)-(17,52)
(16,5)-(17,52)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,49)-(17,52)
(18,3)-(18,13)
(18,3)-(18,35)
(18,14)-(18,35)
(18,15)-(18,18)
*)
