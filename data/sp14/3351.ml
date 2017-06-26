
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> h in
      adder
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
           [helper [] (h * i)]);;


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
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(2,19)-(11,31)
(8,58)-(8,59)
(10,8)-(11,31)
(11,11)-(11,30)
(11,12)-(11,18)
*)

(* type error slice
(2,3)-(11,33)
(2,19)-(11,31)
(2,21)-(11,31)
(3,2)-(11,31)
(6,6)-(11,31)
(8,6)-(11,31)
(8,20)-(8,59)
(8,24)-(8,59)
(8,30)-(8,31)
(8,58)-(8,59)
(9,6)-(9,11)
(9,6)-(11,31)
(10,8)-(11,31)
(10,9)-(10,66)
(10,10)-(10,20)
(10,67)-(10,68)
*)

(* all spans
(2,19)-(11,31)
(2,21)-(11,31)
(3,2)-(11,31)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(11,31)
(6,21)-(7,66)
(6,25)-(7,66)
(7,8)-(7,66)
(7,11)-(7,16)
(7,11)-(7,12)
(7,15)-(7,16)
(7,22)-(7,25)
(7,31)-(7,66)
(7,31)-(7,37)
(7,38)-(7,57)
(7,39)-(7,49)
(7,40)-(7,41)
(7,46)-(7,48)
(7,53)-(7,56)
(7,58)-(7,66)
(7,59)-(7,60)
(7,63)-(7,65)
(8,6)-(11,31)
(8,20)-(8,59)
(8,24)-(8,59)
(8,30)-(8,31)
(8,45)-(8,47)
(8,58)-(8,59)
(9,6)-(11,31)
(9,6)-(9,11)
(10,8)-(11,31)
(10,67)-(10,68)
(10,9)-(10,66)
(10,10)-(10,20)
(10,21)-(10,22)
(10,23)-(10,65)
(10,24)-(10,32)
(10,33)-(10,64)
(10,34)-(10,42)
(10,43)-(10,61)
(10,54)-(10,60)
(10,54)-(10,55)
(10,58)-(10,60)
(10,62)-(10,63)
(11,11)-(11,30)
(11,12)-(11,29)
(11,12)-(11,18)
(11,19)-(11,21)
(11,22)-(11,29)
(11,23)-(11,24)
(11,27)-(11,28)
*)
