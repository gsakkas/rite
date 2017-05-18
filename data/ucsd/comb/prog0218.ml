
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (((mulByDigit i (List.rev t)) * 10) h) * i;;
