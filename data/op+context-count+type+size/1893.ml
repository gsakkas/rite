
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
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
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
(22,12)-(24,64)
(23,30)-(23,31)
(23,30)-(23,35)
*)

(* type error slice
(17,5)-(27,48)
(17,11)-(24,64)
(17,13)-(24,64)
(18,7)-(24,64)
(19,34)-(19,41)
(19,34)-(19,49)
(19,43)-(19,49)
(20,7)-(24,64)
(20,13)-(20,14)
(22,12)-(24,64)
(22,18)-(22,19)
(23,19)-(23,55)
(23,30)-(23,31)
(23,30)-(23,35)
(23,30)-(23,40)
(23,34)-(23,35)
(23,39)-(23,40)
(23,44)-(23,51)
(23,44)-(23,55)
(23,52)-(23,55)
(25,5)-(27,48)
(25,16)-(25,18)
(26,5)-(27,48)
(26,16)-(26,28)
(26,16)-(26,34)
(26,29)-(26,31)
(26,32)-(26,34)
(27,15)-(27,29)
(27,15)-(27,41)
(27,30)-(27,31)
(27,32)-(27,36)
(27,37)-(27,41)
*)
