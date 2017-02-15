
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x y =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y) then matchHeads t (getTail y) else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads ["b"; "o"; "b"] (listReverse (explode w));;


(* fix

let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads [["b"]];;

*)

(* changed spans
(6,12)-(9,6)
(7,2)-(9,6)
(11,20)-(12,57)
(12,2)-(12,57)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,51)
(12,36)-(12,57)
(12,37)-(12,48)
(12,49)-(12,50)
(12,52)-(12,53)
(12,54)-(12,57)
(12,55)-(12,56)
(14,21)-(18,75)
(18,32)-(18,33)
(18,40)-(18,50)
(18,40)-(18,64)
(18,51)-(18,52)
(18,62)-(18,63)
(18,70)-(18,75)
(23,12)-(23,64)
(23,23)-(23,38)
(23,24)-(23,27)
(23,29)-(23,32)
(23,34)-(23,37)
(23,39)-(23,64)
(23,40)-(23,51)
(23,52)-(23,63)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(15,2)-(18,75)
(15,2)-(18,75)
(15,8)-(15,9)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,40)-(18,50)
(18,40)-(18,64)
(18,51)-(18,52)
(23,12)-(23,22)
(23,12)-(23,64)
(23,23)-(23,38)
(23,23)-(23,38)
(23,24)-(23,27)
*)
