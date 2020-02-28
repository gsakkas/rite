
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
    let args =
      let padZeroLists = padZero l1 l2 in fst padZeroLists snd padZeroLists in
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
(16,17)-(16,57)
let (x1 , x2) = x in
let (carry , sum) = a in
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(17,17)-(17,19)
0
LitG

(19,7)-(19,76)
let (l1' , l2') =
  padZero l1 l2 in
List.combine l1' l2'
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG])] (AppG [EmptyG,EmptyG])

*)

(* type error slice
(4,4)-(9,46)
(4,13)-(9,44)
(4,16)-(9,44)
(5,3)-(9,44)
(6,3)-(9,44)
(7,3)-(9,44)
(9,8)-(9,44)
(9,9)-(9,39)
(9,34)-(9,35)
(16,5)-(20,52)
(16,11)-(16,57)
(16,43)-(16,57)
(16,56)-(16,57)
(17,5)-(20,52)
(17,16)-(17,24)
(19,7)-(19,76)
(19,26)-(19,33)
(19,26)-(19,39)
(19,43)-(19,46)
(19,43)-(19,76)
(19,47)-(19,59)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
*)
