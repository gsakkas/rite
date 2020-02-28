
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          let new_carry = ((a + d1) + d2) / 10 in
          let digit = ((a + d1) + d2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (d1,d2) ->
          let new_carry = ((carry + d1) + d2) / 10 in
          let digit = ((carry + d1) + d2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(19,62)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (d1 , d2) -> (let new_carry =
                  ((carry + d1) + d2) / 10 in
                let digit =
                  ((carry + d1) + d2) mod 10 in
                match a with
                | (x , y) -> (new_carry , digit :: y))
LetG NonRec [(VarPatG,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])] (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

*)

(* type error slice
(14,5)-(22,52)
(14,11)-(19,62)
(14,13)-(19,62)
(15,7)-(19,62)
(17,11)-(19,62)
(17,28)-(17,36)
(17,29)-(17,30)
(18,11)-(19,62)
(19,11)-(19,62)
(19,18)-(19,19)
(19,36)-(19,61)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)
