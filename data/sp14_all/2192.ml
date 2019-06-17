
let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (car,res) = ((res / 10), (res mod 10)) in
          let (c1,c2) = a in
          (match c1 with
           | [] -> ([car], (res :: c2))
           | y::s -> ((car :: s), ((res + y) :: c2))) in
    let base = ([], []) in
    let args = List.combine List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (car,res) = ((res / 10), (res mod 10)) in
          let (c1,c2) = a in
          (match c1 with
           | [] -> ([car], (res :: c2))
           | y::s -> ((car :: s), ((res + y) :: c2))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(29,16)-(29,52)
List.combine (List.rev l1)
             (List.rev l2)
AppG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(29,16)-(29,28)
(29,16)-(29,52)
*)
