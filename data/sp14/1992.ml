
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (m,n) ->
          if (m + n) > 9 then 1 :: ((m + n) - 10) :: a else (m + n) :: a in
    let base = [] in
    let args = match List.rev (List.combine l1 l2) with | h::t -> h in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,7)-(21,73)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(22,16)-(22,18)
(0 , [])
TupleG [LitG,ListG []]

(23,16)-(23,68)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(23,5)-(24,52)
(23,16)-(23,68)
(23,22)-(23,30)
(23,22)-(23,51)
(23,31)-(23,51)
(23,32)-(23,44)
(23,67)-(23,68)
(24,19)-(24,33)
(24,19)-(24,45)
(24,41)-(24,45)
*)
