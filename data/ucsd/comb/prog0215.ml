
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ 0) @ [h * i];;
