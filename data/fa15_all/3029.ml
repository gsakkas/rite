
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
(14,29)-(14,75)
a
VarG

(14,29)-(15,12)
let (carry , sum) = a in
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(14,32)-(14,36)
num1 + num2
BopG VarG VarG

(14,47)-(14,49)
carry
VarG

(14,52)-(14,74)
(((num1 + num2) + carry) mod 10) :: sum
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(14,54)-(14,58)
num1 + num2
BopG VarG VarG

(14,71)-(14,73)
carry
VarG

(15,11)-(15,12)
sum
VarG

(16,20)-(16,21)
[]
ListG EmptyG Nothing

*)
