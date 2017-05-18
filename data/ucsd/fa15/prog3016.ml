
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((10 * h) * i) + (mulByDigit i t);;
