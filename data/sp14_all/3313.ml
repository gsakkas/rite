
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;

*)

(* changed spans
(3,46)-(3,78)
List.append (mulByDigit i t)
            [(h * i) mod 10]
AppG [AppG [EmptyG,EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,80)
(2,20)-(3,78)
(2,22)-(3,78)
(3,3)-(3,78)
(3,46)-(3,78)
(3,47)-(3,57)
(3,47)-(3,61)
*)
