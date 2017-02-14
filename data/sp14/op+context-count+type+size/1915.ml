
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x = if x < 10 then x else [intlist (x / 10); x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) :: t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,41)-(18,42)
(18,48)-(18,76)
(18,49)-(18,65)
(18,67)-(18,75)
(21,10)-(23,65)
(22,18)-(22,54)
(22,28)-(22,39)
(22,29)-(22,30)
(23,21)-(23,64)
(23,46)-(23,59)
(23,46)-(23,64)
(24,4)-(26,47)
(25,4)-(26,47)
(26,4)-(26,47)
*)

(* type error slice
(17,4)-(26,47)
(17,10)-(23,65)
(18,26)-(18,76)
(18,26)-(18,76)
(18,29)-(18,30)
(18,29)-(18,35)
(18,29)-(18,35)
(18,33)-(18,35)
(18,41)-(18,42)
(18,48)-(18,76)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,17)-(21,18)
(22,18)-(22,54)
(22,28)-(22,35)
(22,29)-(22,30)
(22,43)-(22,50)
(22,43)-(22,54)
(23,21)-(23,64)
(23,46)-(23,59)
(23,46)-(23,64)
(23,46)-(23,64)
(23,47)-(23,54)
(24,4)-(26,47)
(24,15)-(24,17)
(26,14)-(26,28)
(26,14)-(26,40)
(26,29)-(26,30)
(26,31)-(26,35)
*)
