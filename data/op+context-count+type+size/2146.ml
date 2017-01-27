
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
          let (p1,p2) = a in
          (match p2 with
           | [] -> [res / 10; res mod 10]
           | a::b ->
               let re = a + (res mod 10) in (re / 10) :: (re mod 10) :: b) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
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
          let (p1,p2) = a in
          (match p2 with
           | [] -> (p1, [res / 10; res mod 10])
           | a::b ->
               let re = a + (res mod 10) in
               (p1, ((re / 10) :: (re mod 10) :: b))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,20)-(25,42)
(27,46)-(27,74)
(28,17)-(28,19)
(28,21)-(28,23)
(31,20)-(31,27)
(31,28)-(31,30)
(31,31)-(31,33)
*)

(* type error slice
(19,5)-(30,52)
(19,11)-(27,74)
(19,13)-(27,74)
(20,7)-(27,74)
(20,13)-(20,14)
(22,11)-(27,74)
(22,21)-(22,24)
(22,21)-(22,30)
(22,27)-(22,30)
(23,11)-(27,74)
(23,25)-(23,26)
(24,12)-(27,74)
(25,20)-(25,42)
(25,21)-(25,29)
(28,5)-(30,52)
(28,17)-(28,19)
(28,17)-(28,23)
(28,21)-(28,23)
(29,5)-(30,52)
(29,16)-(29,28)
(29,16)-(29,55)
(29,30)-(29,38)
(29,30)-(29,41)
(29,39)-(29,41)
(29,44)-(29,52)
(29,44)-(29,55)
(29,53)-(29,55)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
*)
