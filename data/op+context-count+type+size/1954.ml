
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
  if i <= 0 then 0 else if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;


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
  if i <= 0
  then [0]
  else if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

*)

(* changed spans
(29,18)-(29,19)
*)

(* type error slice
(3,56)-(3,61)
(3,56)-(3,70)
(3,62)-(3,63)
(3,65)-(3,70)
(5,4)-(8,80)
(5,13)-(8,77)
(5,16)-(8,77)
(6,3)-(8,77)
(6,7)-(6,18)
(6,7)-(6,21)
(6,19)-(6,21)
(6,26)-(6,37)
(6,26)-(6,40)
(6,38)-(6,40)
(7,9)-(7,11)
(7,9)-(7,76)
(7,14)-(7,25)
(7,14)-(7,76)
(7,27)-(7,32)
(7,27)-(7,70)
(7,33)-(7,34)
(7,37)-(7,70)
(7,74)-(7,76)
(11,3)-(11,69)
(11,50)-(11,60)
(11,50)-(11,62)
(11,61)-(11,62)
(13,4)-(26,37)
(13,12)-(26,33)
(13,15)-(26,33)
(14,3)-(26,33)
(14,12)-(25,52)
(15,5)-(25,52)
(15,11)-(22,41)
(15,13)-(22,41)
(16,7)-(22,41)
(16,19)-(16,64)
(16,25)-(16,26)
(17,7)-(22,41)
(18,9)-(18,71)
(18,15)-(18,16)
(18,38)-(18,39)
(18,38)-(18,43)
(18,42)-(18,43)
(19,7)-(22,41)
(20,7)-(22,41)
(21,22)-(21,23)
(21,22)-(21,44)
(21,26)-(21,44)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,22)
(23,20)-(23,22)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,44)
(24,26)-(24,38)
(24,26)-(24,44)
(24,39)-(24,41)
(24,42)-(24,44)
(25,5)-(25,52)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(25,49)-(25,52)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
(28,4)-(29,79)
(28,20)-(29,77)
(28,22)-(29,77)
(29,3)-(29,77)
(29,6)-(29,7)
(29,6)-(29,12)
(29,11)-(29,12)
(29,18)-(29,19)
(29,25)-(29,77)
(29,39)-(29,40)
(29,46)-(29,52)
(29,46)-(29,77)
(29,54)-(29,64)
(29,54)-(29,74)
(29,66)-(29,71)
(29,73)-(29,74)
(29,76)-(29,77)
*)
