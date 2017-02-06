
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
(2,4)-(2,68)
(2,15)-(2,64)
(2,17)-(2,64)
(2,21)-(2,64)
(2,21)-(2,64)
(2,24)-(2,25)
(2,24)-(2,30)
(2,24)-(2,30)
(2,24)-(2,30)
(2,29)-(2,30)
(2,36)-(2,38)
(2,44)-(2,45)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,50)-(2,64)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,60)
(2,59)-(2,64)
(2,63)-(2,64)
(4,4)-(8,60)
(4,17)-(8,57)
(4,20)-(8,57)
(5,19)-(5,30)
(5,19)-(5,33)
(5,19)-(5,33)
(5,31)-(5,33)
(5,38)-(5,49)
(5,38)-(5,52)
(5,38)-(5,52)
(5,50)-(5,52)
(7,9)-(7,11)
(7,9)-(7,47)
(7,14)-(7,25)
(7,14)-(7,47)
(7,27)-(7,32)
(7,27)-(7,43)
(7,45)-(7,47)
(8,10)-(8,21)
(8,10)-(8,52)
(8,50)-(8,52)
(10,20)-(11,75)
(11,3)-(11,75)
(11,3)-(11,75)
(11,3)-(11,75)
(11,3)-(11,75)
(11,3)-(11,75)
(11,9)-(11,10)
(11,24)-(11,26)
(11,37)-(11,75)
(11,40)-(11,41)
(11,40)-(11,45)
(11,51)-(11,61)
(11,51)-(11,63)
(13,4)-(26,37)
(13,12)-(26,33)
(13,15)-(26,33)
(14,3)-(26,33)
(14,12)-(25,52)
(15,5)-(25,52)
(15,11)-(22,30)
(15,13)-(22,30)
(16,13)-(16,14)
(18,12)-(22,30)
(18,12)-(22,30)
(18,12)-(22,30)
(18,12)-(22,30)
(18,18)-(18,19)
(20,27)-(20,29)
(20,32)-(20,34)
(20,38)-(20,40)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,44)
(24,16)-(24,44)
(24,26)-(24,38)
(24,26)-(24,44)
(24,26)-(24,44)
(24,26)-(24,44)
(24,39)-(24,41)
(24,42)-(24,44)
(25,19)-(25,33)
(25,19)-(25,45)
(25,19)-(25,45)
(25,19)-(25,45)
(25,34)-(25,35)
(25,41)-(25,45)
(26,15)-(26,18)
(26,15)-(26,33)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
(28,20)-(28,62)
(28,22)-(28,62)
(28,27)-(28,33)
(28,27)-(28,37)
(28,34)-(28,35)
(28,36)-(28,37)
(28,42)-(28,52)
(28,42)-(28,62)
(28,54)-(28,55)
*)
