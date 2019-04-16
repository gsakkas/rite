
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      [(mulByDigit m)
      ::
      t;
      ((h * i) / 10) + ((m * i) mod 10);
      (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,7)-(10,22)
mulByDigit i
           (m :: t) @ [((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(10,24)
(2,20)-(10,22)
(2,22)-(10,22)
(3,3)-(10,22)
(6,7)-(10,22)
(6,8)-(6,22)
(6,8)-(8,8)
(6,9)-(6,19)
(9,7)-(9,40)
(10,7)-(10,21)
*)
