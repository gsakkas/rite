
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
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd (mulByDigit (i - 1) l);;


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
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else bigAdd (mulByDigit (i - 1) l) [0];;

*)

(* changed spans
(34,29)-(34,34)
i = 0
BopG VarG LitG

(34,40)-(34,69)
[0]
ListG [LitG]

(34,69)-(34,69)
bigAdd (mulByDigit (i - 1) l)
       [0]
AppG [AppG [EmptyG,EmptyG],ListG [EmptyG]]

*)

(* type error slice
(16,4)-(32,37)
(16,12)-(32,35)
(16,15)-(32,35)
(34,26)-(34,69)
(34,40)-(34,46)
(34,40)-(34,69)
(34,69)-(34,69)
*)
