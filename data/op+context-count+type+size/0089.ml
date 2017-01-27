
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))
        (helper [] (h * i));;

*)

(* changed spans
(26,17)-(26,19)
(26,21)-(26,23)
(27,62)-(27,63)
(27,65)-(27,66)
(37,7)-(37,68)
*)

(* type error slice
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(2,50)-(2,55)
(4,4)-(7,80)
(4,13)-(7,76)
(4,16)-(7,76)
(5,3)-(7,76)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,10)-(6,21)
(6,10)-(6,72)
(6,10)-(6,77)
(6,23)-(6,28)
(6,23)-(6,66)
(6,29)-(6,30)
(6,33)-(6,66)
(6,70)-(6,72)
(6,75)-(6,77)
(10,3)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,62)-(10,63)
(12,4)-(29,37)
(12,12)-(29,33)
(12,15)-(29,33)
(13,3)-(29,33)
(13,12)-(28,52)
(14,5)-(28,52)
(14,11)-(25,57)
(14,13)-(25,57)
(15,7)-(25,57)
(15,13)-(15,14)
(17,12)-(25,57)
(17,18)-(17,19)
(19,17)-(25,57)
(21,25)-(21,27)
(21,25)-(21,32)
(21,25)-(21,38)
(21,25)-(21,48)
(21,25)-(22,28)
(21,30)-(21,32)
(21,43)-(21,48)
(21,54)-(21,69)
(21,54)-(22,28)
(22,23)-(22,28)
(26,5)-(28,52)
(26,17)-(26,19)
(26,17)-(26,23)
(26,21)-(26,23)
(27,5)-(28,52)
(27,16)-(27,27)
(27,16)-(27,68)
(27,29)-(27,37)
(27,29)-(27,57)
(27,39)-(27,51)
(27,39)-(27,57)
(27,52)-(27,54)
(27,55)-(27,57)
(27,60)-(27,68)
(27,62)-(27,63)
(27,62)-(27,66)
(27,65)-(27,66)
(28,5)-(28,52)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
(28,36)-(28,40)
(28,41)-(28,45)
(28,49)-(28,52)
(29,3)-(29,13)
(29,3)-(29,33)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(29,31)-(29,33)
(32,3)-(37,68)
(33,11)-(33,13)
(35,7)-(37,68)
(37,7)-(37,13)
(37,7)-(37,68)
*)
