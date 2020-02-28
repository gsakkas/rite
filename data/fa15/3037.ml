
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
    let args = List.rev (List.combine l1 l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = bigAdd [a :: 0] [mulByDigit x l1] in
  let base = 0 in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(27,15)-(27,48)
a @ [0]
AppG [VarG,ListG [EmptyG]]

(28,14)-(28,15)
[]
ListG []

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(6,62)
(4,13)-(6,60)
(5,4)-(5,58)
(5,5)-(5,52)
(5,6)-(5,11)
(5,12)-(5,13)
(5,53)-(5,54)
(5,55)-(5,57)
(11,4)-(21,37)
(11,12)-(21,35)
(21,19)-(21,34)
(21,20)-(21,27)
(21,28)-(21,30)
(27,15)-(27,21)
(27,15)-(27,48)
(27,22)-(27,30)
(27,23)-(27,29)
(27,28)-(27,29)
*)
