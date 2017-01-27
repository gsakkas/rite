
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

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = bigAdd a x in
  let base = [] in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


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

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = match a with | (_,y) -> (0, (bigAdd y x)) in
  let base = (0, []) in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,15)-(31,25)
(31,22)-(31,23)
(32,14)-(32,16)
(39,17)-(39,31)
(39,32)-(39,33)
(39,34)-(39,38)
(39,39)-(39,43)
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
(31,3)-(39,50)
(31,9)-(31,25)
(31,11)-(31,25)
(31,15)-(31,21)
(31,15)-(31,25)
(31,22)-(31,23)
(31,24)-(31,25)
(32,3)-(39,50)
(32,14)-(32,16)
(33,3)-(39,50)
(34,5)-(38,37)
(35,7)-(37,60)
(37,17)-(37,30)
(37,17)-(37,60)
(37,33)-(37,55)
(37,57)-(37,58)
(37,59)-(37,60)
(38,5)-(38,18)
(38,5)-(38,37)
(38,19)-(38,21)
(38,22)-(38,24)
(38,26)-(38,34)
(38,26)-(38,37)
(38,35)-(38,37)
(39,3)-(39,50)
(39,17)-(39,31)
(39,17)-(39,43)
(39,32)-(39,33)
(39,34)-(39,38)
(39,39)-(39,43)
*)
