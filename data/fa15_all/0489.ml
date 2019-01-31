
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x1,x2) -> (x1 + x2) :: a in
    let base = ([], []) in
    let args = List.combine padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,sum) = a in
      (((x1 + x2) / 10), ((((x1 + x2) + carry) mod 10) :: sum)) in
    let base = (0, []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l1' l2' in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,56)
let (x1 , x2) = x in
let (carry , sum) = a in
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,42)-(16,51)
((x1 + x2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,42)-(16,56)
a
VarG

(16,42)-(16,56)
x1
VarG

(16,42)-(16,56)
x2
VarG

(16,42)-(16,56)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,42)-(16,56)
x1 + x2
BopG VarG VarG

(16,42)-(16,56)
10
LitG

(16,42)-(16,56)
let (carry , sum) = a in
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(16,42)-(16,56)
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(16,43)-(16,45)
x1 + x2
BopG VarG VarG

(16,55)-(16,56)
carry
VarG

(17,4)-(19,51)
sum
VarG

(17,4)-(19,51)
10
LitG

(17,16)-(17,18)
0
LitG

(18,15)-(18,27)
let (l1' , l2') =
  padZero l1 l2 in
List.combine l1' l2'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(18,28)-(18,35)
padZero l1 l2
AppG (fromList [VarG])

(19,4)-(19,51)
List.combine
VarG

(19,4)-(19,51)
l1'
VarG

(19,4)-(19,51)
l2'
VarG

(19,4)-(19,51)
List.combine l1' l2'
AppG (fromList [VarG])

*)
