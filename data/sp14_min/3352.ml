
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
      let rec adder x =
        match x with | [] -> [] | h::t -> [bigAdd h (adder t)] in
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
(38,43)-(38,63)
bigAdd h (adder t)
AppG [VarG,AppG [EmptyG]]

(39,7)-(41,32)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG [AppG [EmptyG,EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,57)
(2,40)-(2,57)
(2,41)-(2,46)
(2,47)-(2,48)
(4,4)-(7,80)
(4,13)-(7,78)
(4,16)-(7,78)
(6,9)-(6,73)
(6,10)-(6,21)
(6,22)-(6,69)
(6,23)-(6,28)
(6,29)-(6,30)
(6,70)-(6,72)
(7,13)-(7,77)
(7,14)-(7,25)
(7,26)-(7,73)
(7,27)-(7,32)
(7,74)-(7,76)
(10,3)-(10,70)
(10,9)-(10,10)
(10,37)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,69)-(10,70)
(12,4)-(29,37)
(12,12)-(29,35)
(12,15)-(29,35)
(13,3)-(29,35)
(29,3)-(29,13)
(29,3)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,28)-(29,30)
(29,31)-(29,33)
(31,4)-(41,34)
(31,20)-(41,32)
(31,22)-(41,32)
(32,3)-(41,32)
(35,7)-(41,32)
(37,7)-(41,32)
(37,21)-(38,63)
(38,9)-(38,63)
(38,43)-(38,63)
(38,44)-(38,50)
(38,44)-(38,62)
(38,51)-(38,52)
(38,53)-(38,62)
(38,54)-(38,59)
(38,60)-(38,61)
(39,7)-(39,12)
(39,7)-(41,32)
(40,9)-(41,32)
(40,10)-(40,67)
(40,11)-(40,21)
(40,68)-(40,69)
*)
