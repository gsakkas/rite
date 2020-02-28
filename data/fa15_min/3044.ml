
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
  let f a x = bigAdd [a; 0] (mulByDigit x l1) in
  let base = 0 in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(27,15)-(27,46)
a @ [0]
AppG [VarG,ListG [EmptyG]]

(28,14)-(28,15)
[]
ListG []

*)

(* type error slice
(9,37)-(9,75)
(9,51)-(9,61)
(9,51)-(9,63)
(9,69)-(9,75)
(11,4)-(21,37)
(11,12)-(21,35)
(11,15)-(21,35)
(12,3)-(21,35)
(21,3)-(21,13)
(21,3)-(21,35)
(27,3)-(28,62)
(27,9)-(27,46)
(27,11)-(27,46)
(27,15)-(27,21)
(27,15)-(27,46)
(27,22)-(27,28)
(27,23)-(27,24)
(27,26)-(27,27)
(28,36)-(28,50)
(28,36)-(28,62)
(28,51)-(28,52)
*)
