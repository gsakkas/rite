
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      match res with
      | h::t ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: t))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: t)))
      | [] ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: res))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec helper ans i l =
  if i = 0 then ans else helper (bigAdd ans l) (i - 1) l;;

let rec mulByDigit i l = helper 0 i l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      match res with
      | h::t ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: t))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: t)))
      | [] ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: res))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec helper ans i l =
  if i = 0 then ans else helper (bigAdd ans l) (i - 1) l;;

let rec mulByDigit i l = helper [0] i l;;

*)

(* changed spans
(49,32)-(49,33)
*)

(* type error slice
(14,13)-(14,37)
(14,13)-(14,37)
(14,28)-(14,29)
(14,35)-(14,37)
(15,12)-(15,46)
(15,12)-(15,46)
(15,27)-(15,28)
(15,34)-(15,44)
(15,34)-(15,46)
(17,3)-(44,36)
(17,11)-(44,34)
(17,14)-(44,34)
(18,2)-(44,34)
(44,2)-(44,12)
(44,2)-(44,34)
(47,25)-(47,31)
(47,25)-(47,56)
(47,32)-(47,46)
(47,33)-(47,39)
(49,25)-(49,31)
(49,25)-(49,37)
(49,32)-(49,33)
*)
