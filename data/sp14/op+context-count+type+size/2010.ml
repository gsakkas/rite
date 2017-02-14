
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
      let carry = match a with | (f,g::[]) -> f in
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
(16,19)-(16,48)
(17,7)-(23,12)
(21,19)-(21,46)
(21,24)-(21,25)
(21,24)-(21,29)
(21,24)-(21,46)
(21,28)-(21,29)
(21,34)-(21,39)
(21,34)-(21,46)
(21,44)-(21,46)
(22,19)-(22,46)
(22,24)-(22,46)
(23,7)-(23,12)
(24,5)-(26,52)
(24,17)-(24,22)
(25,5)-(26,52)
(26,5)-(26,52)
*)

(* type error slice
(15,5)-(26,52)
(15,11)-(23,12)
(15,13)-(23,12)
(16,7)-(23,12)
(16,19)-(16,48)
(16,19)-(16,48)
(16,25)-(16,26)
(17,7)-(23,12)
(17,7)-(23,12)
(18,9)-(22,46)
(20,13)-(22,46)
(21,19)-(21,46)
(21,24)-(21,46)
(23,7)-(23,12)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
*)
