
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (num1,num2) = x in (0, (((a * 10) + num1) + num2)) in
    let base = 0 in
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
(13,39)-(13,70)
a
VarG

(13,39)-(13,70)
let (carry , sum) = a in
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(13,40)-(13,41)
((num1 + num2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(13,46)-(13,47)
num1
VarG

(13,50)-(13,52)
num2
VarG

(13,50)-(13,52)
carry
VarG

(13,56)-(13,60)
((num1 + num2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(13,56)-(13,60)
(num1 + num2) + carry
BopG (BopG EmptyG EmptyG) VarG

(13,56)-(13,60)
num1 + num2
BopG VarG VarG

(13,56)-(13,60)
(((num1 + num2) + carry) mod 10) :: sum
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(14,4)-(16,51)
carry
VarG

(14,4)-(16,51)
sum
VarG

(14,4)-(16,51)
10
LitG

(14,15)-(14,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(15,4)-(16,51)
[]
ListG EmptyG Nothing

*)
