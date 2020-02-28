
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
(49,33)-(49,34)
[0]
ListG [LitG]

*)

(* type error slice
(14,14)-(14,38)
(14,29)-(14,30)
(14,36)-(14,38)
(15,13)-(15,47)
(15,28)-(15,29)
(15,35)-(15,45)
(15,35)-(15,47)
(17,4)-(44,37)
(17,12)-(44,35)
(17,15)-(44,35)
(18,3)-(44,35)
(44,3)-(44,13)
(44,3)-(44,35)
(47,26)-(47,32)
(47,26)-(47,57)
(47,33)-(47,47)
(47,34)-(47,40)
(49,26)-(49,32)
(49,26)-(49,38)
(49,33)-(49,34)
*)
