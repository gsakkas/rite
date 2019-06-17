
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

let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | x::y ->
           let rec adder w =
             match w with | [] -> [] | a::b -> bigAdd a (adder b) in
           adder (x :: y));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(37,7)-(46,27)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG [AppG [EmptyG,EmptyG],ListG [EmptyG]]

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
(6,22)-(6,69)
(6,23)-(6,28)
(6,29)-(6,30)
(7,13)-(7,77)
(7,14)-(7,25)
(7,26)-(7,73)
(7,27)-(7,32)
(7,74)-(7,76)
(12,4)-(29,37)
(12,12)-(29,35)
(12,15)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,31)-(29,33)
(33,4)-(46,29)
(33,20)-(46,27)
(33,22)-(46,27)
(34,3)-(46,27)
(37,7)-(46,27)
(38,9)-(38,67)
(38,23)-(38,26)
(38,32)-(38,38)
(38,32)-(38,67)
(38,39)-(38,58)
(38,54)-(38,57)
(39,7)-(46,27)
(39,14)-(39,71)
(39,14)-(40,35)
(39,15)-(39,25)
(39,72)-(39,73)
(40,16)-(40,35)
(40,17)-(40,23)
(40,17)-(40,34)
(44,12)-(46,26)
(45,48)-(45,54)
(45,48)-(45,66)
(45,57)-(45,66)
(45,58)-(45,63)
(46,12)-(46,17)
(46,12)-(46,26)
*)
