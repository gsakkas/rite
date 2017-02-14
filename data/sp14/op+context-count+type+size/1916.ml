
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
        if x < 10 then [x] else [intlist (x / 10); x mod 10] in
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
(19,32)-(19,60)
(19,33)-(19,49)
(19,51)-(19,59)
(22,10)-(24,65)
(23,18)-(23,54)
(23,28)-(23,39)
(23,29)-(23,30)
(24,46)-(24,59)
(24,46)-(24,64)
*)

(* type error slice
(17,4)-(27,47)
(17,10)-(24,65)
(18,6)-(24,65)
(18,22)-(19,60)
(19,8)-(19,60)
(19,23)-(19,26)
(19,32)-(19,60)
(19,32)-(19,60)
(19,33)-(19,40)
(19,33)-(19,49)
(19,51)-(19,59)
(22,10)-(24,65)
(22,10)-(24,65)
(22,10)-(24,65)
(22,10)-(24,65)
(22,10)-(24,65)
(22,17)-(22,18)
(23,18)-(23,54)
(23,28)-(23,35)
(23,29)-(23,30)
(23,43)-(23,50)
(23,43)-(23,54)
(24,21)-(24,64)
(24,46)-(24,59)
(24,46)-(24,64)
(24,46)-(24,64)
(24,47)-(24,54)
(25,4)-(27,47)
(25,15)-(25,17)
(27,14)-(27,28)
(27,14)-(27,40)
(27,29)-(27,30)
(27,31)-(27,35)
*)
