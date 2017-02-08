
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
        | (f,g)::t ->
            if ((f + g) + carry) > 9
            then (1, (((f + g) + (carry mod 10)) :: t))
            else (0, (((f + g) + (carry mod 10)) :: t)) in
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
(17,7)-(23,12)
(18,9)-(22,54)
(18,15)-(18,16)
(21,19)-(21,54)
(21,25)-(21,47)
(21,25)-(21,54)
(21,53)-(21,54)
(22,19)-(22,20)
(22,19)-(22,54)
(22,25)-(22,26)
(22,25)-(22,30)
(22,25)-(22,47)
(22,29)-(22,30)
(22,35)-(22,40)
(22,35)-(22,47)
(22,45)-(22,47)
(22,53)-(22,54)
(24,5)-(26,52)
(24,17)-(24,22)
(25,5)-(26,52)
(26,5)-(26,52)
*)

(* type error slice
(18,9)-(22,54)
(18,9)-(22,54)
(21,25)-(21,47)
(21,25)-(21,54)
(21,25)-(21,54)
(21,53)-(21,54)
(22,25)-(22,47)
(22,25)-(22,54)
(22,25)-(22,54)
(22,53)-(22,54)
*)
