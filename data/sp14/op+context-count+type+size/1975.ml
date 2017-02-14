
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
(29,17)-(29,18)
*)

(* type error slice
(5,3)-(8,79)
(5,12)-(8,77)
(5,15)-(8,77)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(13,3)-(26,36)
(13,11)-(26,34)
(13,14)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,3)-(29,78)
(28,19)-(29,76)
(28,21)-(29,76)
(29,2)-(29,76)
(29,2)-(29,76)
(29,17)-(29,18)
(29,24)-(29,76)
(29,38)-(29,39)
(29,45)-(29,51)
(29,45)-(29,76)
(29,52)-(29,74)
(29,53)-(29,63)
(29,75)-(29,76)
*)
