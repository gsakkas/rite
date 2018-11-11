
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (h1,h2)::t -> (h1 + h2) :: a in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,59)
match x with
| (d1 , d2) -> (d1 + d2 , (d1 + d2) :: (match a with
                                        | (a1 , a2) -> a2))
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(23,45)-(23,59)
d1
VarG

(23,45)-(23,59)
d2
VarG

(23,45)-(23,59)
d1 + d2
BopG VarG VarG

(23,45)-(23,59)
(d1 + d2 , (d1 + d2) :: (match a with
                         | (a1 , a2) -> a2))
TupleG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(23,51)-(23,53)
d1
VarG

(23,58)-(23,59)
d2
VarG

(23,58)-(23,59)
match a with
| (a1 , a2) -> a2
CaseG VarG [(Nothing,VarG)]

(24,4)-(26,51)
a2
VarG

*)
