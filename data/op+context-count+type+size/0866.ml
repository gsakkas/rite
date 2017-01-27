
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = (bigAdd l l) + (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd (bigAdd l l) (mulByDigit (i - 1) l);;

*)

(* changed spans
(28,27)-(28,37)
(28,27)-(28,62)
(28,34)-(28,35)
(28,54)-(28,55)
(28,58)-(28,59)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(8,60)
(4,17)-(8,57)
(4,20)-(8,57)
(5,3)-(8,57)
(5,19)-(5,30)
(5,19)-(5,33)
(5,19)-(5,52)
(5,31)-(5,33)
(5,38)-(5,49)
(5,38)-(5,52)
(5,50)-(5,52)
(6,3)-(8,57)
(7,9)-(7,11)
(7,9)-(7,47)
(7,14)-(7,25)
(7,14)-(7,47)
(7,27)-(7,32)
(7,27)-(7,43)
(7,33)-(7,34)
(7,35)-(7,43)
(7,45)-(7,47)
(11,3)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(13,4)-(26,37)
(13,12)-(26,33)
(13,15)-(26,33)
(14,3)-(26,33)
(14,12)-(25,52)
(15,5)-(25,52)
(15,11)-(22,30)
(15,13)-(22,30)
(16,7)-(22,30)
(16,13)-(16,14)
(18,12)-(22,30)
(18,18)-(18,19)
(20,16)-(21,62)
(20,27)-(20,29)
(20,27)-(20,34)
(20,32)-(20,34)
(21,18)-(21,26)
(21,18)-(21,62)
(21,31)-(21,62)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,23)
(23,20)-(23,23)
(23,21)-(23,22)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,44)
(24,26)-(24,38)
(24,26)-(24,44)
(24,39)-(24,41)
(24,42)-(24,44)
(25,5)-(25,52)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(25,49)-(25,52)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
(28,27)-(28,33)
(28,27)-(28,37)
(28,27)-(28,62)
(28,34)-(28,35)
(28,36)-(28,37)
*)
