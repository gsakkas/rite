
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
      let carry = match a with | (f,g) -> f in
      let digit =
        match x with
        | (f,g) ->
            if ((f + g) + carry) > 9
            then (1, ((f + g) + (carry mod 10)))
            else (0, ((f + g) + (carry mod 10))) in
      digit in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> (f + g) + (carry mod 10) in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,6)-(23,11)
(21,17)-(21,48)
(21,21)-(21,47)
(21,22)-(21,29)
(21,23)-(21,24)
(21,27)-(21,28)
(21,32)-(21,46)
(21,33)-(21,38)
(21,43)-(21,45)
(22,17)-(22,48)
(22,21)-(22,47)
(23,6)-(23,11)
(24,4)-(26,51)
(24,15)-(24,22)
(25,4)-(26,51)
(26,4)-(26,51)
*)

(* type error slice
(15,4)-(26,51)
(15,10)-(23,11)
(15,12)-(23,11)
(16,6)-(23,11)
(17,6)-(23,11)
(17,6)-(23,11)
(18,8)-(22,48)
(20,12)-(22,48)
(21,17)-(21,48)
(21,21)-(21,47)
(23,6)-(23,11)
(24,4)-(26,51)
(24,15)-(24,22)
(24,19)-(24,21)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,35)-(26,39)
*)
