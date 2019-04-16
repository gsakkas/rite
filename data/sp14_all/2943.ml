
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else
    (let a = [i] in bigAdd ((mulByDigit i) - (1 l)) ((mulByDigit i) - (1 l)));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else (let a = [i] in bigAdd (mulByDigit (i - 1) l) (mulByDigit (i - 1) l));;

*)

(* changed spans
(32,28)-(32,52)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(32,53)-(32,77)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(5,4)-(8,80)
(5,13)-(8,78)
(8,51)-(8,67)
(8,52)-(8,63)
(8,64)-(8,66)
(13,4)-(26,37)
(13,12)-(26,35)
(26,19)-(26,34)
(26,20)-(26,27)
(26,28)-(26,30)
(28,4)-(32,80)
(28,20)-(32,78)
(28,22)-(32,78)
(32,21)-(32,27)
(32,21)-(32,77)
(32,28)-(32,52)
(32,29)-(32,43)
(32,30)-(32,40)
(32,46)-(32,51)
(32,47)-(32,48)
(32,71)-(32,76)
(32,72)-(32,73)
*)
