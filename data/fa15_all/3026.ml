
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
let (carry , sum) = a in
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(14,47)-(14,48)
((num1 + num2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(14,53)-(14,54)
num1
VarG

(14,57)-(14,59)
num2
VarG

(14,57)-(14,59)
carry
VarG

(14,63)-(14,67)
((num1 + num2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(14,63)-(14,67)
(num1 + num2) + carry
BopG (BopG EmptyG EmptyG) VarG

(14,63)-(14,67)
num1 + num2
BopG VarG VarG

(14,63)-(14,67)
(((num1 + num2) + carry) mod 10) :: sum
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(15,4)-(17,51)
carry
VarG

(15,4)-(17,51)
sum
VarG

(15,4)-(17,51)
10
LitG

(15,19)-(15,20)
[]
ListG EmptyG Nothing

*)
