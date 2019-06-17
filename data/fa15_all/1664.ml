
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        clone 1 (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (let (carry,ans) = a in (1, ([9] @ ans)))
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,70)-(15,71)
10
LitG

(18,9)-(18,73)
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
TupleG [LitG,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG]

(20,9)-(21,58)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) = 10)
then (let (carry , ans) = a in
      (1 , [9] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
IteG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(18,9)-(18,14)
(18,9)-(18,73)
(18,17)-(18,73)
*)
