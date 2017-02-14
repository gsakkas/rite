
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> [helper t1; h1 mod 10] in
           helper [h]);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> (helper t1) @ [h1 mod 10] in
           helper [h]);;

*)

(* changed spans
(12,51)-(12,73)
(12,52)-(12,61)
(12,63)-(12,72)
(13,19)-(13,20)
*)

(* type error slice
(6,6)-(13,22)
(6,6)-(13,22)
(9,15)-(9,17)
(11,11)-(13,21)
(11,11)-(13,21)
(11,26)-(12,73)
(12,13)-(12,73)
(12,51)-(12,73)
(12,51)-(12,73)
(12,51)-(12,73)
(12,52)-(12,58)
(12,52)-(12,61)
(12,63)-(12,72)
(13,11)-(13,17)
(13,11)-(13,21)
*)
