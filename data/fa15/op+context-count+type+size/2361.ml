
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
(6,13)-(9,7)
(7,3)-(9,7)
(11,21)-(12,58)
(12,3)-(12,58)
(12,9)-(12,10)
(12,24)-(12,26)
(12,38)-(12,49)
(12,38)-(12,51)
(12,38)-(12,58)
(12,50)-(12,51)
(12,53)-(12,54)
(12,55)-(12,58)
(12,56)-(12,57)
(14,22)-(18,76)
(18,33)-(18,34)
(18,41)-(18,51)
(18,41)-(18,64)
(18,52)-(18,53)
(18,63)-(18,64)
(18,71)-(18,76)
(23,13)-(23,63)
(23,24)-(23,39)
(23,25)-(23,28)
(23,30)-(23,33)
(23,35)-(23,38)
(23,41)-(23,52)
(23,41)-(23,63)
(23,54)-(23,63)
*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(15,3)-(18,76)
(15,3)-(18,76)
(15,9)-(15,10)
(18,11)-(18,18)
(18,11)-(18,20)
(18,19)-(18,20)
(18,41)-(18,51)
(18,41)-(18,64)
(18,52)-(18,53)
(23,13)-(23,23)
(23,13)-(23,63)
(23,24)-(23,39)
(23,24)-(23,39)
(23,25)-(23,28)
*)
