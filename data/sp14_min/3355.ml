
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
  | [] -> [0]
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [0] | h::t -> bigAdd h (adder t) in
      adder
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
           ((helper [] (h * i)) @ []));;


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
(33,11)-(33,14)
[]
ListG []

(37,46)-(37,49)
[]
ListG []

(38,7)-(40,39)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG [AppG [EmptyG,EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(4,4)-(7,80)
(4,13)-(7,78)
(6,51)-(6,67)
(6,52)-(6,63)
(6,64)-(6,66)
(12,4)-(29,37)
(12,12)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,28)-(29,30)
(36,9)-(36,67)
(36,23)-(36,26)
(36,32)-(36,38)
(36,32)-(36,67)
(36,39)-(36,58)
(36,40)-(36,50)
(36,54)-(36,57)
(37,25)-(37,78)
(37,60)-(37,66)
(37,60)-(37,78)
(37,67)-(37,68)
(37,69)-(37,78)
(37,70)-(37,75)
(37,76)-(37,77)
(38,7)-(38,12)
(38,7)-(40,39)
(39,9)-(40,39)
(39,68)-(39,69)
(40,12)-(40,38)
(40,13)-(40,32)
(40,14)-(40,20)
(40,33)-(40,34)
*)
